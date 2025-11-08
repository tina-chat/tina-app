import 'package:langchain/langchain.dart';

enum UserToolType {
  calculator('calculator');

  final String value;
  const UserToolType(this.value);
}

/// Represents an available tool in the app
abstract class UserToolEntity {
  /// Type identifier for the tool
  UserToolType get type;

  const UserToolEntity();

  Tool getTool();
}
