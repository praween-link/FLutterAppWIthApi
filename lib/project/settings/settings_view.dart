import 'package:flutter/material.dart';

import '../../src/settings/settings_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
              color: Color(0xFF0D243E),
            ),
          ),
          backgroundColor: const Color(0xFFF9BE7C),
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Color(0xFF0D243E),
                    size: 35,
                  ),
                );
              },
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text('Change Theme', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: DropdownButton<ThemeMode>(
                elevation: 15,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                value: controller.themeMode,
                onChanged: controller.updateThemeMode,
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light Theme'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark Theme'),
                  ),
                ],
              ),
            ),
            //-------------------------------------------------

            const Divider(thickness: 5),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text('Change Language', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),),
            ),
            
            Column(
              children: [
                const LanguaeWidget(),
                const SizedBox(height: 10),
                Text(
                  AppLocalizations.of(context)!.language,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Text('Hello Flutter'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text('Select language', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: LanguagePickerWidget(),
            ),
          ],
        ));
  }
}
