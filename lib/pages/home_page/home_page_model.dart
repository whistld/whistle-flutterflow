import '/audio_player/audio_player_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_music/nav_bar_music_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/artistpage_album/artistpage_album_widget.dart';
import '/pages/list_arts/list_arts_widget.dart';
import '/pages/list_events/list_events_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchController;
  String? Function(BuildContext, String?)? textFieldSearchControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for NavBarMusic component.
  late NavBarMusicModel navBarMusicModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarMusicModel = createModel(context, () => NavBarMusicModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldSearchFocusNode?.dispose();
    textFieldSearchController?.dispose();

    navBarMusicModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
