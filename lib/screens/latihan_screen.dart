import 'package:flutter/material.dart';

enum Opsi { Detele, Update, AddFavorite }

class LatihanScreen extends StatefulWidget {
  const LatihanScreen({super.key});
  @override
  State<LatihanScreen> createState() => _LatihanScreenState();
}

class _LatihanScreenState extends State<LatihanScreen> {
  Opsi? _selectedItem;
  Map<Opsi, IconData> opsiWithIcon = {
    Opsi.Detele: Icons.delete,
    Opsi.Update: Icons.update,
    Opsi.AddFavorite: Icons.favorite
  };

  List<Map<String, dynamic>> daftarLagu = [
    {
      "penyanyi": "Bruno Mars",
      "judul": "Granade",
      "genre": "Pop",
      "favorit": false
    },
    {
      "penyanyi": "Rizky Febian",
      "judul": "Cuek",
      "genre": "Pop",
      "favorit": false
    },
    {
      "penyanyi": "Black Pink",
      "judul": "Let's Kill this Love",
      "genre": "Pop",
      "favorit": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Lagu"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ...daftarLagu.map(
              (e) => ListTile(
                title: Text(e["judul"]),
                subtitle: Text(e["genre"]),
                leading: CircleAvatar(
                  child: Text(e["penyanyi"][0]),
                ),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == Opsi.Detele) {
                      setState(() {
                        daftarLagu = daftarLagu
                            .where((lagu) => e["judul"] != lagu["judul"])
                            .toList();
                      });
                    } else if (value == Opsi.AddFavorite) {
                      setState(() {
                        e["favorit"] = true;
                      });
                    } else if (value == Opsi.Update) {
                      TextEditingController penyanyi = TextEditingController();
                      TextEditingController lagu = TextEditingController();
                      penyanyi.text = e["penyanyi"];
                      lagu.text = e["judul"];
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: SizedBox(
                                  height: 400,
                                  child: Column(
                                    children: [
                                      const Text("Penyanyi"),
                                      TextField(
                                        controller: penyanyi,
                                      ),
                                      const Text("Lagu"),
                                      TextField(
                                        controller: lagu,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            if (penyanyi.text.isNotEmpty &&
                                                lagu.text.isNotEmpty) {
                                              e["penyanyi"] = penyanyi.text;
                                              e["judul"] = lagu.text;
                                              setState(() {});
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Text("Ganti"))
                                    ],
                                  ),
                                ),
                              ));
                    }
                  },
                  itemBuilder: (context) => <PopupMenuEntry<Opsi>>[
                    ...Opsi.values.map((e) => PopupMenuItem(
                        value: e,
                        child: ListTile(
                          leading: Icon(opsiWithIcon[e]),
                          title: Text(e.name.toString()),
                        )))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {},
        items: const [
          BottomNavigationBarItem(
              label: "Lagu",
              icon: Icon(
                Icons.list,
              )),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
