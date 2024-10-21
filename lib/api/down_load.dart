import 'package:background_downloader/background_downloader.dart';
import 'dart:async';

class BaseDownLoad {
  static bool downloadWithError = false;
  static DownloadTask? backgroundDownloadTask;
  static StreamController<TaskProgressUpdate> progressUpdateStream =
      StreamController.broadcast();

  static init() {
    FileDownloader().configure(globalConfig: [
      (Config.requestTimeout, const Duration(seconds: 100)),
    ], androidConfig: [
      (Config.useCacheDir, Config.whenAble),
    ], iOSConfig: [
      (Config.localize, {'Cancel': 'StopIt'}),
    ]).then((result) => print('Configuration result = $result'));

    // Registering a callback and configure notifications
    FileDownloader()
        .registerCallbacks(
            taskNotificationTapCallback: myNotificationTapCallback)
        .configureNotificationForGroup(FileDownloader.defaultGroup,
            // For the main download button
            // which uses 'enqueue' and a default group
            running: const TaskNotification('Download {filename}',
                'File: {filename} - {progress} - speed {networkSpeed} and {timeRemaining} remaining'),
            complete: const TaskNotification(
                '{displayName} download {filename}', 'Download complete'),
            error: const TaskNotification(
                'Download {filename}', 'Download failed'),
            paused: const TaskNotification(
                'Download {filename}', 'Paused with metadata {metadata}'),
            progressBar: true)
        .configureNotificationForGroup('bunch',
            running: const TaskNotification(
                '{numFinished} out of {numTotal}', 'Progress = {progress}'),
            complete:
                const TaskNotification("Done!", "Loaded {numTotal} files"),
            error: const TaskNotification(
                'Error', '{numFailed}/{numTotal} failed'),
            progressBar: false,
            groupNotificationId: 'notGroup')
        .configureNotification(
            // for the 'Download & Open' dog picture
            // which uses 'download' which is not the .defaultGroup
            // but the .await group so won't use the above config
            complete: const TaskNotification(
                'Download {filename}', 'Download complete'),
            tapOpensFile: true); // dog can also open directly from tap

    // Listen to updates and process
    FileDownloader().updates.listen((update) async {
      switch (update) {
        case TaskStatusUpdate():
          if (update.task == backgroundDownloadTask) {
            switch (update.status.index) {
              case TaskStatus.running:
                break;
              case TaskStatus.complete:
                //  progressUpdateStream.onCancel()
                await progressUpdateStream.close();
                progressUpdateStream = StreamController();
                break;
              case TaskStatus.failed:
                await progressUpdateStream.close();
                progressUpdateStream = StreamController();
                break;
            }
            // buttonState = switch (update.status) {
            //   TaskStatus.running || TaskStatus.enqueued => ButtonState.pause,
            //   TaskStatus.paused => ButtonState.resume,
            //   _ => ButtonState.reset
            // };
            // setState(() {
            //   downloadTaskStatus = update.status;
            // });
          }
        case TaskProgressUpdate():
          progressUpdateStream.add(update); // pass on to widget for indicator
      }
    });
  }

  static unRegister() async {
    FileDownloader().unregisterCallbacks();
    FileDownloader().destroy();
    await progressUpdateStream.close();
    progressUpdateStream = StreamController();
  }

  /// Process the user tapping on a notification by printing a message
  static void myNotificationTapCallback(
      Task task, NotificationType notificationType) {
    print('Tapped notification $notificationType for taskId ${task.taskId}');
  }

  /// Attempt to get permissions if not already granted
  static Future<void> getPermission(PermissionType permissionType) async {
    var status = await FileDownloader().permissions.status(permissionType);
    if (status != PermissionStatus.granted) {
      if (await FileDownloader()
          .permissions
          .shouldShowRationale(permissionType)) {
        print('Showing some rationale');
      }
      status = await FileDownloader().permissions.request(permissionType);
      print('Permission for $permissionType was $status');
    }
  }

  /// start download
  static startDownLoad(
      {required String url,
      required String fileName,
      required String directory,
      BaseDirectory? baseDirectory = BaseDirectory.temporary}) async {
    await getPermission(PermissionType.notifications);
    backgroundDownloadTask = DownloadTask(
        url: url,
        filename: fileName, // 'zipfile.zip'
        directory: directory, // 'my/directory'
        baseDirectory: baseDirectory ?? BaseDirectory.temporary,
        updates: Updates.statusAndProgress,
        retries: 3,
        allowPause: true,
        metaData: '<example metaData>',
        displayName: 'My display name');
    await FileDownloader().enqueue(backgroundDownloadTask!);
  }

  /// 取消任务
  static cancel() async {
    if (backgroundDownloadTask != null) {
      await FileDownloader()
          .cancelTasksWithIds([backgroundDownloadTask!.taskId]);
    }
  }
}
