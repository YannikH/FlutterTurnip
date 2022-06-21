import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigaturnip/src/features/app/app.dart';
import 'package:gigaturnip/src/features/tasks/constants/status.dart';
import 'package:gigaturnip/src/features/tasks/features/create_tasks/cubit/index.dart';
import 'package:gigaturnip/src/features/tasks/features/create_tasks/view/creatable_tasks_list_view.dart';
import 'package:gigaturnip/src/utilities/dialogs/error_dialog.dart';

class CreateTasksView extends StatefulWidget {
  const CreateTasksView({Key? key}) : super(key: key);

  @override
  State<CreateTasksView> createState() => _CreateTasksViewState();
}

class _CreateTasksViewState extends State<CreateTasksView> {
  @override
  initState() {
    context.read<CreateTasksCubit>().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocConsumer<CreateTasksCubit, CreateTasksState>(
        listener: (context, state) {
          if (state.status == TasksStatus.error) {
            showErrorDialog(
              context,
              state.errorMessage ?? 'An error occurred while fetching tasks',
            );
          }
        },
        builder: (context, state) {
          if (state.status == TasksStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CreatableTasksListView(
            items: state.taskStages,
            onRefresh: () {
              context.read<CreateTasksCubit>().refresh();
            },
            onTap: (taskStage) {
              // context.read<AppBloc>().add(AppSelectedTaskChanged());
              Navigator.of(context).pushNamed(taskInstanceRoute);
            },
          );
        },
      ),
    );
  }
}