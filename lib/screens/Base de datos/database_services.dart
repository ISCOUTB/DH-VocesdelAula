// ignore_for_file: non_constant_identifier_names
// ignore: unused_import
// ignore: unused_import
import 'dart:io';
import 'package:mysql1/mysql1.dart';
// ignore: unused_import

//Voces del Aula
class DatabaseServices {
  //Crear una función para establecer la conexión a MySQL
  Future<MySqlConnection> _getConnection() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Farya12nc',
      db: 'Voces del Aula',
    );
    return await MySqlConnection.connect(settings);
  }

  //Cambiar la clave del Usuario
  Future<void> ChangePassword(int T5, String NewPassword) async {
    //Espera que la conexion se complete correctamente
    var conn = await _getConnection();

    try {
      //Verificar si el usuario existe
      var checkQuery = 'SELECT * FROM Usuarios WHERE  T5 =?';
      var existingUser = await conn.query(checkQuery, [T5]);

      if (existingUser.isNotEmpty) {
        //Actualizar la contraseña
        var updateQuery = 'UPDATE Usuarios SET Contraseña = ? WHERE T5 =?';
        var result = await conn.query(updateQuery, [NewPassword, T5]);

        if (result.affectedRows! > 0) {
          print('Contraseña actualizada con éxito.');
        } else {
          throw Exception('No se pudo cambiar la contraseña. ');
        }
      } else {
        throw Exception('Vuelve y entra al programa, intenta de nuevo');
      }
    } catch (e) {
      print('Error al cambiar la contraseña: $e');
    } finally {
      await conn.close();
    }
  }

  //Validación para ingresar
  Future<int?> EnterUser(String email, String password) async {
    var conn = await _getConnection();
    try {
      // Consulta corregida para verificar si el usuario existe
      var checkQuery =
          'SELECT * FROM Usuarios WHERE Correo = ? AND Contraseña = ?';
      print('Ejecutando logón...');

      //Si el usuario existe (correo y contrañsea coinciden), retura true
      var existingUser = await conn.query(checkQuery, [email, password]);
      if (existingUser.isNotEmpty) {
        print('Iniciando sección');
        var row = existingUser.first;
        int T5 = row[0];
        return T5;
      } else {
        print('El correo o la contraseña no son correctos');
        return null;
      }
    } catch (e) {
      print('Error en la consulta: $e');
      return null;
    } finally {
      await conn.close(); //Cerrar la conexión
    }
  }

  Future<Map<String, dynamic>> getTipoUsuario(int T5) async {
    try {
      var conn =
          await _getConnection(); // Asegúrate de que _getConnection() esté bien implementado
      var result = await conn.query(
        'SELECT Tipo_usuario, T5 FROM Usuarios WHERE T5 = ?',
        [T5], // Se pasa el parámetro T5 de manera segura
      );

      if (result.isNotEmpty) {
        // Si la consulta es exitosa, obtenemos el tipo de usuario y el T5
        return {
          'Tipo_usuario':
              result.first[0], // Tipo de usuario (Profesor o Alumno)
          'T5': result.first[1], // T5 del usuario
        };
      } else {
        // Si no se encuentra el usuario, retornamos valores predeterminados
        return {'Tipo_usuario': 'Desconocido', 'T5': -1};
      }
    } catch (e) {
      print('Error al obtener tipo de usuario: $e');
      return {
        'Tipo_usuario': 'Desconocido',
        'T5': -1
      }; // Valor por defecto en caso de error
    }
  }

  //Insertar un Profesor en la tabla Profesor
  Future<void> registerProfesor(int T5_profesor, String name) async {
    var conn = await _getConnection();
    try {
      var checkQuery = 'SELECT * FROM Profesor WHERE T5_profesor = ?';
      var existingProfesor = await conn.query(checkQuery, [T5_profesor]);

      if (existingProfesor.isNotEmpty) {
        throw Exception('El T000 ya existe en el sistema...');
      } else {
        //Insercción de datos en la tabla 'Profesor'
        var result = await conn.query(
          'INSERT INTO Profesor(T5_profesor, Nombre_Pro) VALUES(?, ?)',
          [T5_profesor, name],
        );
        print('Profesor registrado con éito: ${result.insertId}.');
      }
    } catch (e) {
      throw Exception("$e".toString());
    } finally {
      await conn.close();
    }
  }

  //Obtener Profesores
  Future<List<String>> getProfessors() async {
    var conn = await _getConnection();
    List<String> professors = [];

    try {
      var results = await conn.query('SELECT Nombre_Pro FROM Profesor');
      for (var row in results) {
        professors.add(row['Nombre_Pro'] as String);
      }
    } catch (e) {
      print('Error al obtener los profesores: $e');
    } finally {
      await conn.close();
    }
    return professors;
  }

  //Obtener detalles del profesor
  Future<Map<String, dynamic>?> getProfesorDetails(int userT5) async {
    var conn = await _getConnection();

    try {
      var query =
          'SELECT Nombre_Pro, Asignautra FROM Profesor WHERE T5_profesor = ?';
      var result = await conn.query(query, []);

      if (result.isNotEmpty) {
        var row = result.first;
        return {'Nombre': row['Nombre_Pro'], 'Asignatura': row['Asignatura']};
      } else {
        print('Profesor no encontrado,,');
        return null;
      }
    } catch (e) {
      print('Error al obtener los detalles del profesor: $e');
      return null;
    } finally {
      await conn.close();
    }
  }

  //Obtener T5
  Future<Map<String, dynamic>?> getUserDetail(int T5) async {
    var conn = await _getConnection();
    Map<String, dynamic>? userDetails;

    try {
      //Obtener los datos básicos del usuario desde la tabla Usuarios
      var userQuery =
          'SELECT T5, Nombre_U, Correo, Tipo_usuario FROM Usuarios WHERE T5 =?';
      var userResult = await conn.query(userQuery, [T5]);

      if (userResult.isNotEmpty) {
        var userRow = userResult.first;
        userDetails = {
          'T5': userRow['T5'],
          'Nombre': userRow['Nombre_U'],
          'Correo': userRow['Correo'],
          'Tipo_usuario': userRow['Tipo_usuario']
        };

        //Obtener detalles adicionales según el tipo de usuario
        //Profesor
        if (userRow['Tipo_usuario'] == 'Profesor') {
          var profQuery =
              'SELECT Asignatura FROM Profesor WHERE T5_profesor = ?';
          var profResult = await conn.query(profQuery, [T5]);
          if (profResult.isNotEmpty) {
            userDetails['Asignatura'] =
                await conn.query(profResult.first['Asignautra']);
          }
          //Alumno
          else if (userRow['Tipo_usuario'] == 'Alumno') {
            var alumQuery = 'SELECT Semestre FROM Alumno WHERE T5_alumno =?';
            var alumResult = await conn.query(alumQuery, [T5]);
            if (alumResult.isNotEmpty) {
              userDetails['Semestre'] = alumResult.first['Semestre'];
            }
          }
        }
      }
    } catch (e) {
      print('Error al obtener el código T5: $e');
    } finally {
      await conn.close();
    }
    return userDetails;
  }

  //Insertar un Alumno en la tabla Alumno
  Future<void> registerAlumno(int T5_alumno, String name) async {
    var conn = await _getConnection();
    try {
      var checkQuery = 'SELECT * FROM Alumno WHERE T5_alumno = ?';
      var existingProfesor = await conn.query(checkQuery, [T5_alumno]);

      if (existingProfesor.isNotEmpty) {
        throw Exception('El T000 ya existe en el sistema...');
      } else {
        //Insercción de datos en la tabla 'Alumno'
        var result = await conn.query(
          'INSERT INTO Alumno(T5_alumno, Nombre) VALUES(?, ?)',
          [T5_alumno, name],
        );
        print('Alumno registrado con éito: ${result.insertId}.');
      }
    } catch (e) {
      throw Exception("$e".toString());
    } finally {
      await conn.close();
    }
  }

  //Función para registrar un usuario
  // ignore: unused_element
  Future<void> registerUser(
    int T5,
    String name,
    String email,
    String password,
    String tipo_usuario,
    String nombre_Asing,
  ) async {
    var conn = await _getConnection();
    try {
      //Verificar si el correo o el código T5 ya existen
      var checkQuery = 'SELECT * FROM Usuarios WHERE T5 = ? OR Correo =?';
      var existingUser = await conn.query(checkQuery, [email, T5]);

      //Insercción de datos en la tabla 'Usuarios'
      if (existingUser.isNotEmpty) {
        throw Exception('El correo o el código ya existen en el sistema..');
      } else {
        var result = await conn.query(
            'INSERT INTO Usuarios(T5,Nombre_U, Correo, Contraseña, Tipo_usuario) VALUES(?, ?, ?, ?, ?)',
            [T5, name, email, password, tipo_usuario]);
        //Inserción en la tabla Profesor
        if (tipo_usuario == 'Profesor') {
          await conn.query(
              'INSERT INTO Profesor(T5_profesor, Nombre_Pro, Asignatura) VALUES(?, ?, ?)',
              [T5, name, nombre_Asing]);
          await conn.query(
              'INSERT INTO Asignaturas(Nombre_Asig, Nombre_profesor, T5_profesor) VALUES(?, ?, ?)',
              [nombre_Asing, name, T5]);
        } else {
          (tipo_usuario == 'Alumno');
          await conn.query(
              'INSERT INTO Alumno(T5_alumno, Nombre_A) VALUES(?, ?)',
              [T5, name]);
        }

        print('Usuario registrado con éxito: ${result.insertId}');
      }
    } catch (e) {
      throw Exception("$e".toString());
    } finally {
      await conn.close(); //Cerrar la conexión después de la consulta
    }
  }
}

//Voces_Calificaciones
/*
class DataBaseServices {
  // ignore: unused_element
  Future<MySqlConnection> _getConnection() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Farya12nc',
      db: 'Voces_Calificaciones',
    );
    return await MySqlConnection.connect(settings);
  }
  Future<void> registerCalification(
    int ID_Calificaciones,
    int T5_Profesor,
    String Nombre_profesor,
    String Notas,
    Float calificaciones,
  ) async {
    var conn = await _getConnection();
    try{
      //Verificar si el Código T5 ya existe
      var code = 'SELECT * FROM '
    }catch(e){
      //
    }
  }
}*/
