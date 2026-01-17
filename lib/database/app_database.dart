import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static Database? _db;

  // 🔹 Get database instance
  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  // 🔹 Initialize DB
  static Future<Database> _init() async {
    final path = join(await getDatabasesPath(), 'quick_assist.db');

    return openDatabase(
      path,
      version: 3, // ⬅️ increase version when schema changes
      onCreate: (db, _) async {
        await _createAllTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await _createSettingsTable(db);
        }
        if (oldVersion < 3) {
          await _createPersonalDetailsTable(db);
        }
      },
    );
  }

  // 🔹 Create ALL tables
  static Future<void> _createAllTables(Database db) async {
    // 🔐 Security (PIN)
    await db.execute('''
      CREATE TABLE IF NOT EXISTS security (
        id INTEGER PRIMARY KEY,
        pin TEXT
      )
    ''');

    // ⚙️ App settings (SOS, live location numbers)
    await _createSettingsTable(db);

    // 🧍 Personal emergency details
    await _createPersonalDetailsTable(db);
  }

  // 🔹 Settings table
  static Future<void> _createSettingsTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS settings (
        key TEXT PRIMARY KEY,
        value TEXT
      )
    ''');
  }

  // 🔹 Personal details table
  static Future<void> _createPersonalDetailsTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS personal_details (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age TEXT,
        blood_group TEXT,
        allergies TEXT,
        medical_notes TEXT
      )
    ''');
  }

  // =========================
  // 📞 SOS NUMBER CRUD
  // =========================
  static Future<void> saveSosNumber(String number) async {
    final database = await db;
    await database.insert(
      'settings',
      {'key': 'sos_number', 'value': number},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<String?> getSosNumber() async {
    final database = await db;
    final result = await database.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['sos_number'],
    );
    return result.isNotEmpty ? result.first['value'] as String : null;
  }

  // =========================
  // 📍 LIVE LOCATION NUMBER CRUD
  // =========================
  static Future<void> saveLiveLocationNumber(String number) async {
    final database = await db;
    await database.insert(
      'settings',
      {'key': 'live_location_number', 'value': number},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<String?> getLiveLocationNumber() async {
    final database = await db;
    final result = await database.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['live_location_number'],
    );
    return result.isNotEmpty ? result.first['value'] as String : null;
  }

  // =========================
  // 🧍 PERSONAL DETAILS CRUD
  // =========================
  static Future<void> savePersonalDetails({
    required String name,
    required String age,
    required String bloodGroup,
    required String allergies,
    required String medicalNotes,
  }) async {
    final database = await db;
    await database.insert(
      'personal_details',
      {
        'id': 1, // single user profile
        'name': name,
        'age': age,
        'blood_group': bloodGroup,
        'allergies': allergies,
        'medical_notes': medicalNotes,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<Map<String, dynamic>?> getPersonalDetails() async {
    final database = await db;
    final result = await database.query(
      'personal_details',
      where: 'id = 1',
    );
    return result.isNotEmpty ? result.first : null;
  }

  // =========================
  // 🔥 CLEAR ALL DATA (PIN RESET)
  // =========================
  static Future<void> clearAll() async {
    final database = await db;
    await database.delete('security');
    await database.delete('settings');
    await database.delete('personal_details');
  }
}
