import 'package:mongo_dart/mongo_dart.dart';
import 'package:project_setup_flutter_getx/services/db_constant.dart';

import '../model/user/user_model.dart';

class MongoDBService{
  // Singleton instance
  static final MongoDBService _instance = MongoDBService._internal();

  late Db _db;
  late DbCollection _userCollection;
  bool _isConnected = false;

  // Private constructor
  MongoDBService._internal();

  // Factory constructor to return the singleton instance
  factory MongoDBService() => _instance;

  Future<void> connect() async {
    if (!_isConnected) {
      _db = await Db.create(DbConstant.MONGO_CONN_URL);
      await _db.open();
      _userCollection = _db.collection(DbConstant.USER_COLLECTION_NAME);
      _isConnected = true;
      print("Database connected: ${_db.isConnected}");
    }
  }


  // Future<void> connect() async {
  //   _db = await Db.create(DbConstant.MONGO_CONN_URL);
  //   await _db.open();
  //   _userCollection = _db.collection(DbConstant.USER_COLLECTION_NAME);
  //   print("Database connected: ${_db.isConnected}");
  // }
  Future<User?> login(String username, String password) async {
    try {
      print("credentials=>"+username+"\n"+password);
      final user = await _userCollection
          .findOne(where.eq('emailID', username.toString().trim()).eq('password', password));
      return user != null ? User.fromJson(user) : null;
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }
  Future<void> registerUser(User user) async {
    try {
      await _userCollection.insertOne(user.toJson());
      print("User registered: ${user}");
    } catch (e) {
      print("Error registering user: $e");
    }
  }
  Future<List<User>> getAllUsers() async {
    try {
      final userDocs = await _userCollection.find().toList();
      return userDocs.map((doc) => User.fromJson(doc)).toList();
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }
  Future<void> close() async {
    if (_isConnected) {
      await _db.close();
      _isConnected = false;
      print("Database connection closed.");
    }
  }

  bool get isConnected => _isConnected;
}