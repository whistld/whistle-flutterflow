import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? audiopathtostring(String? audio) {
  // audiopath to string
  if (audio == null) {
    return null;
  }
  final String? audiopath = audio.toString();
  return audiopath;
}

bool? iscontained(
  DocumentReference? musics,
  List<DocumentReference>? listofFavorits,
) {
  // check if musics is contain in list if favorite ?
  if (listofFavorits == null) {
    return false;
  }
  if (musics == null) {
    return false;
  }
  if (listofFavorits.contains(musics)) {
    return true;
  } else {
    return false;
  }
}

List<MusicRecord>? favoritFilter(
  List<DocumentReference>? usersFavorite,
  List<MusicRecord>? allSong,
) {
  // filter All Music that usersFavorite reffrene match with allSong
  if (usersFavorite == null || allSong == null) {
    return null;
  }
  List<MusicRecord>? result = [];
  for (int i = 0; i < usersFavorite.length; i++) {
    for (int j = 0; j < allSong.length; j++) {
      if (usersFavorite[i] == allSong[j].reference) {
        result.add(allSong[j]);
      }
    }
  }
  return result;
}

bool? checkifapplied(
  DocumentReference? userID,
  List<DocumentReference>? appliedusersList,
) {
  // Return true if userID is Contain in the list of applieduserlist
  if (userID == null || appliedusersList == null) {
    return false;
  }
  return appliedusersList.contains(userID);
}
