import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigaturnip/extensions/buildcontext/loc.dart';
import 'package:gigaturnip/src/features/app/app.dart';
import 'package:gigaturnip/src/features/tasks/constants/status.dart';
import 'package:gigaturnip/src/features/tasks/features/list_tasks/cubit/index.dart';
import 'package:gigaturnip/src/features/tasks/features/list_tasks/view/double_tasks_list_view.dart';
import 'package:gigaturnip/src/features/tasks/features/list_tasks/view/index.dart';
import 'package:gigaturnip/src/utilities/dialogs/error_dialog.dart';
import 'package:gigaturnip/src/widgets/drawers/app_drawer.dart';
import 'package:gigaturnip_repository/gigaturnip_repository.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  initState() {
    context.read<TasksCubit>().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.loc.tasks,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: BackButton(
          onPressed: () {
            context.read<AppBloc>().add(const AppSelectedCampaignChanged(null));
            Navigator.maybePop(context);
          },
        ),
        actions: <Widget>[
          Builder(builder: (context) {
            final avatar = context.read<AppBloc>().state.user!.photo;
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: avatar != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(avatar),
                    )
                  : const Icon(Icons.person),
            );
          })
        ],
      ),
      body: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state.status == TasksStatus.error) {
            showErrorDialog(
              context,
              state.errorMessage ?? context.loc.fetching_error_tasks,
            );
          }
        },
        builder: (context, state) {
          if (state.status == TasksStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          switch (state.selectedTab) {
            case Tabs.assignedTasksTab:
              return DoubleTasksListView(
                firstList: state.openTasks,
                secondList: state.closeTasks,
                headerOne: 'To Do',
                headerTwo: 'Done',
                onRefresh: () {
                  context.read<TasksCubit>().refresh();
                },
                onTap: (task) {
                  context.read<AppBloc>().add(AppSelectedTaskChanged(task));
                  Navigator.of(context).pushNamed(taskInstanceRoute);
                },
              );
            case Tabs.availableTasksTab:
              return DoubleTasksListView(
                firstList: state.creatableTasks,
                secondList: state.availableTasks,
                headerOne: 'Создать',
                headerTwo: 'Получить',
                onRefresh: () {
                  context.read<TasksCubit>().refresh();
                },
                onTap: (item) async {
                  if (item is TaskStage) {
                    final task = await context.read<TasksCubit>().createTask(item);
                    if (!mounted) return;
                    context.read<AppBloc>().add(AppSelectedTaskChanged(task));
                    Navigator.of(context).pushNamed(taskInstanceRoute);
                  } else {
                    context.read<AppBloc>().add(AppSelectedTaskChanged(item));
                    Navigator.of(context).pushNamed(taskInstanceRoute);
                  }
                },
              );
          }
        },
      ),
      endDrawer: const AppDrawer(),
      bottomNavigationBar: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          return TasksBottomNavigationBar(
            index: state.tabIndex,
            onTap: (index) {
              context.read<TasksCubit>().onTabChange(index);
            },
          );
        },
      ),
    );
  }
}
