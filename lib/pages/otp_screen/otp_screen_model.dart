import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_page/home_page_widget.dart';
import 'otp_screen_widget.dart' show OtpScreenWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpScreenModel extends FlutterFlowModel<OtpScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for OTPCode widget.
  TextEditingController? oTPCode;
  String? Function(BuildContext, String?)? oTPCodeValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    oTPCode = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oTPCode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
