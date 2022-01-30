import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolist/project/home/home_screen.dart';
import 'package:todolist/project/controller/controler.dart';
import 'package:todolist/project/add_task/create_new_task.dart';
import 'package:todolist/project/tasks/user_tasks.dart';
import 'package:todolist/project/tasks/tasksdata.dart';
import 'package:todolist/project/user_profile/user_profile.dart';
import 'package:todolist/src/localization/l10n.dart';

import 'settings/settings_controller.dart';
import '../project/settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider<MyController>(
            create: (context) => MyController(),
            builder: (context, child) {
              final provider = Provider.of<MyController>(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Task Management",
                restorationScopeId: 'app',

                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // supportedLocales: const [
                //   Locale('en', ''), // English, no country code
                // ],
                locale: provider.locale,
                supportedLocales: L10n.all,

                // Use AppLocalizations to configure the correct application title
                // depending on the user's locale.
                //
                // The appTitle is defined in .arb files found in the localization
                // directory.

                onGenerateTitle: (BuildContext context) =>
                    AppLocalizations.of(context)!.appTitle,

                theme: ThemeData(),
                darkTheme: ThemeData.dark(),
                themeMode: settingsController.themeMode,

                onGenerateRoute: (RouteSettings routeSettings) {
                  return MaterialPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context) {
                      switch (routeSettings.name) {
                        case SettingsView.routeName:
                          return SettingsView(controller: settingsController);
                        case UserTasks.routeName:
                          return const UserTasks(
                            noNew: 0,
                            noDone: 0,
                            noProgress: 0,
                            tasksList: [],
                            username: '',
                            userprofileimage: '',
                          );
                        case CreateNewTask.routeName:
                          return const CreateNewTask();
                        case HomeScreen.routeName:
                          return const HomeScreen();
                        case UserProfile.routeName:
                          return const UserProfile(
                            userid: -1,
                            username: '',
                            useremail: '',
                            userprofileimage: '',
                          );
                        case TasksData.routeName:
                          return const TasksData(
                              userid: '', username: '', userprofileimage: '');
                        default:
                          return const HomeScreen();
                      }
                    },
                  );
                },
              );
            });
      },
    );
  }
}
