class ScoreController {
  float currentScore;
  float highScore;


  ScoreController() {
    BufferedReader reader = createReader("highscore.txt");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, TAB);
        highScore = int(pieces[0]);
      }
      reader.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  float update() {
    if (frameCount >= 60) {
      currentScore +=10;
      frameCount = 0;
    }
    if (currentScore > highScore) {
      highScore = currentScore;
      PrintWriter writer = createWriter("highscore.txt");
      writer.println(highScore);
      writer.flush();
      writer.close();
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
