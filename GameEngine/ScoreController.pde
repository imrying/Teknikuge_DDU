class ScoreController {
  float currentScore;
  float highScore;


  ScoreController() {
  }

  float update() {
    if (frameCount >= 60) {
      currentScore +=10;
      frameCount = 0;
    }
    if (currentScore > highScore) {
      highScore = currentScore;
    }
    return log(3.4+currentScore/350);
  }


  void render() {
    textSize(30);
    fill(255);
    text("score", 25, height/2+10);
    text(int(currentScore), 125, height/2+10);
    text("highScore", width - 300, height/2+10);
    text(int(highScore), width- 125, height/2+10);
  }
}
