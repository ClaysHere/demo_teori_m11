import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List<Map<String, dynamic>> _pilihan = [
    {"text": "Preview", "icon": Icons.preview},
    {"text": "Share", "icon": Icons.share},
    {"text": "Download", "icon": Icons.download},
  ];

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menus"),
        actions: [
          PopupMenuButton(
            initialValue: _selectedValue,
            onSelected: (String value) {
              _selectedValue = value;
              print(_selectedValue);
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              ..._pilihan.map(
                (e) => PopupMenuItem(
                  value: e["text"],
                  child: ListTile(
                    leading: Icon(e["icon"]),
                    title: Text(e["text"]),
                    subtitle: Text("menampilkan ${e["text"]}"),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text("Ini terakhir"))
            ],
          )
        ],
      ),
    );
  }
}
