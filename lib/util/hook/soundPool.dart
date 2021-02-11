import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundPool {
  static hitSound(String soundPath) async {
    if (soundPath == "") {
      return;
    }
    Soundpool pool = Soundpool(streamType: StreamType.notification);
    int soundId = await rootBundle.load(soundPath).then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }
}
