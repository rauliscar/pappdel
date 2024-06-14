// ignore_for_file: unnecessary_getters_setters
class EquipoPadel {
  int? _idSede;
  int? _idEquipo;
  late String _nombreEquipo;
  String? _logo;

  // Constructor por defecto
  EquipoPadel() {
    _idSede = 0;
    _idEquipo = 0;
    _nombreEquipo = '';
    _logo = '';
  }

  // Constructor sin id
  EquipoPadel.withoutId(this._nombreEquipo, this._logo);

  // Constructor con id
  EquipoPadel.withId(this._idSede, this._idEquipo, this._nombreEquipo, this._logo);

  // Constructor desde map
  EquipoPadel.fromMap(Map<String, dynamic> map) {
    _idSede = (map['id_sede'] != null) ? map['id_sede'] : null;
    _idEquipo = (map['id_equipo'] != null) ? map['id_equipo'] : null;
    _nombreEquipo = (map['nombre_equipo'] != null) ? map['nombre_equipo'] : '';
    _logo = (map['logo'] != null) ? map['logo'] : '';
  }

  // Getters y setters
  int? get idSede => _idSede;
  int? get idEquipo => _idEquipo;
  String get nombreEquipo => _nombreEquipo;
  String? get logo => _logo;

  set idSede(int? idSede) {
    _idSede = idSede;
  }

  set idEquipo(int? idEquipo) {
    _idEquipo = idEquipo;
  }

  set nombreEquipo(String nombreEquipo) {
    _nombreEquipo = nombreEquipo;
  }

  set logo(String? logo) {
    _logo = logo;
  }

  // Objeto equipo a mapa
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (_idSede != null) map['id_sede'] = _idSede;
    if (_idEquipo != null) map['id_equipo'] = _idEquipo;
    map['nombre_equipo'] = _nombreEquipo;
    map['logo'] = _logo;

    return map;
  }
}
