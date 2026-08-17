import 'package:glosseum_frontend/core/database/daos/information_dao.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'glosseum_database_provider.g.dart';

@Riverpod(keepAlive: true)
GlosseumDatabase glosseumDatabase(Ref ref) {
  final database = GlosseumDatabase();

  ref.onDispose(database.close);

  return database;
}
