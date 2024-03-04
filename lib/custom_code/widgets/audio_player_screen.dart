// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom widgets
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration? position;
  final Duration? bufferedPosition;
  final Duration? duration;
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    Key? key,
    this.width,
    this.height,
    this.listofSongs,
    this.specificIndex,
    this.actiononNext,
    this.listoftitle,
    this.listoimages,
    this.favoritebtn,
    this.favoriteStatus,
    required this.onTogglefavorit,
    required this.onToggleunfavorit,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String>? listofSongs;
  final int? specificIndex;
  final List<String>? listoftitle;
  final Future<dynamic> Function()? actiononNext;
  final List<String>? listoimages;
  final Future<dynamic> Function()? favoritebtn;
  final bool? favoriteStatus;
  final Future<dynamic> Function() onTogglefavorit;
  final Future<dynamic> Function() onToggleunfavorit;

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final _audioPlayer = AudioPlayer();
  late bool isFavorited;

  late ConcatenatingAudioSource _playlist;
  late List<String> album = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  @override
  void initState() {
    super.initState();
    album = widget.listofSongs ?? album;
    isFavorited = widget.favoriteStatus ?? false;
    init();
  }

  @override
  void didUpdateWidget(AudioPlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.listofSongs != oldWidget.listofSongs) {
      setState(() {
        album = widget.listofSongs ?? album;
      });
      init();
    }
    if (widget.favoriteStatus != oldWidget.favoriteStatus) {
      setState(() {
        isFavorited = widget.favoriteStatus ?? false;
      });
    }
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration?, Duration?, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration),
      );

  List<AudioSource> getSources() {
    final sources = <AudioSource>[];
    for (final url in album) {
      sources.add(AudioSource.uri(Uri.parse(url)));
    }
    return sources;
  }

  void initStates() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final sources = <AudioSource>[];
    for (final url in widget.listofSongs ?? []) {
      sources.add(AudioSource.uri(Uri.parse(url)));
    }
    _playlist = ConcatenatingAudioSource(children: sources);
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlist);
    await _audioPlayer.seek(Duration.zero,
        index: widget.specificIndex ?? 0); // Seek to specific index
    await _audioPlayer.play(); // Autoplay
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorited = widget.favoriteStatus ?? false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder<PositionData>(
          stream: positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            final currentSongIndex = _audioPlayer.currentIndex ?? 0;
            final currentSongTitle =
                widget.listoftitle?[currentSongIndex] ?? 'Unknown Title';
            return Column(
              children: [
                if (widget.listoimages != null &&
                    _audioPlayer.currentIndex != null &&
                    _audioPlayer.currentIndex! < widget.listoimages!.length)
                  Container(
                    width: 280,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Color(0x27000000),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 9,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                          spreadRadius: 8,
                        )
                      ],
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        widget.listoimages![_audioPlayer.currentIndex!],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      currentSongTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ToggleButtons(
                      isSelected: [isFavorited],
                      onPressed: (index) {
                        setState(() {
                          isFavorited = !isFavorited;
                          if (isFavorited) {
                            widget.onTogglefavorit!();
                          } else {
                            widget.onToggleunfavorit!();
                          }
                        });
                      },
                      children: [
                        Icon(
                          isFavorited
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorited ? Colors.red : Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Generated code for this Image Widget...

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ProgressBar(
                    barHeight: 8,
                    baseBarColor: Colors.grey[600],
                    bufferedBarColor: Colors.grey[400],
                    progressBarColor: Colors.red[400],
                    thumbColor: Colors.red[400],
                    timeLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: (duration) {
                      _audioPlayer.seek(duration);
                    },

                    // ...
                  ),
                ),
              ],
            );
          },
        ),
        Controls(audioPlayer: _audioPlayer),
      ],
    );
  }
}

class Controls extends StatefulWidget {
  const Controls({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  String name = 'dfs';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => widget.audioPlayer.seekToPrevious(),
          icon: const Icon(Icons.skip_previous_rounded),
          iconSize: 40,
          color: Colors.white,
        ),
        StreamBuilder<PlayerState>(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: () => widget.audioPlayer.play(),
                icon: const Icon(Icons.play_arrow_rounded),
                iconSize: 80,
                color: Colors.white,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: () => widget.audioPlayer.pause(),
                icon: const Icon(Icons.pause_rounded),
                iconSize: 80,
                color: Colors.white,
              );
            }
            return const Icon(
              Icons.play_arrow_rounded,
              size: 80,
              color: Colors.white,
            );
          },
        ),
        IconButton(
          onPressed: () => widget.audioPlayer.seekToNext(),
          icon: const Icon(Icons.skip_next_rounded),
          iconSize: 40,
          color: Colors.white,
        ),
      ],
    );
  }
}
