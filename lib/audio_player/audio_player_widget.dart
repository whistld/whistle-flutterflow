import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audio_player_model.dart';
export 'audio_player_model.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({
    super.key,
    this.cindex,
    this.received,
  });

  final int? cindex;
  final List<DocumentReference>? received;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioPlayerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.received = await actions.getMusics(
        widget.received!.toList(),
      );
      setState(() {
        _model.currentindex = widget.cindex;
      });
      _model.isFavorit = !functions.iscontained(
          widget.received?[widget.cindex!],
          (currentUserDocument?.favorites?.toList() ?? []).toList())!;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4B39EF), Color(0xE622178E)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(-0.34, 1.0),
                end: AlignmentDirectional(0.34, -1.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          fillColor: Color(0x16FFFFFF),
                          icon: Icon(
                            Icons.chevron_left_sharp,
                            color: FlutterFlowTheme.of(context).lineColor,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Playning now',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).gray200,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.volume_up_sharp,
                                color: FlutterFlowTheme.of(context).lineColor,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 40.0, 0.0),
                        child: Icon(
                          Icons.queue_music_sharp,
                          color: FlutterFlowTheme.of(context).lineColor,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: double.infinity,
                          height: 700.0,
                          child: custom_widgets.AudioPlayerScreen(
                            width: double.infinity,
                            height: 700.0,
                            specificIndex: _model.currentindex,
                            listofSongs: _model.received
                                ?.map((e) => e.filePath)
                                .toList(),
                            listoftitle: _model.received
                                ?.map((e) => e.songTitle)
                                .toList(),
                            listoimages: _model.received
                                ?.map((e) => e.songCover)
                                .toList(),
                            favoriteStatus: functions.iscontained(
                                widget.received?[widget.cindex!],
                                (currentUserDocument?.favorites?.toList() ?? [])
                                    .toList()),
                            actiononNext: () async {},
                            favoritebtn: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'uiyiu',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                            onTogglefavorit: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'added',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'Favorites': FieldValue.arrayUnion(
                                        [widget.received?[widget.cindex!]]),
                                  },
                                ),
                              });
                              setState(() {
                                _model.isFavorit = true;
                              });
                            },
                            onToggleunfavorit: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'removed',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              setState(() {
                                _model.isFavorit = false;
                              });

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'Favorites': FieldValue.arrayRemove(
                                        [widget.received?[widget.cindex!]]),
                                  },
                                ),
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
