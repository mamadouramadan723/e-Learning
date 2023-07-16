import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Email_Login widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  // State field(s) for Password_Login widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Email_SignUp widget.
  TextEditingController? emailSignUpController;
  String? Function(BuildContext, String?)? emailSignUpControllerValidator;
  // State field(s) for Password_SignUp widget.
  TextEditingController? passwordSignUpController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for Password_Confirmation_SignUp widget.
  TextEditingController? passwordConfirmationSignUpController;
  late bool passwordConfirmationSignUpVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmationSignUpControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    passwordSignUpVisibility = false;
    passwordConfirmationSignUpVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailLoginController?.dispose();
    passwordLoginController?.dispose();
    nameController?.dispose();
    emailSignUpController?.dispose();
    passwordSignUpController?.dispose();
    passwordConfirmationSignUpController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
