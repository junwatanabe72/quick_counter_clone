import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundPool {
  static hitSound() async {
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId =
        await rootBundle.load("assets/hit.mp3").then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }
}
