import os
import subprocess
import shutil

def find_lampp_executable():
    #Ruta donde se espera encontrar el ejecutable
    executable_path = '/opt/lampp/lampp'
    
    #Comprobar si el archivo existe y es ejecutable
    if(os.path.isfile(executable_path) and os.access(executable_path, os.X_OK)):
        return executable_path
    else:
        return None
def execute_command_as_root(command):
    try:
        #Ejecutar el comando con sudo
        result = subprocess.run(['sudo'] + command, check=True, text=True, capture_output=True)
        print("Comando ejecutado con éxito:...\n")
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error al ejecutar el comando: {e}")
        print(f"Mensaje de error: {e.stderr}")
        return None
        
def is_lampp_active(executable_path):
    #Verificar el estado de XAMPP
    status_output = execute_command_as_root([executable_path, 'status'])
    if(status_output and 'Apache is running' in status_output):
        return False
    
def start_lampp(executable_path):
    #Iniciar XAMPP
    print("Iniciando XAMPP----\n")
    execute_command_as_root([executable_path, 'start'])
    
def stop_lampp(executable_path):
    #Detener XAMPP
    execute_command_as_root([executable_path, 'stop'])
    
def main():
    #Buscar el ejecutable de lampp
    executable_path = find_lampp_executable()
    
    if(not executable_path):
        print("No se encontró el ejecutable de lampp en /opt/lampp/lampp o no tiene permiso de ejecución...\n")
        return
        
    #Verifiar si lampp está activo
    if(not is_lampp_active(executable_path)):
        print("XAMPP no está activo. Iniciándolo...")
        start_lampp(executable_path)
        
    #Bucle para controlar el estado de lampp
    while True:
        print("\nXAMPP está activo.")
        print("Opciones: [stop] para detener, [exit] para salir.")
        command = input("Ingrese una opción: ").strip().lower()
        
        if(command == 'stop'):
            print("XAMPP ha sido detenido.")
            break
        elif(command =='exit'):
            print("Saliendo del programa")
            break
        else:
            print("Opción no válida. Intente de nuevo..")
    
if __name__ == "__main__":
    main()