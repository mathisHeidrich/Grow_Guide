import 'package:drift/drift.dart';
import 'package:drift/web.dart';

DatabaseConnection openConnection() {
  return DatabaseConnection(WebDatabase('grow_guide_db', logStatements: true));
}

DatabaseConnection openMemoryConnection() {
  return DatabaseConnection(WebDatabase('test_db_${DateTime.now().millisecondsSinceEpoch}', logStatements: false));
}
