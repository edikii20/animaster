// part of '../signup_page.dart';

// class _SignUpPageUsernameInputWidgest extends StatelessWidget {
//   const _SignUpPageUsernameInputWidgest({
//     Key? key,
//     required TextEditingController usernameInputController,
//     required FocusNode emailInputFocusNode,
//   })  : _usernameInputController = usernameInputController,
//         _emailInputFocusNode = emailInputFocusNode,
//         super(key: key);

//   final TextEditingController _usernameInputController;
//   final FocusNode _emailInputFocusNode;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpPageCubit, SignUpPageState>(
//       buildWhen: (previous, current) =>
//           previous.correctUsername != current.correctUsername,
//       builder: (context, state) {
//         return TextField(
//           controller: _usernameInputController,
//           onChanged: (value) =>
//               context.read<SignUpPageCubit>().validateUsername(text: value),
//           onSubmitted: (_) => _emailInputFocusNode.requestFocus(),
//           textInputAction: TextInputAction.next,
//           style: AppTextStyles.bold(
//             fontSize: 18,
//             color: AppColors.mainBlack,
//           ),
//           cursorColor: AppColors.mainBlack,
//           cursorRadius: const Radius.circular(100),
//           decoration: InputDecoration(
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainBlack,
//               ),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainPurple,
//               ),
//             ),
//             suffixIcon: state.correctUsername == null
//                 ? null
//                 : Container(
//                     width: 24,
//                     height: 24,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: state.correctUsername!
//                         ? Image.asset(
//                             'assets/images/correct_icon.png',
//                             color: Colors.green,
//                           )
//                         : Image.asset(
//                             'assets/images/incorrect_icon.png',
//                             color: Colors.red,
//                           ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }


// part of '../signup_page.dart';

// class _SignUpPagePasswordInputWidgest extends StatelessWidget {
//   const _SignUpPagePasswordInputWidgest({
//     Key? key,
//     required TextEditingController passwordInputController,
//     required FocusNode passwordInputFocusNode,
//   })  : _passwordInputController = passwordInputController,
//         _passwordInputFocusNode = passwordInputFocusNode,
//         super(key: key);

//   final TextEditingController _passwordInputController;
//   final FocusNode _passwordInputFocusNode;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpPageCubit, SignUpPageState>(
//       buildWhen: (previous, current) =>
//           previous.passwordObscure != current.passwordObscure ||
//           previous.correctPassword != current.correctPassword,
//       builder: (context, state) {
//         return TextField(
//           controller: _passwordInputController,
//           onChanged: (value) =>
//               context.read<SignUpPageCubit>().validatePassword(text: value),
//           focusNode: _passwordInputFocusNode,
//           textInputAction: TextInputAction.done,
//           style: AppTextStyles.bold(
//             fontSize: 18,
//             color: AppColors.mainBlack,
//           ),
//           cursorColor: AppColors.mainBlack,
//           cursorRadius: const Radius.circular(100),
//           obscureText: state.passwordObscure,
//           decoration: InputDecoration(
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainBlack,
//               ),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainPurple,
//               ),
//             ),
//             suffixIcon: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     width: 24,
//                     height: 24,
//                     child: state.correctPassword == null
//                         ? null
//                         : state.correctPassword!
//                             ? Image.asset(
//                                 'assets/images/correct_icon.png',
//                                 color: Colors.green,
//                               )
//                             : Image.asset(
//                                 'assets/images/incorrect_icon.png',
//                                 color: Colors.red,
//                               ),
//                   ),
//                   SizedBox(width: 5),
//                   GestureDetector(
//                     onTap: () =>
//                         context.read<SignUpPageCubit>().onTapObscurePassword(),
//                     child: Icon(
//                       state.passwordObscure
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                       color: AppColors.mainPurple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


// part of '../signup_page.dart';

// class _SignUpPageEmailInputWidgest extends StatelessWidget {
//   const _SignUpPageEmailInputWidgest({
//     Key? key,
//     required TextEditingController emailInputController,
//     required FocusNode passwordInputFocusNode,
//     required FocusNode emailInputFocusNode,
//   })  : _emailInputController = emailInputController,
//         _passwordInputFocusNode = passwordInputFocusNode,
//         _emailInputFocusNode = emailInputFocusNode,
//         super(key: key);

//   final TextEditingController _emailInputController;
//   final FocusNode _passwordInputFocusNode;
//   final FocusNode _emailInputFocusNode;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignUpPageCubit, SignUpPageState>(
//       buildWhen: (previous, current) =>
//           previous.correctEmail != current.correctEmail,
//       builder: (context, state) {
//         return TextField(
//           controller: _emailInputController,
//           onChanged: (value) =>
//               context.read<SignUpPageCubit>().validateEmail(text: value),
//           onSubmitted: (_) => _passwordInputFocusNode.requestFocus(),
//           focusNode: _emailInputFocusNode,
//           textInputAction: TextInputAction.next,
//           style: AppTextStyles.bold(
//             fontSize: 18,
//             color: AppColors.mainBlack,
//           ),
//           cursorColor: AppColors.mainBlack,
//           cursorRadius: const Radius.circular(100),
//           decoration: InputDecoration(
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainBlack,
//               ),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.mainPurple,
//               ),
//             ),
//             suffixIcon: state.correctEmail == null
//                 ? null
//                 : Container(
//                     width: 24,
//                     height: 24,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: state.correctEmail!
//                         ? Image.asset(
//                             'assets/images/correct_icon.png',
//                             color: Colors.green,
//                           )
//                         : Image.asset(
//                             'assets/images/incorrect_icon.png',
//                             color: Colors.red,
//                           ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }


// part of '../signup_page.dart';

// class _SignUpPageDividerWidgest extends StatelessWidget {
//   const _SignUpPageDividerWidgest({
//     Key? key,
//     required Size sizeRatio,
//   })  : _sizeRatio = sizeRatio,
//         super(key: key);

//   final Size _sizeRatio;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 1,
//             margin: EdgeInsets.only(right: 10 * _sizeRatio.width),
//             color: AppColors.mainDisableLight.withOpacity(0.3),
//           ),
//         ),
//         Text(
//           'or',
//           style: AppTextStyles.medium(
//             fontSize: 15,
//             color: AppColors.mainSecondaryLight,
//           ),
//         ),
//         Expanded(
//           child: Container(
//             height: 1,
//             margin: EdgeInsets.only(left: 10 * _sizeRatio.width),
//             color: AppColors.mainDisableLight.withOpacity(0.3),
//           ),
//         ),
//       ],
//     );
//   }
// }



// part of '../signup_page.dart';

// class _SignUpPageRememberMeWidgest extends StatelessWidget {
//   const _SignUpPageRememberMeWidgest({
//     Key? key,
//     required Size sizeRatio,
//   })  : _sizeRatio = sizeRatio,
//         super(key: key);

//   final Size _sizeRatio;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         BlocBuilder<SignUpPageCubit, SignUpPageState>(
//           buildWhen: (previous, current) =>
//               previous.rememberMe != current.rememberMe,
//           builder: (context, state) {
//             return SizedBox(
//               width: 24 * _sizeRatio.width,
//               height: 24 * _sizeRatio.width,
//               child: Checkbox(
//                 value: state.rememberMe,
//                 onChanged: (_) =>
//                     context.read<SignUpPageCubit>().onTapRememberme(),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 overlayColor:
//                     MaterialStateProperty.all<Color>(Colors.transparent),
//                 fillColor:
//                     MaterialStateProperty.all<Color>(AppColors.mainPurple),
//               ),
//             );
//           },
//         ),
//         SizedBox(width: 10 * _sizeRatio.width),
//         Text(
//           'Remember me',
//           style: AppTextStyles.medium(
//             fontSize: 15,
//             color: AppColors.mainBlack,
//           ),
//         ),
//       ],
//     );
//   }
// }


