import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({Key? key}) : super(key: key);
  static const keyUseLessDataCalls = 'key-UseLessDataCalls';
  static const keyMobileData = 'key-MobileData';
  static const keyWifi = 'key-ChatArchived';
  static const keyRoming = 'key-FontSize';
  static const keyPhotoUploadQuality = 'key-PhotoUploadQuality';

  static const keyPhoto = 'key-Photo';
  static const keyAudio = 'key-Audio';
  static const keyVideo = 'key-Video';
  static const keyDocument = 'key-Document';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Storage and Media",
      subtitle: "Privacy, Security, Language",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Storage and media',
        children: [
          buildManagestorage(),
          SettingsGroup(
            title: "",
            children: [
              buildNetworkUsege(),
              buildUseLessDataCalls(),
            ],
          ),
          SettingsGroup(
            title: "",
            children: [
              buildAutoDownload(),
              buildMobileData(context),
              buildWifi(context),
              buildRoming(context)
            ],
          ),
          SettingsGroup(
            title: "",
            children: [
              buildUploadQuality(),
              buildPhotoUploadQuality(),
            ],
          ),
        ],
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 390.0,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'When using mobile data',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              CheckboxSettingsTile(
                title: 'Photo',
                settingKey: keyPhoto,
              ),
              CheckboxSettingsTile(
                title: 'Audio',
                settingKey: keyAudio,
              ),
              CheckboxSettingsTile(
                title: 'Videos',
                settingKey: keyVideo,
              ),
              CheckboxSettingsTile(
                title: 'Documents',
                settingKey: keyDocument,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ok'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildMobileData(context) => SimpleSettingsTile(
        title: 'When using mobile data',
        subtitle: "Photos",
        leading: Text(''),
        onTap: () => {_bottomSheet(context)},
      );
  Widget buildWifi(context) => SimpleSettingsTile(
        title: 'when connected on wifi',
        subtitle: "All media",
        leading: Text(''),
        onTap: () => {_bottomSheet(context)},
      );
  Widget buildRoming(context) => SimpleSettingsTile(
        title: 'When roming',
        subtitle: "No media",
        leading: Text(''),
        onTap: () => {_bottomSheet(context)},
      );
  Widget buildManagestorage() => SimpleSettingsTile(
        title: 'Manage storage',
        subtitle: "555.8 MB",
        leading: Icon(
          Icons.data_usage_rounded,
        ),
        onTap: () => {},
      );
  Widget buildNetworkUsege() => SimpleSettingsTile(
        title: 'Network Usege',
        subtitle: "267.8 MB sent - 93.5 MB received",
        leading: Icon(
          Icons.storage,
        ),
        onTap: () => {},
      );
  Widget buildAutoDownload() => SimpleSettingsTile(
        title: 'Media Auto Download',
        subtitle: "Voice messages are always automatically downloaded",
        onTap: () => {},
      );
  Widget buildUploadQuality() => SimpleSettingsTile(
        title: 'Media Upload Quality',
        subtitle: "Choose the quality of media files to be sent",
        onTap: () => {},
      );
  Widget buildUseLessDataCalls() => SwitchSettingsTile(
        title: "Use Less Data for Calls",
        subtitle: "Play sounds for incoming and outgoing",
        settingKey: keyUseLessDataCalls,
      );
  Widget buildPhotoUploadQuality() => RadioModalSettingsTile<int>(
        title: 'Photo Upload Quality',
        settingKey: keyPhotoUploadQuality,
        values: <int, String>{
          0: 'Auto(recommended)',
          1: 'Best quality',
          2: 'Data saver',
        },
        showTitles: true,
        enabled: true,
        selected: 1,
        onChange: (value) {
          debugPrint('key-radio-sync-period: $value days');
        },
      );
}
