class Team {
  final String name;
  int _points = 0;
  List<String> _gamesPoints = [];

  Team({required this.name});

  void addPoints(int points) {
    _points += points;
  }

  int getPoints() {
    return _points;
  }

  List<String> getGamePoints() {
    return _gamesPoints;
  }

  void addGamePoints(String points) {
    _gamesPoints.add(points);
  }
}
