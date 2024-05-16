
abstract class FormsValidate {
  ///
  static String? select(dynamic itemValue, String leyend) {
    if (itemValue == null) {
      return leyend;
    }
    return null;
  }

  static String? inputString(String? strValue, String leyend) {
    if (strValue!.trim().isEmpty) {
      return leyend;
    }
    return null;
  }

  static String? email(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Correo electronico invalido'
        : value == ''
            ? 'Especificar el correo electronico'
            : null;
  }

  static String? password(String? value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!"@%#\/$&()=?¡¿*~]).{8,}$');
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ('Especificar contraseña');
    } else if (passNonNullValue.length < 8) {
      return ('La contraseña debe tener al menos 8 carácteres');
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ('La contraseña debe contener dígitos, mayúsculas, minúsculas y carácteres especiales');
    }
    return null;
  }
  }
