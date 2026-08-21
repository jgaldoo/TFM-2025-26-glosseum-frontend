import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'glosseum_database_provider.g.dart';

@Riverpod(keepAlive: true)
GlosseumDatabase glosseumDatabase(Ref ref) {
  final database = GlosseumDatabase();

  ref.onDispose(database.close);

  return database;
}

Future<void> resetDatabase(WidgetRef ref) async {
  final database = ref.read(glosseumDatabaseProvider);

  await database.deleteDatabase();

  ref.invalidate(glosseumDatabaseProvider);
}
