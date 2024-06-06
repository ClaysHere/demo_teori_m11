import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Card(
              child: ListTile(
                title: Text("One - Line List Tile"),
              ),
            ),
            const Divider(
              height: 100,
              thickness: 10,
              indent: 30,
              endIndent: 30,
              color: Colors.amber,
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.flutter_dash),
                title: Text("One-line With leading"),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("One-line With Trailing"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.flutter_dash),
                title: const Text("One-line With Two Widget"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.flutter_dash),
                title: const Text("Two-Line With Two Widget"),
                subtitle: const Text("Line Two"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            ),
            Card(
              child: ListTile(
                isThreeLine: true,
                leading: const Icon(Icons.flutter_dash),
                title: const Text("ThreeLine With Two Widget"),
                subtitle: const Text("Line Two \nLine Three\nLine Four"),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text("Mode Gelap"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Satu"),
                  VerticalDivider(
                    thickness: 4,
                    color: Colors.red,
                  ),
                  Text("Dua"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
