class ScoreController {
  int currentScore;
  int highScore;


  ScoreController() {
  }

  void update() {
    if (frameCount == 60) {
      currentScore +=10;
      frameCount = 0;
    }
    if (currentScore > highScore) {
      highScore = currentScore;
    }
  }


  void render() {
    textSize(30);
    fill(255);
    text("score", 25, height/2+10);
    text(currentScore, 125, height/2+10);
    text("highScore", width - 250, height/2+10);
    text(highScore, width- 75, height/2+10);
  }
}
