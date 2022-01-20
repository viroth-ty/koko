import 'package:flutter/material.dart';
import 'package:koko/model/todo.dart';
import 'package:koko/service/todo_service.dart';

class HomeViewModel extends ChangeNotifier {

  Todo? _todo;

  List<String> _users= [];
  String _userName = "Sila";
  int _grade = 12;

  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    notifyListeners();
  }


  int get grade => _grade;
  set grade(int value) {
    _grade = value;
    notifyListeners();
  }


  List<String> get users => _users;
  set users(List<String> value) {
    _users = value;
    notifyListeners();
  }


  Todo? get todo => _todo;
  set todo(Todo? value) {
    _todo = value;
    notifyListeners();
  }

  void getUserFromAPI() {
    List<String> tempList = [];
    List.generate(100, (index) => tempList.add("$index"));
    users  = tempList;
  }

  void changeUserName(String newUsername) {
    userName = newUsername;
  }

  void changeGrade(int newGrade) {
    grade = newGrade;
  }

  Future<void> getUser() async{
    var todoResponse = await TodoService.getTodoList();
    todo = todoResponse;
  }

}