import os
import time
import subprocess
import shutil
import re

# Buscar automáticamente la ruta del binario de flutter
flutter_path = shutil.which("flutter")

# Verificar si se encontró el comando flutter en el sistema
if flutter_path is None:
    print("Error: No se encontró el comando flutter en el sistema.\nAsegúrate de que Flutter esté instalado y agregado al path.\n")
    exit(1)
else:
    print(f"Flutter encontrado en: {flutter_path}")

# Preguntar la ruta donde se quiere ejecutar el proyecto de flutter
ruta_proyect = input("Ingresa la ruta del proyecto:\n")

# Ruta del archivo Dart a monitorear
file_to_watch = os.path.join(ruta_proyect, "lib/main.dart")

# Verifica si el archivo existe
if not os.path.exists(file_to_watch):
    print(f"El archivo {file_to_watch} no existe. Por favor, verifica la ruta.")
    exit(1)

# Obtener la última vez que se modificó el archivo
last_modified_time = os.path.getmtime(file_to_watch)

# Variable para el proceso Flutter
process = None

def search_and_remove_ui_web(folder_path):
    """Busca y elimina cualquier referencia a dart:ui_web en los archivos .dart de la carpeta 'lib'."""
    print("Buscando referencias a 'dart:ui_web' en los archivos .dart de la carpeta 'lib'...\n")
    
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith(".dart"):
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    content = f.readlines()

                with open(file_path, 'w') as f:
                    for line in content:
                        if "dart:ui_web" not in line:
                            f.write(line)
                        else:
                            print(f"Referencia 'dart:ui_web' encontrada y eliminada en: {file_path}")

def get_devices():
    """Obtiene la lista de dispositivos conectados."""
    result = subprocess.run([flutter_path, "devices"], capture_output=True, text=True)
    output = result.stdout
    devices = []
    lines = output.splitlines()
    for i, line in enumerate(lines):
        if line.strip() and not line.startswith('['):
            match = re.search(r'•\s*(\w+)', line)
            if match:
                devices.append(line.strip())
    return devices

def select_device(devices):
    """Permite al usuario seleccionar un dispositivo de la lista proporcionada."""
    print("Dispositivos conectados:")
    for i, device in enumerate(devices):
        print(f"{i + 1}: {device}")
    print('[q]: Salir')
    
    while True:
        choice = input("Selecciona uno:\n")
        if choice.lower() == 'q':
            print("Saliendo...")
            exit(0)
        try:
            index = int(choice) - 1
            if 0 <= index < len(devices):
                return devices[index].split('•')[1].strip()  # Devuelve el ID del dispositivo
            else:
                print("Elección no válida. Inténtalo de nuevo.")
        except ValueError:
            print("Elección no válida. Inténtalo de nuevo.")

def run_flutter(device_id):
    global process
    # Si ya hay un proceso corriendo, termínalo
    if process:
        print("Cerrando instancia anterior de Flutter....\n")
        process.terminate() # Intentar terminar el proceso
        try:
            process.wait(timeout=5) # Esperar un tiempo para que el proceso termine
        except subprocess.TimeoutExpired:
            print("El proceso anterior no se cerró correctamente, forzando cierre....\n")
            process.kill() # Forzar el cierre si el proceso no termina
    
    # Ejecutar el nuevo comando Flutter en la ruta específica
    print(f"Ejecutando Flutter en {device_id}...\n")
    process = subprocess.Popen([flutter_path, "run", "-d", device_id], cwd=ruta_proyect, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    
    # Leer y mostrar la salida en tiempo real
    while True:
        output = process.stdout.readline()
        if output == '' and process.poll() is not None:
            break
        if output:
            print(output.strip())
        # Capturar errores del proceso
        error_output = process.stderr.readline()
        if error_output:
            print(f"ERROR: {error_output.strip()}")

try:
    # Buscar y eliminar 'dart:ui_web' en la carpeta 'lib'
    search_and_remove_ui_web(os.path.join(ruta_proyect, "lib"))

    # Obtener la lista de dispositivos
    devices = get_devices()
    
    if not devices:
        print("No se encontraron dispositivos. Asegúrate de que estén conectados y configurados correctamente.")
        exit(1)
    
    # Seleccionar el dispositivo
    selected_device = select_device(devices)
    
    # Ejecutar Flutter antes de iniciar el monitoreo
    run_flutter(selected_device)
    
    # Una vez que Flutter ha sido lanzado, comenzamos a monitorear cambios
    print("Monitoreando cambios en el archivo main.dart...")
    
    while True:
        # Comprobar si el archivo ha sido modificado
        current_modified_time = os.path.getmtime(file_to_watch)
        if current_modified_time != last_modified_time:
            print(f"\nEl archivo {file_to_watch} ha sido modificado.")
            last_modified_time = current_modified_time

            # Buscar y eliminar 'dart:ui_web' nuevamente antes de ejecutar Flutter
            search_and_remove_ui_web(os.path.join(ruta_proyect, "lib"))

            run_flutter(selected_device)  # Ejecutar Flutter tras detectar cambios
            
            print("Monitoreando cambios...")
            time.sleep(2)  # Esperar 2 segundos antes de volver a comprobar
            
except KeyboardInterrupt:
    if process:
        print("\nTerminando el proceso de Flutter...\n")
        process.terminate()  # Terminar el proceso de Flutter
    print("Monitoreo terminado.")
