import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//flutter_gen\gen_l10n\app_localizations.dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:todolist/src/localization/l10n.dart';
import 'package:todolist/project/all_users.dart';
import 'package:todolist/project/controler.dart';
import 'package:todolist/project/create_new_task.dart';
import 'package:todolist/project/home_screen.dart';
import 'package:todolist/project/tasksdata.dart';
import 'package:todolist/project/user_profile.dart';
import 'package:todolist/project/view_task.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import '../project/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider<Controller>(
          create: (context) => Controller(),
          child: MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            // supportedLocales: L10n.all,

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.

            // onGenerateTitle: (BuildContext context) =>
            //     AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                      return const SampleItemListView();
                    case HomeScreen.routeName:
                      return const HomeScreen(
                        noNew: 0,
                        noDone: 0,
                        noProgress: 0,
                        tasksList: [],
                      );
                    case CreateNewTask.routeName:
                      return const CreateNewTask();
                    case Users.routeName:
                      return const Users();
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
                      return const Users();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
