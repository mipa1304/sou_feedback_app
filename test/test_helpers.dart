import 'package:sou_feedback_app/locator.dart';
import 'package:sou_feedback_app/services/navigation_service.dart';
import 'package:sou_feedback_app/services/dialogService.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FakeNavigationService extends NavigationService {
  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    // no-op for tests
    return null;
  }

  @override
  Future<dynamic> pushReplacementTo(String routeName,
      {dynamic arguments}) async {
    return null;
  }
}

class FakeDialogService extends DialogService {
  @override
  Future showCustomDialog(widget) async {
    return null;
  }
}

/// Initialize test doubles and register them with the app locator.
Future<void> initTestServices() async {
  // Reset any existing registrations
  await locator.reset();

  locator
      .registerLazySingleton<NavigationService>(() => FakeNavigationService());
  locator.registerLazySingleton<DialogService>(() => FakeDialogService());

  // Optionally create fake Firestore instance and register if your code uses locator to access it.
  // For classes that directly call FirebaseFirestore.instance, prefer injecting a FakeFirebaseFirestore via constructor.
}
