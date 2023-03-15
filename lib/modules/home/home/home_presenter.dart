
import 'package:app_todo_lovepeople/modules/home/home/repository/home_repository.dart';
import 'package:flutter/material.dart';

import '../new_task/model/add_new_task_json.dart';
import 'model/home_model.dart';

class HomePresenter with ChangeNotifier {
  final HomeRepository homeRepository;
  final HomeModel homeModel;

  HomePresenter(
    this.homeModel,
    this.homeRepository,
  );

  String searchText = '';

  List<ToDo> toDoList = [];

  List<ToDo> listToShow = [];

  void onChangeText(String value) async {
    listToShow = toDoList.where((element) {
      return element.title
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
    print(listToShow);
    notifyListeners();
  }

  deleteToDos(int id) async {
    await homeRepository.delTodos(id);
    getToDos();
  }

  getToDos() async {
    toDoList = await homeRepository.getToDos();
    listToShow = toDoList;
    notifyListeners();
  }
}
