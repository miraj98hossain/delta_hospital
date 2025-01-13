import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  // Private constructor
  SembastDatabase._internal();

  // The single instance of the class
  static final SembastDatabase _instance = SembastDatabase._internal();

  // Getter to access the instance
  static SembastDatabase get instance => _instance;

  // The database instance
  Database? _database;

  // Method to initialize the database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // Initialize the database
    _database = await _initializeDatabase();
    return _database!;
  }

  // Private method to initialize the database
  Future<Database> _initializeDatabase() async {
    // Get the application documents directory
    final dir = await getApplicationDocumentsDirectory();

    // Ensure the directory exists
    await dir.create(recursive: true);

    // Build the database path
    final dbPath = join(dir.path, 'delta_hospital.db');

    // Open and return the database
    return await databaseFactoryIo.openDatabase(dbPath);
  }
}
