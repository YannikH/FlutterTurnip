part of 'tasks_cubit.dart';

enum Tabs {
  assignedTasksTab,
  availableTasksTab,
}

class TasksState extends Equatable {
  final List<Task> openTasks;
  final List<Task> closeTasks;
  final List<Task> availableTasks;
  final List<TaskStage> creatableTasks;
  final TasksStatus status;
  final String? errorMessage;
  final Tabs selectedTab;
  final int tabIndex;

  const TasksState({
    this.openTasks = const [],
    this.closeTasks = const [],
    this.availableTasks = const [],
    this.creatableTasks = const [],
    this.status = TasksStatus.uninitialized,
    this.errorMessage,
    this.selectedTab = Tabs.assignedTasksTab,
    this.tabIndex = 0,
  });

  TasksState copyWith({
    List<TaskStage>? creatableTasks,
    List<Task>? openTasks,
    List<Task>? closeTasks,
    List<Task>? availableTasks,
    TasksStatus? status,
    String? errorMessage,
    Tabs? selectedTab,
    int? tabIndex,
  }) {
    return TasksState(
      openTasks: openTasks ?? this.openTasks,
      closeTasks: closeTasks ?? this.closeTasks,
      availableTasks: availableTasks ?? this.availableTasks,
      creatableTasks: creatableTasks ?? this.creatableTasks,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedTab: selectedTab ?? this.selectedTab,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [
        openTasks,
        closeTasks,
        availableTasks,
        creatableTasks,
        status,
        selectedTab,
        tabIndex,
      ];
}
