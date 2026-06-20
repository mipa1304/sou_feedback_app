import 'package:flutter_test/flutter_test.dart';
import 'package:sou_feedback_app/locator.dart';
import 'package:sou_feedback_app/provider/base_model.dart';
import 'package:sou_feedback_app/enum/view_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Register minimal services used by BaseModel
    setupLocator();
  });

  group('BaseModel basic behavior', () {
    test('initial srno is empty', () {
      final model = BaseModel();
      expect(model.srno, isEmpty);
    });

    test(
        'updateTextBoxWithAudioPath does not overwrite existing controller text and notifies',
        () {
      final model = BaseModel();
      var notified = false;
      model.addListener(() => notified = true);

      // initial controller text is empty
      expect(model.fileRemarkController.text, '');

      model.updateTextBoxWithAudioPath('incoming-path');

      // when empty, the controller should be populated with the incoming path
      expect(model.fileRemarkController.text, 'incoming-path');
      expect(notified, isTrue);
    });

    test('updateTextBoxWithAudioPath preserves prefilled text and notifies',
        () {
      final model = BaseModel();
      model.fileRemarkController.text = 'existing';
      var notified = false;
      model.addListener(() => notified = true);

      model.updateTextBoxWithAudioPath('new-path');

      expect(model.fileRemarkController.text, 'existing');
      expect(notified, isTrue);
    });

    test('setState notifies listeners', () {
      final model = BaseModel();
      var notified = false;
      model.addListener(() => notified = true);

      model.setState(ViewState.busy);

      expect(notified, isTrue);
    });
  });
}
