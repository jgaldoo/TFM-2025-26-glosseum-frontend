import 'package:uuid/uuid.dart';

final _uuid = Uuid();

String newUUID() => _uuid.v7();
