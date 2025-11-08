import 'package:langchain/langchain.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:tina_app/services/tools/user_tools_entity.dart';

/// Represents an available tool in the app
final class CalculatorTool extends UserToolEntity {
  const CalculatorTool();

  @override
  Tool<Object, ToolOptions, Object> getTool() {
    final parser = GrammarParser();
    final evaluator = RealEvaluator();
    return Tool.fromFunction<String, String>(
      name: 'calculator',
      description:
          'Useful for getting the result of a math expression '
          'that could be executed by a simple calculator.',
      inputJsonSchema: {
        'type': 'object',
        'properties': {
          'input': {
            'type': 'string',
            'description':
                'A valid mathematical expression to evaluate. '
                'For example: "(x^2 + cos(y)) / 3".',
          },
        },
        'required': ['input'],
      },
      func: (toolInput) async {
        try {
          final exp = parser.parse(toolInput);
          return evaluator.evaluate(exp).toString();
        } catch (e) {
          return "I don't know how to do that.";
        }
      },
    );
  }

  @override
  UserToolType get type => UserToolType.calculator;
}
