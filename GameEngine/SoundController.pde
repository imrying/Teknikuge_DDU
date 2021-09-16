import processing.sound.*;
class SoundController {

  SoundFile backgroundMusic;
  SoundFile jumpSound;
  SoundFile gravityChange;

  SoundController() {
    backgroundMusic = new SoundFile(GameEngine.this, "background music lydfil");
    jumpSound = new SoundFile(GameEngine.this, "SFX_Jump_50.wav");
    gravityChange = new SoundFile(GameEngine.this, "space shield sounds - 1.wav");

    //  backgroundMusic.loop();
  }

  int playSound(int SoundId) {
    if (SoundId == 0) {

      jumpSound.play();
    }

    if (SoundId == 1) {

      gravityChange.play();
    }
    return SoundId;
  }
}
