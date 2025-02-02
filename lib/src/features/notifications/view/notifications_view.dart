import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigaturnip/extensions/buildcontext/loc.dart';
import 'package:gigaturnip/src/features/app/app.dart';
import 'package:gigaturnip/src/features/notifications/notifications.dart';
import 'package:gigaturnip/src/features/notifications/view/notification_view.dart';
import 'package:gigaturnip/src/utilities/dialogs/error_dialog.dart';

import '../cubit/notifications_cubit.dart';
import 'notifications_sliver_list_view.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  late String campaignName;

  @override
  void initState() {
    context.read<NotificationsCubit>().loadNotifications();
    campaignName = context.read<AppBloc>().state.selectedCampaign!.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.notifications),
      ),
      body: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          if (state.status == NotificationsStatus.error) {
            showErrorDialog(context, state.errorMessage ?? context.loc.fetching_error);
          }
        },
        builder: (context, state) {
          if (state.status == NotificationsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return NotificationsSliverListView(
            title: campaignName,
            items: state.notifications,
            onRefresh: () {
              context.read<NotificationsCubit>().loadNotifications();
            },
            onTap: (notification) {
              context.read<AppBloc>().add(AppSelectedNotificationChanged(notification));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationView(
                    notification: notification,
                    campaignName: campaignName,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
