import 'package:flutter/foundation.dart';

import '../models/project.dart';
import '../services/project_service.dart';

class ProjectProvider extends ChangeNotifier {
  final ProjectService _service = ProjectService();
  final List<Project> projects = <Project>[];
  bool isLoading = false;

  Future<void> loadProjects({String? search}) async {
    isLoading = true;
    notifyListeners();
    try {
      await _service.list(search: search);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

