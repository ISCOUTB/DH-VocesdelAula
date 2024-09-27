import 'package:mysql1/mysql1.dart';

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

  //Función ára registrar un usuario
  Future<void> registerUser(
    int T5,
    String name,
    String email,
    String password,
    String tipo_usuario,
  ) async {
    var conn = await _getConnection();
    try {
      //Insercción de datos en la tabla 'Usuarios
      var result = await conn.query(
        'INSERT INTO Usuarios(T5,Nombre, Correo, Contraseña, Tipo_usuario) VALUES(?, ?, ?, ?, ?)',
        [T5, name, email, password, tipo_usuario],
      );

      print('Usuario registrado con éxito: ${result.insertId}');
    } catch (e) {
      throw Exception('Error al registrar el usuario: $e');
    } finally {
      await conn.close(); //Cerrar la conexión después de la consulta
    }
  }
}
