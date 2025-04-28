import 'package:hive/hive.dart';
part 'team_model.g.dart';

@HiveType(typeId: 0)
class Team {
  @HiveField(0)
  String name;
  @HiveField(1)
  int _points = 0;
  @HiveField(2)
  List<String> _gamePoints = [];

  Team({required this.name});
  @override
  String toString() {
    return 'Team(name: $name, score: $_points)';
  }

  void addPoints(int points) {
    _points += points;
  }

  int getPoints() {
    return _points;
  }

  List<String> getGamePoints() {
    return List.from(_gamePoints);
  }

  void resetPoints() {
    _points = 0;
  }

  void clearPoints() {
    this._gamePoints = [];
  }

  setGamepints(List<String> teamPoints) {
    this._gamePoints.addAll(teamPoints);
  }

  void undoPoint() {
    int substraction;
    if (this._gamePoints.last == "-") {
      substraction = 0;
    } else {
      substraction = int.parse(this._gamePoints.last);
    }
    this._points = this._points - substraction;
    this._gamePoints.removeLast();
  }

  void addGamePoints(String points) {
    addPoints(int.parse(points));
    if (points == "0") {
      _gamePoints.add("-");
    } else {
      _gamePoints.add(points);
    }
  }
}
