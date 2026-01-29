// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // MODEL
// class SignUpModel {
//   String name;
//   String email;
//   String password;

//   SignUpModel({this.name = '', this.email = '', this.password = ''});

//   SignUpModel copyWith({String? name, String? email, String? password}) {
//     return SignUpModel(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//     );
//   }
// }

// // VIEWMODEL (Riverpod StateNotifier)
// class SignUpViewModel extends StateNotifier<SignUpModel> {
//   SignUpViewModel() : super(SignUpModel());

//   bool _showPassword = false;
//   bool get showPassword => _showPassword;

//   void setName(String value) {
//     state = state.copyWith(name: value);
//   }

//   void setEmail(String value) {
//     state = state.copyWith(email: value);
//   }

//   void setPassword(String value) {
//     state = state.copyWith(password: value);
//   }

//   void toggleShowPassword() {
//     _showPassword = !_showPassword;
//     // No need to update state, just notify listeners
//     state = state.copyWith();
//   }

//   void submit() {
//     print(
//         'Name: ${state.name}, Email: ${state.email}, Password: ${state.password}');
//   }
// }

// // PROVIDER
// final signUpProvider =
//     StateNotifierProvider<SignUpViewModel, SignUpModel>((ref) {
//   return SignUpViewModel();
// });

// // PROVIDER for showPassword
// final showPasswordProvider = Provider<bool>((ref) {
//   final viewModel = ref.watch(signUpProvider.notifier);
//   return viewModel.showPassword;
// });

// // VIEW
// class SignUpApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProviderScope(
//       child: MaterialApp(
//         home: AnimatedSignUpForm(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// class AnimatedSignUpForm extends StatefulWidget {
//   @override
//   State<AnimatedSignUpForm> createState() => _AnimatedSignUpFormState();
// }

// class _AnimatedSignUpFormState extends State<AnimatedSignUpForm>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _formAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _formAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOutBack,
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Widget _buildTextField({
//     required String label,
//     required IconData icon,
//     bool isPassword = false,
//     required String value,
//     required ValueChanged<String> onChanged,
//     bool showPassword = false,
//     VoidCallback? onTogglePassword,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextField(
//         obscureText: isPassword && !showPassword,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon),
//           labelText: label,
//           border: OutlineInputBorder(),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                       showPassword ? Icons.visibility : Icons.visibility_off),
//                   onPressed: onTogglePassword,
//                 )
//               : null,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       body: Center(
//         child: ScaleTransition(
//           scale: _formAnimation,
//           child: Container(
//             width: 350,
//             padding: EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 16,
//                   offset: Offset(0, 8),
//                 ),
//               ],
//             ),
//             child: Consumer(
//               builder: (context, ref, _) {
//                 final signUp = ref.watch(signUpProvider);
//                 final viewModel = ref.read(signUpProvider.notifier);
//                 final showPassword = ref.watch(showPasswordProvider);

//                 return Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[700],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     _buildTextField(
//                       label: "Name",
//                       icon: Icons.person,
//                       value: signUp.name,
//                       onChanged: viewModel.setName,
//                     ),
//                     _buildTextField(
//                       label: "Email",
//                       icon: Icons.email,
//                       value: signUp.email,
//                       onChanged: viewModel.setEmail,
//                     ),
//                     _buildTextField(
//                       label: "Password",
//                       icon: Icons.lock,
//                       isPassword: true,
//                       value: signUp.password,
//                       onChanged: viewModel.setPassword,
//                       showPassword: showPassword,
//                       onTogglePassword: viewModel.toggleShowPassword,
//                     ),
//                     SizedBox(height: 20),
//                     AnimatedContainer(
//                       duration: Duration(milliseconds: 400),
//                       curve: Curves.easeIn,
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue[700],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: viewModel.submit,
//                         child: Text(
//                           "Create Account",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(SignUpApp());
