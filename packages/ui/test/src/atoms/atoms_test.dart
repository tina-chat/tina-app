/// Test suite for all atomic components.
///
/// This file imports and runs all atom widget tests to ensure comprehensive
/// coverage of the design system's atomic components.
library;

// Chat-specific atoms
import 'tina_attachment_preview_test.dart' as tina_attachment_preview_test;
import 'tina_avatar_test.dart' as tina_avatar_test;
import 'tina_badge_test.dart' as tina_badge_test;
import 'tina_button_test.dart' as tina_button_test;
import 'tina_connection_status_test.dart' as tina_connection_status_test;
import 'tina_divider_test.dart' as tina_divider_test;
import 'tina_icon_test.dart' as tina_icon_test;
import 'tina_input_test.dart' as tina_input_test;
import 'tina_message_bubble_test.dart' as tina_message_bubble_test;
import 'tina_message_status_test.dart' as tina_message_status_test;
import 'tina_spinner_test.dart' as tina_spinner_test;
import 'tina_text_test.dart' as tina_text_test;
import 'tina_typing_indicator_test.dart' as tina_typing_indicator_test;

void main() {
  // Core atoms
  tina_avatar_test.main();
  tina_badge_test.main();
  tina_button_test.main();
  tina_divider_test.main();
  tina_icon_test.main();
  tina_input_test.main();
  tina_spinner_test.main();
  tina_text_test.main();

  // Chat-specific atoms
  tina_attachment_preview_test.main();
  tina_connection_status_test.main();
  tina_message_bubble_test.main();
  tina_message_status_test.main();
  tina_typing_indicator_test.main();
}
