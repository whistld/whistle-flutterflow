import '/components/events_b_t_n_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'show_event_widget.dart' show ShowEventWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowEventModel extends FlutterFlowModel<ShowEventWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for eventsBTN component.
  late EventsBTNModel eventsBTNModel1;
  // Model for eventsBTN component.
  late EventsBTNModel eventsBTNModel2;
  // Model for eventsBTN component.
  late EventsBTNModel eventsBTNModel3;
  // Model for eventsBTN component.
  late EventsBTNModel eventsBTNModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    eventsBTNModel1 = createModel(context, () => EventsBTNModel());
    eventsBTNModel2 = createModel(context, () => EventsBTNModel());
    eventsBTNModel3 = createModel(context, () => EventsBTNModel());
    eventsBTNModel4 = createModel(context, () => EventsBTNModel());
  }

  @override
  void dispose() {
    eventsBTNModel1.dispose();
    eventsBTNModel2.dispose();
    eventsBTNModel3.dispose();
    eventsBTNModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
