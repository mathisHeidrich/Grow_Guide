import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/database.dart';

final databaseProvider = Provider<DatabaseService>((ref) {
  throw UnimplementedError('Database is uninitialized');
});
