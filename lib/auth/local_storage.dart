import 'package:reservapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage() {
    return _instance;
  }

  late SharedPreferences _prefs;

  LocalStorage._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }

  Future<bool?> setUser(int id, String email, String name, String pictureUrl) async {
    await _setId(id).then((value) {
      if (value == null) return null;
    });
    await _setEmail(email).then((value) {
      if (value == null) return null;
    });
    await _setName(name).then((value) {
      if (value == null) return null;
    });
    await _setPictureUrl(pictureUrl).then((value) {
      if (value == null) return null;
    });

    return true;
  }

  Future<bool?> removeUser() async {
    await _removeId().then((value) {
      if (value == null) return null;
    });
    await _removeEmail().then((value) {
      if (value == null) return null;
    });
    await _removeName().then((value) {
      if (value == null) return null;
    });
    await _removePictureUrl().then((value) {
      if (value == null) return null;
    });

    return true;
  }

  Future<User?> getUser() async {
    Map<String, dynamic> json = {};

    json['id'] = await getId();
    json['nome'] = await getName();
    json['email'] = await getEmail();
    json['fotoURL'] = await getPictureUrl();

    return User.fromJson(json);
  }

  Future<bool?> _setId(int id) async {
    return await _prefs.setInt('id', id);
  }

  Future<bool?> _setName(String name) async {
    return await _prefs.setString('name', name);
  }

  Future<bool?> _setEmail(String email) async {
    return await _prefs.setString('email', email);
  }

  Future<bool?> _setPictureUrl(String pictureUrl) async {
    return await _prefs.setString('pictureUrl', pictureUrl);
  }

  Future<bool?> _removeId() async {
    return await _prefs.remove('id');
  }

  Future<bool?> _removeName() async {
    return await _prefs.remove('name');
  }

  Future<bool?> _removeEmail() async {
    return await _prefs.remove('email');
  }

  Future<bool?> _removePictureUrl() async {
    return await _prefs.remove('pictureUrl');
  }

  Future<int?> getId() async {
    int? result;

    try {
      result = _prefs.getInt('id');
    } catch (e) {
      result = null;
    }

    return result;
  }

  Future<String?> getName() async {
    String? result;

    try {
      result = _prefs.getString('name');
    } catch (e) {
      result = null;
    }

    return result;
  }

  Future<String?> getEmail() async {
    String? result;

    try {
      result = _prefs.getString('email');
    } catch (e) {
      result = null;
    }

    return result;
  }

  Future<String?> getPictureUrl() async {
    String? result;

    try {
      result = _prefs.getString('pictureUrl');
    } catch (e) {
      result = null;
    }

    return result;
  }
}
