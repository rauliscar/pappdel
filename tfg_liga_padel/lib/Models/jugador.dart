class JugadorPadel {
  int? _idJugador;
  late String _nombreUsuario;
  // ignore: unused_field
  String? _password;
  late String _nombre;
  late String _apellidos;
  late String _email;
  late String _genero;
  late String _telefono;
  late String _dni;
  late String _fechaNacimiento;
  String? _fotoPerfil;
  int? _idEquipo;

  // Constructor por defecto
  JugadorPadel() {
    _idJugador = 0;
    _nombreUsuario = '';
    _nombre = '';
    _apellidos = '';
    _email = '';
    _genero = '';
    _telefono = '';
    _dni = '';
    _fechaNacimiento = '';
    _fotoPerfil = '';
    _idEquipo = 0;
  }

  // Constructor sin id
  JugadorPadel.withoutId(this._nombreUsuario, this._password, this._nombre, this._apellidos, this._email, this._genero, this._telefono, this._dni, this._fechaNacimiento, this._fotoPerfil, this._idEquipo);

  // Constructor con id
  JugadorPadel.withId(this._idJugador, this._nombreUsuario, this._password, this._nombre, this._apellidos, this._email, this._genero, this._telefono, this._dni, this._fechaNacimiento, this._fotoPerfil, this._idEquipo);

  // Constructor desde map
  JugadorPadel.fromMap(Map<String, dynamic> map) {
    _idJugador = (map['id_jugador'] != null) ? map['id_jugador'] : null;
    _nombreUsuario = (map['nombre_usuario'] != null) ? map['nombre_usuario'] : '';
    _nombre = (map['nombre'] != null) ? map['nombre'] : '';
    _apellidos = (map['apellidos'] != null) ? map['apellidos'] : '';
    _email = (map['email'] != null) ? map['email'] : '';
    _genero = (map['genero'] != null) ? map['genero'] : '';
    _telefono = (map['telefono'] != null) ? map['telefono'] : '';
    _dni = (map['dni'] != null) ? map['dni'] : '';
    _fechaNacimiento = (map['fecha_nacimiento'] != null) ? map['fecha_nacimiento'] : '';
    _fotoPerfil = (map['foto_perfil'] != null) ? map['foto_perfil'] : '';
    _idEquipo = (map['id_equipo'] != null) ? map['id_equipo'] : null;
  }

  // Getters y setters
  int? get idJugador => _idJugador;
  String get nombreUsuario => _nombreUsuario;
  String get nombre => _nombre;
  String get apellidos => _apellidos;
  String get email => _email;
  String get genero => _genero;
  String get telefono => _telefono;
  String get dni => _dni;
  String get fechaNacimiento => _fechaNacimiento;
  String? get fotoPerfil => _fotoPerfil;
  int? get idEquipo => _idEquipo;

  set idJugador(int? idJugador) {
    _idJugador = idJugador;
  }

  set nombreUsuario(String nombreUsuario) {
    _nombreUsuario = nombreUsuario;
  }

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set apellidos(String apellidos) {
    _apellidos = apellidos;
  }

  set email(String email) {
    _email = email;
  }

  set genero(String genero) {
    _genero = genero;
  }

  set telefono(String telefono) {
    _telefono = telefono;
  }

  set dni(String dni) {
    _dni = dni;
  }

  set fechaNacimiento(String fechaNacimiento) {
    _fechaNacimiento = fechaNacimiento;
  }

  set fotoPerfil(String? fotoPerfil) {
    _fotoPerfil = fotoPerfil;
  }

  set idEquipo(int? idEquipo) {
    _idEquipo = idEquipo;
  }

  // Objeto jugador a mapa
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (_idJugador != null) map['id_jugador'] = _idJugador;
    map['nombre_usuario'] = _nombreUsuario;
    map['nombre'] = _nombre;
    map['apellidos'] = _apellidos;
    map['email'] = _email;
    map['genero'] = _genero;
    map['telefono'] = _telefono;
    map['dni'] = _dni;
    map['fecha_nacimiento'] = _fechaNacimiento;
    map['foto_perfil'] = _fotoPerfil;
    if (_idEquipo != null) map['id_equipo'] = _idEquipo;

    return map;
  }
}
