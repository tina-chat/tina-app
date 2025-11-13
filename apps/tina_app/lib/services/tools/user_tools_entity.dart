import 'package:async/async.dart';
import 'package:langchain/langchain.dart';

enum UserToolType {
  calculator('calculator');

  final String value;
  const UserToolType(this.value);
  static UserToolType? fromValue(String value) {
    for (UserToolType enumVariant in UserToolType.values) {
      if (enumVariant.name == value) return enumVariant;
    }
    return null;
  }
}

/// Represents an available tool in the app
abstract class UserToolEntity<Input, Options, Output> {
  /// Type identifier for the tool
  UserToolType get type;

  const UserToolEntity();

  ToolSpec getTool();

  CancelableOperation<Output> runner(Input toolInput);
}
