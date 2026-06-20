This project test scaffold and plan.

How to run tests locally:

```bash
flutter test
```

Current status:
- Basic unit tests for `BaseModel` added: `test/provider/base_model_test.dart`.
- Widget tests for `feedback.dart` helpers: `test/widgets/feedback_widget_test.dart`.

Next recommended steps:
1. Decide whether to mock Firebase and platform plugins (recommended for unit tests).
2. If yes, add dev dependencies such as `fake_cloud_firestore` and `mockito`, then refactor services to accept injectable instances.
3. Create `test/test_helpers.dart` with `initTestServices()` to register test doubles with the app's `locator`.
4. Incrementally convert classes that access `Firebase.instance` at construction to accept optional instances or getters (already partially done for `BaseModel`).
5. Add CI workflow to run `flutter test` on PRs.

If you want, I can:
- Add `fake_cloud_firestore` and `mockito` to `pubspec.yaml` and create `test/test_helpers.dart`.
- Start refactoring `BaseModel` and other classes to accept injectable dependencies.

Which step should I take next?