import '/audio_player/audio_player_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_music/nav_bar_music_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list_songs_widget.dart' show ListSongsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListSongsModel extends FlutterFlowModel<ListSongsWidget> {
  ///  Local state fields for this page.

  List<String> albumsongList = [];
  void addToAlbumsongList(String item) => albumsongList.add(item);
  void removeFromAlbumsongList(String item) => albumsongList.remove(item);
  void removeAtIndexFromAlbumsongList(int index) =>
      albumsongList.removeAt(index);
  void insertAtIndexInAlbumsongList(int index, String item) =>
      albumsongList.insert(index, item);
  void updateAlbumsongListAtIndex(int index, Function(String) updateFn) =>
      albumsongList[index] = updateFn(albumsongList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    navBarMusicModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
