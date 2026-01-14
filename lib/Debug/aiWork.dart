import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:rawatt/Debug/dataAi.dart';
import 'package:rawatt/components/card_img.dart';
import 'package:rawatt/components/card_judulPetro.dart';
import 'package:rawatt/components/card_penjelas.dart';
import 'package:rawatt/components/sapa_hai_sobat_card.dart';
import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/MenuRawatan/mdl_MenuRawatan.dart';
import 'package:rawatt/model/dosis/fieldku_campur.dart';
import 'package:rawatt/model/jenisMesin/mdl_JenisMesin.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color warnaTema =
    warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]);

// Konstanta untuk tema
class AppTheme {
  static const primaryColor = Color(0xFF6200EE);
  static const accentColor = Colors.teal;
  static const backgroundColor = Colors.white;
  static const surfaceColor = Colors.white;
  static const textColor = Colors.black54;

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        color: surfaceColor,
        elevation: 0,
      ),
      textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: textColor,
            displayColor: textColor,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
// HomePageAi()

Future<void> loadData() async {
  final prefs = await SharedPreferences.getInstance();

  roles_E = prefs.getStringList('roles') ?? [];
  // roleData = {};
  // defaultData = {};
  // roleBooks = {};
  // savedPrompts = [];

  // Load roleData and defaultData
  for (var role in roles_E) {
    String? roleDataString = prefs.getString('roleData_$role');
    if (roleDataString != null) {
      roleData_E[role] = json.decode(roleDataString);
    }
    String? defaultDataString = prefs.getString('defaultData_$role');
    if (defaultDataString != null) {
      defaultData_E[role] = json.decode(defaultDataString);
    }
  }
  String? datapenjelasPrompString = prefs.getString('datapenjelasPromp');
  if (datapenjelasPrompString != null) {
    datapenjelasPromp_E = json.decode(datapenjelasPrompString);
  }
  // Load roleBooks
  for (var role in roles_E) {
    String? roleBooksString = prefs.getString('roleBooks_$role');
    if (roleBooksString != null) {
      List booksList = json.decode(roleBooksString);
      roleBooks_E[role] = booksList
          .map((bookMap) => BookReference(
                title: bookMap['title'],
                author: bookMap['author'],
                year: bookMap['year'],
                keyInsights: List<String>.from(bookMap['keyInsights']),
              ))
          .toList();
    } else {
      roleBooks_E[role] = [];
    }
  }

  String? parentDataString = prefs.getString('parentData');
  if (parentDataString != null) {
    parentData = MyData.decode(parentDataString);
  }

  // Load savedPrompts
  String? savedPromptsString = prefs.getString('savedPrompts');
  if (savedPromptsString != null) {
    List promptsList = json.decode(savedPromptsString);
    savedPrompts_E = promptsList
        .map((promptMap) => SavedPrompt(
              title: promptMap['title'],
              content: promptMap['content'],
              dateCreated: DateTime.parse(promptMap['dateCreated']),
            ))
        .toList();
  }

  mainProducts = prefs.getStringList('mainProducts') ?? [];
  derivedProducts = prefs.getString('derivedProducts') ?? '';
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();

  // await prefs.setString('parentData', MyData.encode(parentData));

  await prefs.setString('parentData', MyData.encode(parentData));
  await prefs.setString('DataProducts', DataProducts.encode(dataProductsObj));

  // Simpan roles
  await prefs.setStringList('roles', roles_E);

  // Simpan roleData dan defaultData
  for (var role in roles_E) {
    await prefs.setString('roleData_$role', json.encode(roleData_E[role]));
    await prefs.setString(
        'defaultData_$role', json.encode(defaultData_E[role]));
  }

  // Simpan roleBooks
  for (var role in roles_E) {
    if (roleBooks_E[role] != null) {
      // Cek apakah roleBooks[role] tidak null

      List<Map<String, dynamic>> booksList =
          roleBooks_E[role]!.map((book) => book.toMap()).toList();
      await prefs.setString('roleBooks_$role', json.encode(booksList));
    } else {
      print("Role $role tidak ditemukan dalam roleBooks");
    }
  }

  // Simpan savedPrompts
  List<Map<String, dynamic>> promptsList = savedPrompts_E
      .map((prompt) => {
            'title': prompt.title,
            'content': prompt.content,
            'dateCreated': prompt.dateCreated.toIso8601String(),
          })
      .toList();
  await prefs.setString('savedPrompts', json.encode(promptsList));

  await prefs.setString('datapenjelasPromp', json.encode(datapenjelasPromp_E));

  // Simpan Main
  await prefs.setStringList('mainProducts', mainProducts);

  //simpan derivedProducts
  await prefs.setString('derivedProducts', derivedProducts);
}

List<String> mainProducts = [];
String derivedProducts = '';

class HomePageAi extends StatefulWidget {
  final List<String> initialRoles;
  final Map<String, dynamic> initialRoleData;
  final Map<String, List<BookReference>> initialRoleBooks;
  final List<SavedPrompt> initialSavedPrompts;

  const HomePageAi(
      {super.key,
      required this.initialRoles,
      required this.initialRoleData,
      required this.initialRoleBooks,
      required this.initialSavedPrompts});

  @override
  _HomePageAiState createState() => _HomePageAiState();
}

class DefaultDataInputDialog extends StatefulWidget {
  const DefaultDataInputDialog({super.key});

  @override
  _DefaultDataInputDialogState createState() => _DefaultDataInputDialogState();
}

class _DefaultDataInputDialogState extends State<DefaultDataInputDialog> {
  final TextEditingController _departemenController = TextEditingController();
  List<String> Output = [];
  List<String> customerTypes = [];
  List<String> keyTasks = [];
  List<String> brainstormingQuestions = [];
  List<String> keyObjectives = [];
  List<String> collaborationTeams = [];
  List<String> resources = [];

  Widget _buildListInput(
      String title, List<String> list, Function(String) onAdd) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    list.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
        ElevatedButton(
          child: Text('Add $title'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController controller = TextEditingController();
                return AlertDialog(
                  title: Text('Add $title'),
                  content: TextField(controller: controller),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    ElevatedButton(
                      child: Text('Add'),
                      onPressed: () {
                        onAdd(controller.text);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Default Data for New Role'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _departemenController,
                decoration: InputDecoration(labelText: 'Departemen'),
              ),
              _buildListInput('Output', Output, (value) {
                setState(() => Output.add(value));
              }),
              _buildListInput('CustomerTypes', customerTypes, (value) {
                setState(() => customerTypes.add(value));
              }),
              _buildListInput('KeyTasks', keyTasks, (value) {
                setState(() => keyTasks.add(value));
              }),
              _buildListInput('BrainstormingQuestions', brainstormingQuestions,
                  (value) {
                setState(() => brainstormingQuestions.add(value));
              }),
              _buildListInput('keyObjectives', keyObjectives, (value) {
                setState(() => keyObjectives.add(value));
              }),
              _buildListInput('collaborationTeams', collaborationTeams,
                  (value) {
                setState(() => collaborationTeams.add(value));
              }),
              _buildListInput('resources', resources, (value) {
                setState(() => resources.add(value));
              })
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () {
            Navigator.of(context).pop({
              'Department': _departemenController.text,
              'Output': Output,
              'CustomerTypes': customerTypes,
              'KeyTasks': keyTasks,
              'BrainstormingQuestions': brainstormingQuestions,
              'keyObjectives': keyObjectives,
              'collaborationTeams': collaborationTeams,
              'resources': resources,
            });
          },
        ),
      ],
    );
  }
}

List<String> roles_E = List<String>.from(roles);
Map<String, Map<String, dynamic>> defaultData_E =
    Map<String, Map<String, dynamic>>.from(defaultData);
// Deep copy Map<String, dynamic>
Map<String, dynamic> roleData_E = Map<String, dynamic>.from(defaultData);

// Deep copy Map<String, List<BookReference>>
Map<String, List<BookReference>> roleBooks_E = roleBooks.map(
  (key, value) {
    // Salin setiap list BookReference
    List<BookReference> copiedList = value
        .map(
          (book) => BookReference.copy(book),
        )
        .toList();

    // Kembalikan pasangan key dan list yang sudah di-copy
    return MapEntry(key, copiedList);
  },
);
List<SavedPrompt> savedPrompts_E = [];
// savedPrompts.map((prompt) => SavedPrompt.copy(prompt)).toList();
Map datapenjelasPromp_E = Map<String, dynamic>.from(datapenjelasPromp);

void initsa() {
  // Deep copy List<String>

  roles_E = List<String>.from(roles);

  defaultData_E = Map<String, Map<String, dynamic>>.from(defaultData);
  // Deep copy Map<String, dynamic>
  roleData_E = Map<String, dynamic>.from(defaultData);

  // Deep copy Map<String, List<BookReference>>
  roleBooks_E = roleBooks.map(
    (key, value) {
      // Salin setiap list BookReference
      List<BookReference> copiedList = value
          .map(
            (book) => BookReference.copy(book),
          )
          .toList();

      // Kembalikan pasangan key dan list yang sudah di-copy
      return MapEntry(key, copiedList);
    },
  );
  datapenjelasPromp_E = Map<String, dynamic>.from(datapenjelasPromp);

  savedPrompts_E =
      savedPrompts.map((prompt) => SavedPrompt.copy(prompt)).toList();
}

class _HomePageAiState extends State<HomePageAi> {
  void _addRole() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Add New Role', style: TextStyle(color: AppTheme.textColor)),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter Role Name',
              hintStyle: TextStyle(color: AppTheme.textColor.withOpacity(0.5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.accentColor),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => DefaultDataInputDialog(),
                ).then((defaultDataW) {
                  print("defaultData_E $defaultDataW");
                  if (defaultData_E != null) {
                    setState(() {
                      String newRole = controller.text;
                      roles_E.add(newRole);
                      roleData_E[newRole] =
                          Map<String, dynamic>.from(defaultDataW);
                      defaultData_E[newRole] =
                          Map<String, dynamic>.from(defaultDataW);
                      roleBooks_E[newRole] = [];
                    });
                    saveData(); // Simpan data setelah menambah role baru
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteRole(String role) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // ... (kode dialog yang sudah ada)
          title:
              Text('Hapus Role', style: TextStyle(color: AppTheme.textColor)),

          actions: <Widget>[
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  roles_E.remove(role);
                  roleData_E.remove(role);
                  defaultData_E.remove(role);
                  roleBooks_E.remove(role);
                });
                saveData(); // Simpan perubahan setelah menghapus role
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: mainProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Card(
                shadowColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.agriculture,
                      color: Colors.green), // Agriculture icon
                  title: Text(mainProducts[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        mainProducts.removeAt(index);
                        saveData();
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.add, color: Colors.white), // Ikon tambah
          onPressed: _addMainProduct,
          label: Text(
            'Tambah Produk Utama',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: warnaTema, // Warna tombol hijau
          ),
        ),
      ],
    );
  }

  void _addMainProduct() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newProduct = '';
        return AlertDialog(
          title:
              Text('Tambah Produk Utama', style: TextStyle(color: warnaTema)),
          content: TextField(
            onChanged: (value) {
              newProduct = value;
            },
            decoration: InputDecoration(
              hintText: "Masukkan nama produk",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: warnaTema,
              ),
              onPressed: () {
                setState(() {
                  mainProducts.add(newProduct);
                  saveData();
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambah',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _derivedProductsController =
      TextEditingController();
  Widget _buildDerivedProductInput() {
    return TextField(
      controller: _derivedProductsController,
      maxLines: 5,
      onChanged: (value) {
        setState(() {
          derivedProducts = value;
          saveData();
        });
      },
      decoration: InputDecoration(
        hintText: "Masukkan produk turunan/olahan (pisahkan dengan koma)\n"
            "Contoh: Saus cabai organik, Keripik pisang aneka rasa, Selai nanas premium",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: warnaTema.withOpacity(.05),
      ),
    );
  }

  late Future<void> _loadDataFuture;

  @override
  void dispose() {
    // Bersihkan resource di sini
    super.dispose();
    // saveData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // initsa();
    _derivedProductsController.text = derivedProducts; //
    _loadDataFuture = loadData();
    _loadDataFuture.then((value) {
      if (roles_E.isEmpty) {
        defaultData = dataAiDefault[c.indexMenuRawatan.value];
        initsa();
      } else {
        defaultData = dataAiDefault[c.indexMenuRawatan.value];
      }
      warnaTema =
          warnas(dataKategoriMenuRawatan[c.indexMenuRawatan.value].colorku[0]);
    });

    // Inisialisasi variabel dengan nilai awal dari widget
    // roles_E = List.from(widget.initialRoles);
    // roleData_E = Map.from(widget.initialRoleData);
    // roleBooks_E = Map.from(widget.initialRoleBooks);
    // savedPrompts_E = List.from(widget.initialSavedPrompts);

    // Selalu muat data dari penyimpanan lokal
    // loadData().then((_) {
    //   setState(() {
    //     // Update state dengan data yang baru dimuat
    //     // roles_E = List.from(roles);
    //     // roleData_E = Map.from(roleData);
    //     // roleBooks_E = Map.from(roleBooks);
    //     // savedPrompts_E = List.from(savedPrompts);
    //   });
    // });
  }

  String formatRoleText(String text) {
    final words = text.split(' ');
    if (words.length > 1) {
      return '${words[0]}\n${words.sublist(1).join(' ')}';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    // Deep copy List<String>
    List<String> rolesE = List<String>.from(roles);
//
// Deep copy Map<String, dynamic>
    Map<String, dynamic> roledataE = Map<String, dynamic>.from(roleData);

// Deep copy Map<String, List<BookReference>>
    Map<String, List<BookReference>> rolebooksE = roleBooks.map(
      (key, value) {
        // Salin setiap list BookReference
        List<BookReference> copiedList = value
            .map(
              (book) => BookReference.copy(book),
            )
            .toList();

        // Kembalikan pasangan key dan list yang sudah di-copy
        return MapEntry(key, copiedList);
      },
    );

    roleBooks
        .map((key, value) => MapEntry(key, List<BookReference>.from(value)));

// Deep copy List<SavedPrompt>
    List<SavedPrompt> savedpromptsE =
        savedPrompts.map((prompt) => SavedPrompt.copy(prompt)).toList();

    // initsa();

    print("derivedProducts derivedProducts$derivedProducts");

    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar:
          (SizeConfig.screenWidth! > 600) ? appBarLanscape() : appBarPotrait(),
      body: FutureBuilder<void>(
          future: _loadDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return BackgraundPotrait(
                  judul: "Prompt Ai",
                  penjelas: "Bisnismu",
                  widgets: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: CardListProduct(
                          key: Key("s"),
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //   gradient: LinearGradient(
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     colors: [Color(0x5171FFE8), Color(0x71FFE88C)],
                        //   ),
                        //
                        // ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: defaultPadding, left: defaultPadding),
                          child: Column(
                            children: [
                              Text(
                                "Timmu di Ujung Jarimu",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                              ),
                              SizedBox(height: defaultPadding),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: heightfit(defaultPadding / 2),
                                    vertical: heightfit(defaultPadding / 2)),
                                // height: 200,
                                width: heightfit(double.infinity),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(-1, 8),
                                          color: warnaTema.withOpacity(.3))
                                    ]),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      // left: 0,
                                      child: Container(
                                        height: heightfit(90),
                                        width: heightfit(100),
                                        decoration: BoxDecoration(
                                            color: warnaTema.withOpacity(.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(20),
                                                topLeft: Radius.circular(90),
                                                topRight: Radius.circular(0)),
                                            // border:
                                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(-1, 8),
                                                  color:
                                                      warnaTema.withOpacity(.3))
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.all(defaultPadding / 2),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Produk Utama:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          _buildProductList(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              Text(
                                "Produk Turunan/Olahan:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              _buildDerivedProductInput(),
                              SizedBox(height: defaultPadding),
                              Container(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Peran dalam bisnismu : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: heightfit(sT18),
                                      ),
                                    ),
                                    // FittedBox(
                                    //   child: ElevatedButton(
                                    //     onPressed: () {
                                    //       setState(() {
                                    //         _addRole();
                                    //       });
                                    //     },
                                    //     child: Center(
                                    //       child: Row(
                                    //         children: [
                                    //
                                    //           Icon(Icons.add,color: Colors.black54,),
                                    //           Text(
                                    //             "Tambah",
                                    //             textAlign: TextAlign.center,
                                    //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black54),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: heightfit(defaultPadding / 2),
                                    vertical: heightfit(defaultPadding / 2)),
                                // height: 200,
                                width: heightfit(double.infinity),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    // border:
                                    //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 20,
                                          offset: Offset(0, 0),
                                          color: warnaTema.withOpacity(.9))
                                    ]),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      // left: 0,
                                      child: Container(
                                        height: heightfit(90),
                                        width: heightfit(100),
                                        decoration: BoxDecoration(
                                            color: warnaTema.withOpacity(.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(90),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(0)),
                                            // border:
                                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(-1, 8),
                                                  color:
                                                      warnaTema.withOpacity(.3))
                                            ]),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        height: heightfit(90),
                                        width: heightfit(100),
                                        decoration: BoxDecoration(
                                            color: warnaTema.withOpacity(.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(0),
                                                topRight: Radius.circular(90)),
                                            // border:
                                            //     Border.all(color: kTextColor.withOpacity(.8), width: .2)
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(-1, 8),
                                                  color: Colors.green
                                                      .withOpacity(.3))
                                            ]),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: defaultPadding / 2),
                                        Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(defaultPadding),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  icons("0xf04fa"),
                                                  color: warnaTema,
                                                  size: 26,
                                                ),
                                                Text(
                                                  "Peran :",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 26),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GridView.builder(
                                          padding:
                                              EdgeInsets.all(defaultPadding),
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20.0,
                                            mainAxisSpacing: 20.0,
                                          ),
                                          itemCount: rolesE.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              child: Stack(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      foregroundDecoration:
                                                          BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Colors.black
                                                                .withOpacity(0),
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                          ],
                                                          stops: const [0.6, 1],
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              dataKategoriMenuRawatan[c
                                                                      .indexMenuRawatan
                                                                      .value]
                                                                  .img_banner[0]),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: warnas(
                                                            dataKategoriMenuRawatan[c
                                                                    .indexMenuRawatan
                                                                    .value]
                                                                .colorku[0]),
                                                      ),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          print(
                                                              "d erivedProductsyt$derivedProducts $prompts");

                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  RoleDetailPage(
                                                                role: rolesE[
                                                                    index],
                                                                roleData_E:
                                                                    roledataE,
                                                                roleBooks_E:
                                                                    rolebooksE,
                                                                derivedProducts:
                                                                    _derivedProductsController
                                                                        .text,
                                                                mainProducts:
                                                                    mainProducts,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          backgroundColor:
                                                              Colors.black54
                                                                  .withOpacity(
                                                                      0.2),
                                                        ),
                                                        child: Center(
                                                          child: AutoSizeText(
                                                            formatRoleText(
                                                                rolesE[index]),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 22.0,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            maxLines: 3,
                                                            minFontSize: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Positioned(
                                                  //   top: -5,
                                                  //   right: -5,
                                                  //   child: Container(
                                                  //     height: 40,
                                                  //     width: 40,
                                                  //     child: FittedBox(
                                                  //       child: ElevatedButton(
                                                  //         style: ElevatedButton.styleFrom(
                                                  //           shape: CircleBorder(),
                                                  //           backgroundColor: Colors.red.withOpacity(0.8),
                                                  //         ),
                                                  //         child: Icon(Icons.clear_rounded, color: Colors.white),
                                                  //         onPressed: () {
                                                  //           setState(() {
                                                  //             _deleteRole(roles_E[index]);
                                                  //           });
                                                  //         },
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text('Seni Prompt terinspirasi oleh : aiforwork.co',
                          style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  tema: warnaTema,
                  key: Key("s"));
            }
          }),
    );
  }
}

class GlassmorphicCard extends StatelessWidget {
  final Widget child;

  const GlassmorphicCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.textColor.withOpacity(0.2),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

String prompts = "";

class RoleDetailPage extends StatefulWidget {
  final String derivedProducts;
  final List<String> mainProducts;
  final Map roleData_E;
  final String role;
  final Map<String, List<BookReference>> roleBooks_E;

  const RoleDetailPage(
      {super.key,
      required this.roleData_E,
      required this.role,
      required this.roleBooks_E,
      required this.derivedProducts,
      required this.mainProducts});
  @override
  _RoleDetailPageState createState() => _RoleDetailPageState();
}

class _RoleDetailPageState extends State<RoleDetailPage> {
  final TextEditingController _promptController = TextEditingController();

  void _editListItem(String category, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(text: item);
        return AlertDialog(
          title: Text('Edit $category'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  int index = roleData_E[widget.role][category].indexOf(item);
                  if (index != -1) {
                    roleData_E[widget.role][category][index] = controller.text;
                  }
                  saveData();
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _viewListItem(
    String category,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller =
            TextEditingController(text: datapenjelasPromp_E[category]);
        return AlertDialog(
          title: Text('Add $category'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    onChanged: (value) {
                      setState(() {
                        datapenjelasPromp_E[category] = value;
                        saveData();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Edit",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors
                          .lightGreen[50], // Warna latar belakang yang lembut
                    ),
                    controller: controller),
                SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! / 4,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                    // controller: _childControllers[index],
                    padding: EdgeInsets.zero,
                    itemCount: roleData_E[widget.role][category]?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(roleData_E[widget.role][category][index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () => _editListItem(category,
                                  roleData_E[widget.role][category][index]),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteListItem(category,
                                  roleData_E[widget.role][category][index]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _addListItem(category);
                });
                saveData();
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _viewStringItem(
    String category,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller =
            TextEditingController(text: datapenjelasPromp_E[category]);
        TextEditingController controller1 =
            TextEditingController(text: roleData_E[widget.role][category]);

        return AlertDialog(
          title: Text('Add $category'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                    onChanged: (value) {
                      setState(() {
                        datapenjelasPromp_E[category] = value;
                        saveData();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Edit",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors
                          .lightGreen[50], // Warna latar belakang yang lembut
                    ),
                    controller: controller),
                SizedBox(
                  height: defaultPadding,
                ),
                TextField(
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      roleData_E[widget.role][category] = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Edit data\n",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors
                        .lightGreen[50], // Warna latar belakang yang lembut
                  ),
                  controller: controller1,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _addListItem(category);
                });
                saveData();
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addListItem(String category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('Add $category'),
          content: SizedBox(
              height: SizeConfig.screenHeight! / 4,
              width: SizeConfig.screenWidth!,
              child: TextField(controller: controller)),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  roleData_E[widget.role][category].add(controller.text);
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteListItem(String category, String item) {
    setState(() {
      roleData_E[widget.role][category].remove(item);
    });
    saveData();
  }

  // void _generatePrompt() {
  //   print("data ${roleData_E[widget.role]}");
  //   String  prompt = generatePrompt(
  //     role: widget.role,
  //     department: roleData_E[widget.role]['Department']!,
  //
  //     output: roleData_E[widget.role]['Output']!,
  //     customerTypes: roleData_E[widget.role]['CustomerTypes']!,
  //     keyTasks: roleData_E[widget.role]['KeyTasks']!,
  //     brainstormingQuestions: roleData_E[widget.role]['BrainstormingQuestions']!,
  //     keyObjectives: roleData_E[widget.role]['keyObjectives']!,
  //     collaborationTeams : roleData_E[widget.role]['collaborationTeams']!,
  //       resources : roleData_E[widget.role]['resources']!,
  //     bookInsights: books.map((book) => book.toMap()).toList(),
  //     mainProducts: mainProducts,
  //     derivedProducts: derivedProducts, timeline: roleData_E[widget.role]['timeline'], expectedOutcome: roleData_E[widget.role]['expectedOutcome'],
  //   );
  //   setState(() {
  //     _promptController.text = prompt;
  //   });
  //   saveData();
  //   _showGeneratedPromptDialog(prompt);
  // }

  void _showGeneratedPromptDialog(String prompt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController =
            TextEditingController(text: 'Generated Prompt for ${widget.role}');
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Generated Prompt',
              style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Prompt Title',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: SingleChildScrollView(
                    child: Text(prompt,
                        style: TextStyle(color: AppTheme.textColor)),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          savedPrompts_E.add(SavedPrompt(
                            title: titleController.text,
                            content: prompt,
                            dateCreated: DateTime.now(),
                          ));
                        });
                        saveData();
                        Navigator.of(context).pop();
                        print('Save button pressed'); // Debugging
                      },
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: prompt));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied to clipboard')),
                        );
                      },
                      child: Text('Copy to Clipboard'),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Close', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _departemenController = TextEditingController();

  ScrollController _parentController = ScrollController();

  final ScrollController _childController = ScrollController();

  final List<ScrollController> _childControllers = [];

  @override
  void dispose() {
    _parentController.dispose();
    for (var controller in _childControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _parentController = ScrollController();

    for (int i = 0; i < roleData_E[widget.role].keys.toList().length; i++) {
      _childControllers.add(ScrollController());
    }
    // roles = widget.initialRoles;
    // roleData_E = widget.initialroleData_E;
    // roleBooks = widget.initialroleBooks_E;
    // savedPrompts = widget.initialSavedPrompts;
    //
    // loadData().then((_) {
    //   setState(() {
    //     roles = roles;
    //     roleData_E = roleData_E;
    //     roleBooks_E = roleBooks_E;
    //     savedPrompts = savedPrompts;
    //     // Memicu rebuild widget setelah data dimuat
    //   });
    // });

    // roleData = Map<String, dynamic>.from(defaultData[widget.role] ?? {});
    //
    books = roleBooks_E[widget.role]!;

    // savedPrompts = [];
    print("Role book ${roleBooks_E[widget.role]} $books");
  }

  void _scrollParentSmooth(bool scrollUp) {
    final currentPosition = _parentController.position.pixels;
    final scrollAmount =
        SizeConfig.screenHeight! * 0.1; // Scroll 10% of screen height

    final targetPosition = scrollUp
        ? (currentPosition - scrollAmount)
            .clamp(0.0, _parentController.position.maxScrollExtent)
        : (currentPosition + scrollAmount)
            .clamp(0.0, _parentController.position.maxScrollExtent);

    _parentController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // int w = 2 ;
  @override
  Widget build(BuildContext context) {
    prompts = generatePrompt(
      role: widget.role,
      department: roleData_E[widget.role]['Department']!,
      output: roleData_E[widget.role]['Output']!,
      customerTypes: roleData_E[widget.role]['CustomerTypes']!,
      keyTasks: roleData_E[widget.role]['KeyTasks']!,
      brainstormingQuestions: roleData_E[widget.role]
          ['BrainstormingQuestions']!,
      keyObjectives: roleData_E[widget.role]['keyObjectives']!,
      collaborationTeams: roleData_E[widget.role]['collaborationTeams']!,
      resources: roleData_E[widget.role]['resources']!,
      bookInsights: books.map((book) => book.toMap()).toList(),
      mainProducts: widget.mainProducts,
      derivedProducts: widget.derivedProducts,
      timeline: roleData_E[widget.role]['timeline'],
      expectedOutcome: roleData_E[widget.role]['expectedOutcome'],
    );
    //

    return Scaffold(
      extendBodyBehindAppBar: (SizeConfig.screenWidth! > 600) ? false : true,
      appBar:
          (SizeConfig.screenWidth! > 600) ? appBarLanscape() : appBarPotrait(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: _parentController,
          child: BackgraundPotrait(
            judul: widget.role,
            penjelas: "Peranku ",
            widgets: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  // _buildDepartmentTab(),
                  CardListProduct(
                    key: Key("s"),
                  ),

                  CardpHs(
                      title: 'Prompt Ai: \n',
                      hasilAkhir: "",
                      cardornot: true,
                      sizes: heightfit(14),
                      texts: "Perintahkan karyawan mu : ",
                      multitext: const [],
                      tema: warnaTema,
                      cardCostume: Icon(
                        icons("0xf04fa"),
                        color: warnaTema,
                      ),
                      id: 0,
                      widgetCostum: Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: _buildPromptTab("Prompt"),
                      )),

                  for (int w = 0;
                      w < roleData_E[widget.role].keys.toList().length;
                      w++)
                    (w == 0)
                        ? Container()
                        : Container(
                            child: Column(
                              children: [
                                SizedBox(height: defaultPadding),
                                (roleData_E[widget.role][roleData_E[widget.role]
                                        .keys
                                        .toList()[w]] is List)
                                    ? CardpHs(
                                        title:
                                            '${roleData_E[widget.role].keys.toList()[w]}: \n',
                                        hasilAkhir: "",
                                        cardornot: true,
                                        sizes: heightfit(14),
                                        texts:
                                            "${promptMap[roleData_E[widget.role].keys.toList()[w]]}",
                                        multitext: const [],
                                        tema: warnaTema,
                                        cardCostume: Icon(
                                          icons("0xf04fa"),
                                          color: warnaTema,
                                        ),
                                        id: 0,
                                        widgetCostum: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: defaultPadding),
                                          child: _buildListTab(
                                              roleData_E[widget.role]
                                                  .keys
                                                  .toList()[w],
                                              w),
                                        ))
                                    : CardpHs(
                                        title:
                                            '${roleData_E[widget.role].keys.toList()[w]}: \n',
                                        hasilAkhir: "",
                                        cardornot: true,
                                        sizes: heightfit(14),
                                        texts:
                                            "${promptMap[roleData_E[widget.role].keys.toList()[w]]}",
                                        multitext: const [],
                                        tema: warnaTema.withGreen(4),
                                        cardCostume: Icon(
                                          icons("0xf04fa"),
                                          color: warnaTema.withGreen(4),
                                        ),
                                        id: 0,
                                        widgetCostum: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: defaultPadding),
                                          child: _buildStringTab(
                                              roleData_E[widget.role]
                                                  .keys
                                                  .toList()[w],
                                              w),
                                        ))
                              ],
                            ),
                          ),

                  // Container(height: SizeConfig.screenHeight!/3,
                  //     width: SizeConfig.screenWidth!/3,child: _buildListTab('Customer Types')),
                  // Container(height: SizeConfig.screenHeight!/3,
                  //     width: SizeConfig.screenWidth!/3,child: _buildListTab('Key Tasks')),
                  // Container(height: SizeConfig.screenHeight!/3,
                  //     width: SizeConfig.screenWidth!/3,child: _buildListTab('Brainstorming Questions')),
                  CardpHs(
                    title: 'Book Insights: ',
                    hasilAkhir: "",
                    cardornot: true,
                    sizes: heightfit(18),
                    texts: "",
                    multitext: const [],
                    tema: warnaTema,
                    cardCostume: Icon(
                      icons("0xf04fa"),
                      color: warnaTema,
                    ),
                    id: 0,
                    widgetCostum: SizedBox(
                      height: SizeConfig.screenHeight! / 3,
                      width: SizeConfig.screenWidth!,
                      child: BookListPage(
                        books: books,
                        onAddBook: (book) {
                          setState(() {
                            roleBooks_E[widget.role]!.add(book);
                            // books.add(book);
                          });
                        },
                        onEditBook: (index, book) {
                          setState(() {
                            roleBooks_E[widget.role]![index] = book;
                            // books[index] = book;
                          });
                        },
                        onDeleteBook: (index) {
                          setState(() {
                            roleBooks_E[widget.role]!.removeAt(index);
                            // books.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                  // Container(height: SizeConfig.screenHeight!/3,
                  //   width: SizeConfig.screenWidth!/3,
                  //   child: SavedPromptsPage(
                  //     savedPrompts: savedPrompts_E,
                  //     onEdit: _editSavedPrompt,
                  //     onDelete: _deleteSavedPrompt,
                  //     onAdd: _addSavedPrompt,
                  //   ),
                  // ),
                ],
              ),
            ),
            tema: Colors.black26,
          ),
        ),
      ),
    );
  }

  Widget _buildStringTab(String category, int index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: warnaTema.withBlue(2), // Warna garis tepi
              width: 2, // Ketebalan garis tepi
            ),
            borderRadius: BorderRadius.circular(12), // Jari-jari sudut membulat
          ),
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification) {
                  if (_childControllers[index].position.atEdge) {
                    if (_childControllers[index].position.pixels == 0) {
                      _scrollParentSmooth(true);
                    } else {
                      _scrollParentSmooth(false);
                    }
                  }
                }
                return false;
              },
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Text(
                      "${datapenjelasPromp_E[category]}",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${roleData_E[widget.role][category]}",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => _viewStringItem(category),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromptTab(String category) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: warnaTema, // Warna garis tepi
              width: 2, // Ketebalan garis tepi
            ),
            borderRadius: BorderRadius.circular(12), // Jari-jari sudut membulat
          ),
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Text(
                  prompts,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "s",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: prompts));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied to clipboard')),
                    );
                  },
                  child: Text('Copy to Clipboard'),
                ),
                SizedBox(width: defaultPadding / 2),
                ElevatedButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => _EditPromtpItem(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTab(String category, int index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: warnaTema, // Warna garis tepi
              width: 2, // Ketebalan garis tepi
            ),
            borderRadius: BorderRadius.circular(12), // Jari-jari sudut membulat
          ),
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollEndNotification) {
                  if (_childControllers[index].position.atEdge) {
                    if (_childControllers[index].position.pixels == 0) {
                      _scrollParentSmooth(true);
                    } else {
                      _scrollParentSmooth(false);
                    }
                  }
                }
                return false;
              },
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Text(
                      "${datapenjelasPromp_E[category]}",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${roleData_E[widget.role][category].map((item) => '- $item').join('\n')}",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () => _viewListItem(category),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _EditPromtpItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final contentController = TextEditingController(text: prompts);

        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Edit Prompt', style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: prompts));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Copied to clipboard')),
                );
              },
              child: Text('Copy to Clipboard'),
            ),
            // ElevatedButton(
            //   child: Text('Save'),
            //   onPressed: () {
            //     setState(() {
            //       // savedPrompts_E[index] = SavedPrompt(
            //       //   title: titleController.text,
            //       //   content: contentController.text,
            //       //   dateCreated: prompt.dateCreated,
            //       // );
            //     });
            //     saveData();
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }

  void _editSavedPrompt(int index, SavedPrompt prompt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController(text: prompt.title);
        final contentController = TextEditingController(text: prompt.content);

        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Edit Prompt', style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: prompt.content));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Copied to clipboard')),
                );
              },
              child: Text('Copy to Clipboard'),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  savedPrompts_E[index] = SavedPrompt(
                    title: titleController.text,
                    content: contentController.text,
                    dateCreated: prompt.dateCreated,
                  );
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteSavedPrompt(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Delete Prompt',
              style: TextStyle(color: AppTheme.textColor)),
          content: Text('Are you sure you want to delete this prompt?',
              style: TextStyle(color: AppTheme.textColor)),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  savedPrompts_E.removeAt(index);
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addSavedPrompt() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final contentController = TextEditingController();

        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Add New Prompt',
              style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(color: AppTheme.textColor),
                  ),
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  savedPrompts_E.add(SavedPrompt(
                    title: titleController.text,
                    content: contentController.text,
                    dateCreated: DateTime.now(),
                  ));
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editItem(String category, {required String item}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController(text: item);
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Edit $category',
              style: TextStyle(color: AppTheme.textColor)),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter $category',
              hintStyle: TextStyle(color: AppTheme.textColor.withOpacity(0.5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.accentColor),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  final index =
                      roleData_E[widget.role][category]?.indexOf(item);
                  if (index != null && index >= 0) {
                    roleData_E[widget.role][category]?[index] = controller.text;
                  }
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(String category, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Delete Item', style: TextStyle(color: AppTheme.textColor)),
          content: Text('Are you sure you want to delete this item?',
              style: TextStyle(color: AppTheme.textColor)),
          actions: <Widget>[
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  roleData_E[widget.role][category]?.remove(item);
                });
                saveData();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class SavedPromptsPage extends StatelessWidget {
  final List<SavedPrompt> savedPrompts;
  final Function(int, SavedPrompt) onEdit;
  final Function(int) onDelete;
  final Function() onAdd;

  const SavedPromptsPage({
    super.key,
    required this.savedPrompts,
    required this.onEdit,
    required this.onDelete,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: savedPrompts_E.isEmpty
              ? Center(
                  child: Text(
                    'No saved prompts yet.',
                    style: TextStyle(color: AppTheme.textColor),
                  ),
                )
              : SizedBox(
                  height: SizeConfig.screenHeight! / 3,
                  width: SizeConfig.screenWidth! / 3,
                  child: ListView.builder(
                    itemCount: savedPrompts_E.length,
                    itemBuilder: (context, index) {
                      return GlassmorphicCard(
                        child: ListTile(
                          title: Text(savedPrompts_E[index].title,
                              style: TextStyle(color: AppTheme.textColor)),
                          subtitle: Text(
                              DateFormat('yyyy-MM-dd HH:mm')
                                  .format(savedPrompts_E[index].dateCreated),
                              style: TextStyle(
                                  color: AppTheme.textColor.withOpacity(0.7))),
                          onTap: () =>
                              _viewPrompt(context, savedPrompts_E[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit,
                                    color: AppTheme.accentColor),
                                onPressed: () =>
                                    onEdit(index, savedPrompts_E[index]),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: AppTheme.accentColor),
                                onPressed: () => onDelete(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: ElevatedButton(
            onPressed: onAdd,
            child: Text('Add New Prompt'),
          ),
        ),
      ],
    );
  }

  void _viewPrompt(BuildContext context, SavedPrompt prompt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text(prompt.title, style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Text(prompt.content,
                style: TextStyle(color: AppTheme.textColor)),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: prompt.content));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Copied to clipboard')),
                );
              },
              child: Text('Copy to Clipboard'),
            ),
            TextButton(
              child:
                  Text('Close', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}

class RoleDetailList extends StatelessWidget {
  final String category;
  final List<dynamic> items;
  final Function(dynamic) onEdit;
  final Function(dynamic) onDelete;
  final Function() onAdd;

  const RoleDetailList({
    super.key,
    required this.category,
    required this.items,
    required this.onEdit,
    required this.onDelete,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: SizeConfig.screenHeight! / 3,
            width: SizeConfig.screenWidth!,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GlassmorphicCard(
                  child: ListTile(
                    title: Text(items[index].toString(),
                        style: TextStyle(color: AppTheme.textColor)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: AppTheme.accentColor),
                          onPressed: () => onEdit(items[index]),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: AppTheme.accentColor),
                          onPressed: () => onDelete(items[index]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: ElevatedButton(
            onPressed: onAdd,
            child: Text('Add $category'),
          ),
        ),
      ],
    );
  }
}

class BookListPage extends StatelessWidget {
  final List<BookReference> books;
  final Function(BookReference) onAddBook;
  final Function(int, BookReference) onEditBook;
  final Function(int) onDeleteBook;

  const BookListPage({
    super.key,
    required this.books,
    required this.onAddBook,
    required this.onEditBook,
    required this.onDeleteBook,
  });

  @override
  Widget build(BuildContext context) {
    print("books $books, $roleData_E");
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: SizedBox(
            height: SizeConfig.screenHeight! / 3,
            width: SizeConfig.screenWidth!,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black54, // Warna garis tepi
                  width: 2, // Ketebalan garis tepi
                ),
                borderRadius:
                    BorderRadius.circular(12), // Jari-jari sudut membulat
              ),
              // child: NotificationListener<ScrollNotification>(
              //   onNotification: (ScrollNotification notification) {
              //     if (notification is ScrollEndNotification) {
              //       if (_childController.position.atEdge) {
              //         if (_childController.position.pixels ==
              //             0) {
              //           // At the top of the child scroll
              //           // widget.parentController.jumpTo(widget.parentController.offset - 30);
              //           _parentController.animateTo(
              //             _parentController.offset -
              //                 SizeConfig.screenHeight! / 4,
              //             duration:
              //             const Duration(milliseconds: 300),
              //             curve: Curves.easeInOut,
              //           );
              //         } else {
              //           // At the bottom of the child scroll
              //           // widget.parentController.jumpTo(widget.parentController.offset + 30);
              //           _parentController.animateTo(
              //             _parentController.offset +
              //                 SizeConfig.screenHeight! / 4,
              //             duration:
              //             const Duration(milliseconds: 300),
              //             curve: Curves.easeInOut,
              //           );
              //         }
              //       }
              //     }
              //     return false;
              //   },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  // return Container();
                  return
                      //       GlassmorphicCard(
                      //         child:
                      ListTile(
                    title: Text(books[index].title,
                        style: TextStyle(color: AppTheme.textColor)),
                    subtitle: Text(
                        '${books[index].author} (${books[index].year})',
                        style: TextStyle(
                            color: AppTheme.textColor.withOpacity(0.7))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookDetailPage(book: books[index]),
                        ),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: AppTheme.accentColor),
                          onPressed: () => _editBook(context, index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: AppTheme.accentColor),
                          onPressed: () => _deleteBook(context, index),
                        ),
                      ],
                    ),
                  );
                  //       );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              onPressed: () => _addBook(context),
              child: Text('Add Book'),
            ),
          ),
        ),
      ],
    );
  }

  void _addBook(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final authorController = TextEditingController();
        final yearController = TextEditingController();
        final keyInsightsController = TextEditingController();

        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Add New Book', style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: authorController,
                  decoration: InputDecoration(
                      labelText: 'Author',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: yearController,
                  decoration: InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: keyInsightsController,
                  decoration: InputDecoration(
                      labelText: 'Key Insights (comma separated)',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                final newBook = BookReference(
                  title: titleController.text,
                  author: authorController.text,
                  year: yearController.text,
                  keyInsights: keyInsightsController.text
                      .split(',')
                      .map((s) => s.trim())
                      .toList(),
                );
                onAddBook(newBook);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editBook(BuildContext context, int index) {
    final book = books[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController(text: book.title);
        final authorController = TextEditingController(text: book.author);
        final yearController = TextEditingController(text: book.year);
        final keyInsightsController =
            TextEditingController(text: book.keyInsights.join(', '));

        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Edit Book', style: TextStyle(color: AppTheme.textColor)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: authorController,
                  decoration: InputDecoration(
                      labelText: 'Author',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: yearController,
                  decoration: InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
                TextField(
                  controller: keyInsightsController,
                  decoration: InputDecoration(
                      labelText: 'Key Insights (comma separated)',
                      labelStyle: TextStyle(color: AppTheme.textColor)),
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                final editedBook = BookReference(
                  title: titleController.text,
                  author: authorController.text,
                  year: yearController.text,
                  keyInsights: keyInsightsController.text
                      .split(',')
                      .map((s) => s.trim())
                      .toList(),
                );
                onEditBook(index, editedBook);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteBook(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppTheme.surfaceColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title:
              Text('Delete Book', style: TextStyle(color: AppTheme.textColor)),
          content: Text('Are you sure you want to delete this book?',
              style: TextStyle(color: AppTheme.textColor)),
          actions: [
            TextButton(
              child:
                  Text('Cancel', style: TextStyle(color: AppTheme.accentColor)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                onDeleteBook(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final BookReference book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.backgroundColor, AppTheme.surfaceColor],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GlassmorphicCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor),
                ),
                SizedBox(height: 8),
                Text(
                  'Author: ${book.author}',
                  style: TextStyle(fontSize: 18, color: AppTheme.textColor),
                ),
                SizedBox(height: 4),
                Text(
                  'Year: ${book.year}',
                  style: TextStyle(fontSize: 18, color: AppTheme.textColor),
                ),
                SizedBox(height: 16),
                Text(
                  'Key Insights:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: book.keyInsights.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.check, color: AppTheme.accentColor),
                        title: Text(book.keyInsights[index],
                            style: TextStyle(color: AppTheme.textColor)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String generatePrompt({
  required String role,
  required String department,
  required List<dynamic> output,
  required List<dynamic> customerTypes,
  required List<dynamic> keyTasks,
  required List<dynamic> brainstormingQuestions,
  required List<Map<String, dynamic>> bookInsights,
  required List<String> mainProducts,
  required String derivedProducts,
  required List<dynamic> keyObjectives, // ditambahkan
  required List<dynamic> collaborationTeams, // ditambahkan
  required List<dynamic> resources, // ditambahkan
  required String timeline, // ditambahkan
  required String expectedOutcome, // ditambahkan
}) {
  return '''
  ### Rules
  - Initial Message: 👋 Saya AI $role Anda. Mari kita rancang solusi pertanian terbaik bersama-sama. Untuk memberikan hasil kerja terbaik, saya perlu mengajukan beberapa pertanyaan.
  - Ajukan hingga 5 pertanyaan penting yang dirancang untuk mengumpulkan detail sebanyak mungkin untuk menghasilkan output yang dipersonalisasi dengan kualitas tertinggi yang mencapai tujuan pengguna.
  - Tarik napas dalam-dalam. Pikirkan tugas Anda langkah demi langkah. Pertimbangkan faktor keberhasilan, kriteria, dan tujuan. Bayangkan output optimal. Targetkan kesempurnaan dalam setiap upaya.
  - Gunakan detail yang diberikan pengguna, memadukannya dengan wawasan dari referensi kunci dan praktik terbaik industri untuk menyusun konten optimal.
  - SELESAIKAN setiap pekerjaan dengan '🤖 Apakah Anda Ingin Saya Mengevaluasi Pekerjaan Ini ☝ dan Memberikan Opsi untuk Meningkatkannya? Ya atau Tidak?'
  - ANDA HARUS SELALU mengevaluasi pekerjaan menggunakan format tabel. Setiap evaluasi HARUS mencakup Kriteria, Peringkat (dari 10 berdasarkan evaluasiRubric), Alasan Peringkat, dan Umpan Balik Rinci untuk Peningkatan.
  - Rubrik evaluasi adalah panduan definitif untuk menilai pekerjaan. Selalu bandingkan konten dengan deskripsi kriteria masing-masing. Cocokkan atribut pekerjaan dengan detail rubrik. Setelah setiap evaluasi, berikan konfirmasi jujur apakah rubrik evaluasi digunakan dengan ✅ atau ❌.
  - ANDA HARUS SELALU menyajikan opsi pasca-evaluasi SETELAH SETIAP evaluasi. Setelah evaluasi, berikan opsi: 'Opsi': ['1: 👍 Sempurnakan Berdasarkan Umpan Balik', '2: 👀 Berikan Evaluasi yang Lebih Ketat', '3: 🙋‍♂️ Jawab Lebih Banyak Pertanyaan untuk Personalisasi', '4: 🧑‍🤝‍🧑 Tirulah Umpan Balik Rinci dari Kelompok Fokus', '5: 👑 Tirulah Umpan Balik Rinci dari Kelompok Ahli', '6: ✨ Mari Coba Pendekatan yang Berbeda', '8: 💡 Minta Modifikasi Format, Gaya, atau Panjang', '9: 🤖 Otomatisasi untuk Menjadi 10/10!']
  - Untuk setiap revisi, tambahkan bagian 'LOG PERUBAHAN 📝' di akhir konten. Bagian ini harus mendokumentasikan perubahan spesifik dan pembaruan yang dibuat.

Sebagai $role di departemen $department, Anda bertanggung jawab untuk mencapai tujuan utama berikut:
${keyObjectives.map((objective) => '  - $objective').join('\n')}
### Fokus Produk
Fokuskan upaya Anda pada pengembangan dan implementasi strategi komprehensif untuk produk hasil pertanian berikut:
  - Produk utama: ${mainProducts.join(', ')}
  - Produk turunan: ${derivedProducts.split(',').map((product) => '  - ${product.trim()}').join('\n')}
### Tugas Utama
Tugas utama yang perlu Anda fokuskan meliputi:
${keyTasks.map((task) => '  - $task').join('\n')}
### Target Pelanggan
Fokus pada jenis pelanggan berikut:
${customerTypes.map((type) => '  - $type').join('\n')}
### Kolaborasi
Untuk mencapai tujuan tersebut, Anda harus bekerja sama dengan tim-tim berikut:
${collaborationTeams.map((team) => '  - $team').join('\n')}
### Sumber Daya yang Tersedia
Anda memiliki akses ke sumber daya berikut yang dapat membantu dalam pelaksanaan tugas:
${resources.map((resource) => '  - $resource').join('\n')}
### Timeline
Penyelesaian tugas ini diharapkan sesuai dengan timeline berikut: $timeline.
### Output yang Diharapkan
Output yang diharapkan dari peran Anda meliputi:
${output.map((item) => '  - $item').join('\n')}
### Hasil yang Diharapkan
Hasil yang diharapkan dari peran Anda adalah: $expectedOutcome.
### Pertanyaan Brainstorming
Gunakan pertanyaan-pertanyaan berikut untuk memandu proses brainstorming dan mengembangkan ide-ide inovatif:
${brainstormingQuestions.map((question) => '  - $question').join('\n')}
### Wawasan dari Buku
Pertimbangkan wawasan berikut dari buku-buku relevan untuk memperkaya pendekatan Anda:
${bookInsights.map((book) => '  - "${book['title']}" oleh ${book['author']} (${book['year']}): ${book['keyInsights'].join(', ')}').join('\n')}
### Ekspektasi Akhir
Pastikan untuk memberikan laporan kemajuan secara berkala, siap menerima umpan balik untuk perbaikan lebih lanjut, dan fokus pada pencapaian hasil yang diharapkan sesuai dengan peran Anda di departemen $department.


### Evaluation Rubric
  1: Sangat Buruk: Terdapat kesalahan mendasar. Tidak ada nilai yang bisa diambil. Gagal memenuhi bahkan persyaratan dasar.
  2: Kurang: Sedikit lebih baik dari level 1, tetapi masih ada kesalahan mendasar. Minim keterlibatan dalam tugas.
  3: Tidak Lengkap: Komponen utama hilang atau terburu-buru. Hanya ide dasar yang ada tanpa kedalaman.
  4: Dasar: Memenuhi beberapa persyaratan tetapi kurang mendalam dan wawasan. Ide-ide umum tanpa orisinalitas.
  5: Rata-rata: Pelaksanaan yang memadai. Memenuhi persyaratan standar, tetapi kurang dalam penyempurnaan dan wawasan lanjutan.
  6: Di Atas Rata-rata: Upaya yang baik terlihat. Ada beberapa wawasan mendalam, tetapi masih kurang kedalaman atau nuansa.
  7: Terampil: Komprehensif dengan sedikit kesalahan. Menunjukkan pemahaman yang solid di luar persyaratan dasar, menunjukkan pemahaman konsep yang lebih mendalam.
  7.5: Sangat Terampil: Mencapai keunggulan lebih dari sekadar terampil. Menunjukkan pemahaman mendalam dengan wawasan unik sesekali. Ada niat dan penguasaan yang jelas dalam pelaksanaan, namun belum mencapai potensi penuh.
  8: Terkenal: Pemahaman mendalam yang ditampilkan secara konsisten, dipasangkan dengan wawasan inovatif atau unik. Penguasaan konten terlihat, dengan hanya area yang paling kecil untuk potensi peningkatan.
  8.5: Hampir Contoh Teladan: Menunjukkan keahlian yang hampir sempurna. Kaya akan detail, kedalaman, dan inovasi. Memperlihatkan pemahaman menyeluruh tentang topik, dengan hanya sedikit ruang untuk penyempurnaan untuk mencapai kesempurnaan.
  9: Teladan: Sebuah tanda keunggulan hampir sempurna. Menunjukkan keahlian, penguasaan, dan tingkat orisinalitas yang tinggi. Kontennya inovatif dan tepat, menetapkan tolok ukur bagi orang lain untuk diikuti.
  9.5: Teladan Superior: Berdiri di puncak keunggulan. Penguasaan yang luar biasa, dengan nuansa yang halus dieksekusi dengan indah. Ini adalah contoh sempurna tentang bagaimana sebuah tugas harus diselesaikan.
  10: Sempurna: Memenuhi atau melebihi harapan dengan kesempurnaan. Tidak ada kesalahan atau area untuk perbaikan yang dapat diidentifikasi. Karya teladan yang layak ditiru.
''';
}
