import 'dart:convert';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:rawatt/components/card_field.dart';
import 'package:rawatt/components/inputan.dart';
import 'package:rawatt/constants.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/dosis/fieldku_kolam1.dart';
import 'package:rawatt/model/kalkulator/mdl_KatMediatanam.dart';
import 'package:rawatt/model/kalkulator/mdl_KatRumus.dart';
import 'package:rawatt/rumus.dart';
import 'package:rawatt/screens/convert/component/Widget_Jenis_Tanah.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/convert/screens/dosis_pupuk_tanaman/dosis_pupuk_tanaman.dart';
import 'package:rawatt/size_config.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import '../../../components/card_penjelas.dart';
import '../../../components/card_product.dart';
import '../../../model/MenuRawatan/mdl_MenuRawatan.dart';
import '../../../model/dosis/fieldku_campur.dart';
import '../../../model/jenisMesin/mdl_JenisMesin.dart';
import '../../../model/product/mdl_Produk.dart';
import '../../details/component/component.dart';
import '../screens/dolomit/myMainDolomit.dart';
import '../screens/majemuk2tunggal/majemuk2tunggal_display.dart';
import '../screens/majemuk2tunggal/my_main.dart';
import '../screens/tunggal2majemuk_display/my_mainT2M.dart';
import '../screens/tunggal2majemuk_display/tunggal2majemuk_display.dart';
import 'dart:developer' as developer;

import 'Widget_Jenis_Pot.dart';

String sat = "m";

void onPresosMtJ(String satuanm) {
  cariVarUpdate("Popt", true, 1.0, "LMt/LJt", 0, satuanm);
}

// digunakan untuk [Jenis dosis, Jenis Lahan, Jarak Tanam] pokok ada berat / Bedengan
class ProsesWidgets extends StatefulWidget {
  final String juduls;
  final Color tema;
  final Color warna;
  final String namaobj;
  final String satuan;
  final int idTipeMediaTanam;
  final int idBentukMediaTanam;
  final String rumus;
  final bool dropdowns;
  final int indexmenu;
  final int indexsubmenu;
  final List<KategoriRumus>? datakatRumus;
  // final int indexSubmenu;
  final Function(int, int, String, Map dataVar, String datarumuslahan)
      onChangeState;
  String? namaCategoryTanam;
  ProsesWidgets({
    super.key,
    required this.juduls,
    required this.tema,
    required this.onChangeState,
    required this.namaobj,
    required this.idTipeMediaTanam,
    required this.rumus,
    required this.dropdowns,
    required this.indexmenu,
    required this.indexsubmenu,
    this.namaCategoryTanam,
    this.datakatRumus,
    required this.idBentukMediaTanam,
    required this.satuan,
    required this.warna,
    // required this.indexSubmenu
  });

  @override
  _ProsesWidgetsState createState() => _ProsesWidgetsState();
}

int drop = 0;
int droping = 0;
// Map Varr = {};

List<TextEditingController> myControlerssi(Map data) {
  return List<TextEditingController>.generate(
      data.length,
      (i) => TextEditingController(
          text: (data.values.elementAt(i)[1] == null)
              ? "0"
              : (data.values.elementAt(i)[1].toString())));
}

List<TextEditingController> myControl(Map data) {
  return List<TextEditingController>.generate(
      data.length,
      (i) => TextEditingController(
          text: (data.values.toList()[i] == null)
              ? "0"
              : (data.values.toList()[i].toString())));
}

class _ProsesWidgetsState extends State<ProsesWidgets> {
  // int indexKe = 0;
  // changeSatuan(satuanm,
  final ValueNotifier<bool> _boolNotifier = ValueNotifier<bool>(false);

  String satuanm = "m";

  int indexrumusMediaTanamfix = 0;

  List<Widget> fieldso(
      int indexKesValue, Map data, int indexMediaTanam, String satuan) {
    List<Widget> fieldsss = [];

    int indexKes = ids.indexOf(indexKesValue);
    // // setState(() {
    // print("field sebelum ${data.keys.toList().length} ${List<TextEditingController>.from(
    //      widget.datakatRumus[indexKes].fieldValue)}");
    fieldsss = List<Widget>.generate(data.keys.toList().length, (index) {
      TextEditingController controllers =
          List<TextEditingController>.from(myControlersso).toList()[index];

      return Fields(
        controller: (controllers.text.isEmpty)
            ? TextEditingController(text: "0")
            : controllers,
        // dataKategoriInisialisasi.where((element) => element.vari == data.keys.elementAt(index)[0].toString()).first.satuan
        satuan: (data.keys.elementAt(index).toString() == "LMt" ||
                data.keys.elementAt(index).toString() == "LJt")
            ? satuanm == "cm"
                ? "cm"
                : "m"
            : satuanm == "cm"
                ? "cm"
                : dataKategoriInisialisasi
                    .where((element) =>
                        element.vari == data.keys.elementAt(index).toString())
                    .first
                    .satuan
                    .toString(),
        title: data.values.elementAt(index)[0].toString(),
        tema: widget.tema,
        onStateChange: (valu) {
          String values = valu;
          if (valu.isEmpty) {
            valu = "0";
          }
          // dataVariabel[data.keys.toList()[index]] = values;
          print("valueqw ${controllers.text}");
          // dataVariabel.update(data.keys.toList()[index], (value) => value = values);

          c.satuan.value = satuanm;
          onPreso(indexKes, satuan);
          c.layerinfo.value = false;
          c.labelLayerinfo.value = filtersdata[(c.indexMenuRawatan.value == 3 ||
                      c.indexMenuRawatan.value == 4)
                  ? 0
                  : indexMediaTanam]
              .mediatanam;

          // (c.satuan.value == "cm")?double.tryParse(values)!/100:double.tryParse(values);
        },
        inputType: TextInputType.numberWithOptions(decimal: true),
        enable: true,
      );
    });

    // });

    return fieldsss;
  }

  Map data = {};
  void onPreso1(int indexKe, String satuan) {
    setState(() {
      data = dataVariabel;
      // changeSatuan(satuanm,  dataVariabel);

      myControlersso.asMap().forEach((index, element) {
        _boolNotifier.addListener(() {
          if (_boolNotifier.value) {
            double.tryParse((element.text.isEmpty)
                ? "0"
                : (satuanm == "cm")
                    ? (double.tryParse(element.text)! * 100).toString()
                    : element.text);

            data[data.keys.elementAt(index)][1] =
                double.tryParse((element.text.isEmpty)
                    ? "0"
                    : (satuanm == "cm")
                        ? (double.tryParse(element.text)! * 100).toString()
                        : element.text);
            dataKategoriInisialisasi[dataKategoriInisialisasi.where((element) => element.vari == data.keys.toList()[index]).first.id].nilai =
                double.tryParse((element.text.isEmpty)
                    ? "0"
                    : (satuanm == "cm")
                        ? (double.tryParse(element.text)! * 100).toString()
                        : element.text)!;
          } else {
            double.tryParse((element.text.isEmpty)
                ? "0"
                : (satuanm == "cm")
                    ? (double.tryParse(element.text)! / 100).toString()
                    : element.text);

            data[data.keys.elementAt(index)][1] =
                double.tryParse((element.text.isEmpty)
                    ? "0"
                    : (satuanm == "cm")
                        ? (double.tryParse(element.text)! / 100).toString()
                        : element.text);
            dataKategoriInisialisasi[dataKategoriInisialisasi.where((element) => element.vari == data.keys.toList()[index]).first.id].nilai =
                double.tryParse((element.text.isEmpty)
                    ? "0"
                    : (satuanm == "cm")
                        ? (double.tryParse(element.text)! / 100).toString()
                        : element.text)!;

            // double.tryParse((element.text.isEmpty)?"0":element.text);
            //
            // data[data.keys.elementAt(index)][1] = double.tryParse((element.text.isEmpty)?"0":element.text);
            // dataKategoriInisialisasi[dataKategoriInisialisasi
            //     .where((element) => element.vari == data.keys.toList()[index])
            //     .first
            //     .id]
            //     .nilai = double.tryParse((element.text.isEmpty)?"0":element.text)!;
          }
        });

        myControlersso = myControlerssi(data);
        // widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlersso;
        // widget.datakatRumus![indexrumusMediaTanamfix].valuess = data;
        // print("datanya ${data}");

        fieldo = fieldso(indexKe, data, indexMediaTanam, satuanm);
        // print("datanya1 ${data}");
        widget.dropdowns == true
            ? {
                cariVarUpdate(
                    "LMt",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm)
                // (c.satuan.value == "cm" )? cariVarUpdate("LMt", false, cariValue("LMt")/100, "", 0):   cariVarUpdate("LMt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0)
              }
            : {
                cariVarUpdate(
                    "LJt",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm),
                cariVarUpdate(
                    "KBBM",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm)
              };

        // if(c.selectedItemCalcT.value == 2 ){
        //   cariVarUpdate(
        //       "LJt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0);
        //    }

        double nilai1 = cariValue("LMt");
        print(
            " ini values 2 ${cariValue("LMt")}  ${widget.datakatRumus![indexrumusMediaTanamfix].rumus}}");
      });
      // if (satuanm == "cm"){
      //
      //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")/1000:cariValue("LJt")/1000, "", c.ObjectIndexSelectedEdit.value);
      //
      // }else{
      //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")*1000:cariValue("LJt")*1000, "", c.ObjectIndexSelectedEdit.value);
      //
      // }

      // if (satuanm == "cm"){
      //   cariVarUpdate("LMt", false, cariValue("LMt")/100, "", c.ObjectIndexSelectedEdit.value);
      //
      // }else{
      //   cariVarUpdate("LMt", false, cariValue("LMt"), "", c.ObjectIndexSelectedEdit.value);
      // }
      dataVariabel = data;

      dataKategoriRumus
          .where((element) => element.id == ids[indexrumusMediaTanamfix])
          .first
          .valuess = data;

      widget.datakatRumus![indexrumusMediaTanamfix].valuess = dataVariabel;
      widget.onChangeState(indexMediaTanam, indexrumusMediaTanamfix, satuanm,
          data, cariValue("LMt").toString());
      print(
          "data input ${cariValue("KpH")} $indexMediaTanam $dataidrumus ${dataidrumus[widget.idBentukMediaTanam]} $ids ${ids[widget.idBentukMediaTanam]}");
    });
  }

  void onPreso(int indexKe, String satuan) {
    setState(() {
      // Map asa = asaa.map((key, value) => value.values);

      data = dataVariabel;
      // changeSatuan(satuanm,  dataVariabel);

      myControlersso.asMap().forEach((index, element) {
        //
        data[data.keys.elementAt(index)][1] =
            double.tryParse((element.text.isEmpty) ? "0" : element.text);

        dataKategoriInisialisasi[dataKategoriInisialisasi.where((element) => element.vari == data.keys.toList()[index]).first.id].nilai =
            double.tryParse((element.text.isEmpty)
                ? "0"
                : (satuanm == "cm")
                    ? (double.tryParse(element.text)! / 100).toString()
                    : (double.tryParse(element.text)!).toString())!;

        myControlersso = myControlerssi(data);
        // widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlersso;
        // widget.datakatRumus![indexrumusMediaTanamfix].valuess = data;
        // print("datanya ${data}");

        fieldo = fieldso(indexKe, data, indexMediaTanam, satuanm);
        // print("datanya1 ${data}");
        widget.dropdowns == true
            ? {
                cariVarUpdate(
                    "LMt",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm)
                // (c.satuan.value == "cm" )? cariVarUpdate("LMt", false, cariValue("LMt")/100, "", 0):   cariVarUpdate("LMt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0)
              }
            : {
                cariVarUpdate(
                    "LJt",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm),
                cariVarUpdate(
                    "KBBM",
                    true,
                    1.0,
                    widget.datakatRumus![indexrumusMediaTanamfix].rumus,
                    0,
                    satuanm)
              };

        // if(c.selectedItemCalcT.value == 2 ){
        //   cariVarUpdate(
        //       "LJt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0);
        //    }

        double nilai1 = cariValue("LMt");
        print(
            " ini values 2 ${cariValue("LMt")}  ${widget.datakatRumus![indexrumusMediaTanamfix].rumus}}");
      });
      // if (satuanm == "cm"){
      //
      //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")/1000:cariValue("LJt")/1000, "", c.ObjectIndexSelectedEdit.value);
      //
      // }else{
      //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")*1000:cariValue("LJt")*1000, "", c.ObjectIndexSelectedEdit.value);
      //
      // }

      // if (satuanm == "cm"){
      //   cariVarUpdate("LMt", false, cariValue("LMt")/100, "", c.ObjectIndexSelectedEdit.value);
      //
      // }else{
      //   cariVarUpdate("LMt", false, cariValue("LMt"), "", c.ObjectIndexSelectedEdit.value);
      // }
      dataVariabel = data;

      dataKategoriRumus
          .where((element) => element.id == ids[indexrumusMediaTanamfix])
          .first
          .valuess = data;

      widget.datakatRumus![indexrumusMediaTanamfix].valuess = dataVariabel;
      widget.onChangeState(indexMediaTanam, indexrumusMediaTanamfix, satuanm,
          data, cariValue("LMt").toString());
      print(
          "data input ${cariValue("KpH")} $indexMediaTanam $dataidrumus ${dataidrumus[widget.idBentukMediaTanam]} $ids ${ids[widget.idBentukMediaTanam]}");
    });
  }

  List<TextEditingController> myControlersso = [];

  List<Widget> fieldo = [];
  Map dataVariabel = {};
  // Map dataVariabelCm = {};
  int indexMediaTanam = 0;

  @override
  void dispose() {
    // Jangan lupa untuk menghapus listener ketika tidak diperlukan lagi
    _boolNotifier.dispose();
    super.dispose();
  }

  // if(satuanm=="cm"){
  // print("dsa");
  // cariValuenUpdate("LMt", cariValue("LMt")/1000000);
  // }

  @override
  void initState() {
    filtersdata = dataKategoriJenisPerhitungan
        .where((element) =>
            element.id_menurawatan == c.indexMenuRawatan.value.toString())
        .toList();
    super.initState();

    indexMediaTanam = widget.idTipeMediaTanam;
    ids = dataKategoriRumus
        .where((e) => e.idMediaTanam == indexMediaTanam)
        .map((ei) => ei.id)
        .toList();
    indexrumusMediaTanamfix = widget.idBentukMediaTanam;
    dataidrumus = dataKategoriRumus
        .where((e) => e.idMediaTanam == indexMediaTanam)
        .map((ei) => ei.nama)
        .toList();

    if (indexMediaTanam == 1) {
      satuanm = widget.satuan;
      // c.satuan.value = "cm";
    } else {
      satuanm = widget.satuan;
      // c.satuan.value = "m";
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Widget masih terpasang, aman untuk melakukan pembaruan UI
        print("satuanm ${c.selectedItemCalcT.value} $satuanm $indexMediaTanam");
        // c.satuan.value = satuanm;
        // cariVarUpdate("LMt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, c.ObjectIndexSelectedEdit.value);
        // cariValue("LMt")
      }
    });
    // variables(dataKategoriRumus[indexrumusMediaTanamfix].rumus);
    // if(widget.datakatRumus![indexrumusMediaTanamfix].valuess.isEmpty){
    //   widget.datakatRumus![indexrumusMediaTanamfix].valuess =  variablesNew(datakategorirum[indexrumusMediaTanamfix].rumus, 0);
    // }
    if (widget.datakatRumus![indexrumusMediaTanamfix].valuess.isEmpty) {
      dataVariabel =
          variablesNew(widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0);
      // dataVariabelCm = variablesNew(widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0);
    } else {
      dataVariabel = widget.datakatRumus![indexrumusMediaTanamfix].valuess;
      // dataVariabelCm = widget.datakatRumus![indexrumusMediaTanamfix].valuess;
    }
    // if(satuanm =="cm"){
    //   myControlersso = myControlerssi(dataVariabelCm);
    //   fieldo =
    //       fieldso(indexrumusMediaTanamfix, dataVariabelCm, indexMediaTanam, satuanm);
    //
    //   rumus_Akhir = widget.datakatRumus![indexrumusMediaTanamfix].rumus;
    //
    // }else{
    myControlersso = myControlerssi(dataVariabel);
    fieldo = fieldso(
        indexrumusMediaTanamfix, dataVariabel, indexMediaTanam, satuanm);

    rumus_Akhir = widget.datakatRumus![indexrumusMediaTanamfix].rumus;
    // }

    print(
        "variabelsa - => INDEX $indexrumusMediaTanamfix $dataVariabel $indexMediaTanam");

    // print(" ini values 1 ${dataVariabel} ${ widget.datakatRumus![indexrumusMediaTanamfix].fieldValue} ${dataKategoriRumus[indexrumusMediaTanamfix].valuess }  ${ widget.datakatRumus![indexrumusMediaTanamfix].valuess}");
    // myControlersso = myControlerssi(dataVariabel);
    // dataKategoriRumus[indexrumusMediaTanamfix].fieldValue = myControlersso;

    onPreso(indexrumusMediaTanamfix, satuanm);

    print(
        "data input $indexMediaTanam $dataidrumus ${dataidrumus[widget.idBentukMediaTanam]} $ids ${ids[widget.idBentukMediaTanam]}");
  }

  int iddataPerhitunganLuasMediaTanam = 0;

  int indexrumusMediaTanam = drop;

  List dataidrumus = [drop];
  List dropdownKey = [];
  List dropdownSatuan = [];
  List ids = [];

  String rumus_Akhir = "";

  Map<dynamic, dynamic> changeSatuan(
      String satuanms, Map<dynamic, dynamic> datavarrINPUT) {
    Map<dynamic, dynamic> datavarr = Map.of(datavarrINPUT);

    if (satuanms == "m") {
      datavarr.forEach((key, value) {
        setState(() {
          double po = (value[1].runtimeType.toString() == "String")
              ? double.tryParse(value[1])
              : value[1];

          datavarr[key] = [value[0], (po).toString()];
          // print('centimeter $key:${[value[0], po / 100]}');
        });
      });
      print('data cm $datavarr');
      return datavarr;
    } else {
      datavarr.forEach((key, value) {
        setState(() {
          double po = (value[1].runtimeType.toString() == "String")
              ? double.tryParse(value[1])
              : value[1];

          datavarr[key] = [value[0], (po / 100).toString()];
        });
      });

      return datavarr;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("idesk${widget.idBentukMediaTanam}");

    dropdownKey = [
      filtersdata.map((e) => e.mediatanam).toList()[
          (c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4)
              ? 0
              : indexMediaTanam]
    ];
    dropdownSatuan = ["cm", "m"];
    print("Tipe Media Tanam select-> $dropdownKey");

    // mengambil id sesuai kategory media tanam

    indexrumusMediaTanam = ids[indexrumusMediaTanamfix];

    // print("index indexrumusMediaTanam  ${indexrumusMediaTanam } ${ids}" );
    // dataidrumus = dataKategoriRumus
    //     .where((e) => e.idMediaTanam == indexMediaTanam)
    //     .map((ei) => ei.nama)
    //     .toList();

    // print("Kategori Rumus sesuai id -> ${dataidrumus}");

    if (widget.dropdowns == true) {
      // print("field awal swa ${dataKategoriRumus[indexrumusMediaTanam].valuess} ${dataKategoriRumus[indexrumusMediaTanam].fieldValue}");
      //
      // print(
      //     "Varry  ${Map.of( widget.datakatRumus![indexrumusMediaTanamfix].valuess) }");
      //  widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlerssi(Map.of( widget.datakatRumus![indexrumusMediaTanam].valuess));
      // fieldo = fieldso(indexrumusMediaTanam, Map.of( widget.datakatRumus![indexrumusMediaTanamfix].valuess), indexMediaTanam, satuanm);
    } else {
      // indexrumusMediaTanam = dataKategoriRumus
      //     .where((element) => element.rumus == widget.rumus)
      //     .first
      //     .id;
      // variables(widget.rumus);
      //
      // // dataVariabel = dataKategoriRumus[indexrumusMediaTanam].valuess;
      // myControlersso = myControlerssi(Map.of( widget.datakatRumus![indexrumusMediaTanam].valuess));
      //
      // // dataKategoriRumus[indexrumusMediaTanam].valuess = Varr;
      // myControlersso =
      //     List<TextEditingController>.generate(
      //         Map.of( widget.datakatRumus![indexrumusMediaTanam].valuess).length,
      //         (i) => TextEditingController(
      //             text: (Map.of( widget.datakatRumus![indexrumusMediaTanam].valuess).values.elementAt(i)[1].toString())));
      //
      // // dataKategoriRumus
      // //     .where((element) => element.rumus == widget.rumus)
      // //     .first
      // //     .fieldValue = myControlersso;
      //
      // indexMediaTanam = dataKategoriRumus
      //     .where((element) => element.rumus == widget.rumus)
      //     .first
      //     .idMediaTanam;
      // fieldo = fieldso(
      //     dataKategoriRumus
      //         .where((element) => element.rumus == widget.rumus)
      //         .first
      //         .id,
      //     Map.of( widget.datakatRumus![indexrumusMediaTanamfix].valuess),
      //     indexMediaTanam,
      //     satuanm);
      // rumus_Akhir = widget.rumus;
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // Access constraints.maxWidth and constraints.maxHeight
      // to get the maximum available width and height.

      return CardFields(
        tema: widget.tema,
        judul: widget.juduls,
        columns: Padding(
          padding: EdgeInsets.only(
              // horizontal: widthfit(defaultPadding / 2),
              right: heightfit(defaultPadding),
              left: heightfit(defaultPadding),
              top: heightfit(defaultPadding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.indexmenu != 0)
                Container(
                  child: ValueListenableBuilder<bool>(
                      valueListenable: _boolNotifier,
                      builder: (context, value, child) {
                        return SwitchListTile(
                            title: Text(
                              satuanm,
                              style: TextStyle(fontSize: heightfit(26)),
                            ),
                            // subtitle: Text("Satuan",style: TextStyle(fontSize: heightfit(26)),),
                            value: (satuanm == "cm") ? true : false,
                            onChanged: (bool value) {
                              setState(() {
                                c.checked.value = value;
                                satuanm = (value == true) ? "cm" : "m";

                                _boolNotifier.value = value;
                                // myControlersso.asMap().forEach((index, element) {
                                //   data[data.keys.elementAt(index)][1] = double.tryParse((element.text.isEmpty)?"0":(satuanm == "cm")?(double.tryParse(element.text)!*100!).toString():(double.tryParse(element.text)!).toString());
                                //
                                //   dataKategoriInisialisasi[dataKategoriInisialisasi
                                //       .where((element) => element.vari == data.keys.toList()[index])
                                //       .first
                                //       .id]
                                //       .nilai = double.tryParse((element.text.isEmpty)?"0":(satuanm == "cm")?(double.tryParse(element.text)!*100!)!.toString():(double.tryParse(element.text)!).toString())!;
                                //
                                //
                                // });
                                // if(value == true){
                                //   dataVariabel.keys.map((e) => e[1]/1000);
                                // }
                                // c.satuan.value = satuanm;
                                // if (satuanm == "cm"){
                                //
                                //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")/1000:cariValue("LJt")/1000, "", c.ObjectIndexSelectedEdit.value);
                                //
                                // }else{
                                //   cariVarUpdate((widget.dropdowns == true)?"LMt":"LJt", false, (widget.dropdowns == true)?  cariValue("LMt")*1000:cariValue("LJt")*1000, "", c.ObjectIndexSelectedEdit.value);
                                //
                                // }
                                // print("${satuanm} ${c.satuan.value}$value");

                                // hasillahan = double.tryParse(convertRumus(Map.of( widget.datakatRumus![indexrumusMediaTanamfix].valuess),  widget.datakatRumus![indexrumusMediaTanamfix].rumus)
                                //     .interpret()
                                //     .toDouble()
                                //     .toStringAsFixed(3))!;
                                //
                                // widget.onChangeState(indexMediaTanam, indexMediaTanam, "m", Map.of( widget.datakatRumus![indexrumusMediaTanamfix].valuess),
                                //     hasillahan.toString());
                                c.satuan.value = satuanm;

                                myControlersso
                                    .asMap()
                                    .forEach((index, element) {
                                  //
                                  data[data.keys.elementAt(index)]
                                      [1] = double.tryParse((element
                                          .text.isEmpty)
                                      ? "0"
                                      : (value)
                                          ? (double.tryParse(element.text)! *
                                                  100)
                                              .toString()
                                          : (double.tryParse(element.text)! /
                                                  100)
                                              .toString());
                                  dataKategoriInisialisasi[
                                          dataKategoriInisialisasi
                                              .where((element) =>
                                                  element.vari ==
                                                  data.keys.toList()[index])
                                              .first
                                              .id]
                                      .nilai = double.tryParse((element
                                          .text.isEmpty)
                                      ? "0"
                                      : (value)
                                          ? (double.tryParse(element.text)!)
                                              .toString()
                                          : (double.tryParse(element.text)! /
                                                  100)
                                              .toString())!;

                                  myControlersso = myControlerssi(data);
                                  // widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlersso;
                                  // widget.datakatRumus![indexrumusMediaTanamfix].valuess = data;
                                  // print("datanya ${data}");

                                  fieldo = fieldso(indexrumusMediaTanamfix,
                                      data, indexMediaTanam, satuanm);
                                  // print("datanya1 ${data}");
                                  // widget.dropdowns == true
                                  //     ? {
                                  //   cariVarUpdate("LMt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0,satuanm)
                                  //   // (c.satuan.value == "cm" )? cariVarUpdate("LMt", false, cariValue("LMt")/100, "", 0):   cariVarUpdate("LMt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0)
                                  // }: {
                                  //   cariVarUpdate(
                                  //       "LJt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0,satuanm),
                                  //   cariVarUpdate(
                                  //       "KBBM", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0,satuanm)
                                  // };
                                  //
                                  // // if(c.selectedItemCalcT.value == 2 ){
                                  // //   cariVarUpdate(
                                  // //       "LJt", true, 1.0, widget.datakatRumus![indexrumusMediaTanamfix].rumus, 0);
                                  // //    }
                                  //
                                  // double nilai1 = cariValue("LMt");
                                  // print(" ini values 2 ${cariValue("LMt")}  ${widget.datakatRumus![indexrumusMediaTanamfix].rumus}}");
                                });

                                // if(filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["adaJenisTanah"] == true){
                                //   c.massaJenis.value = cariValue("q");
                                //   // cariVarUpdate("t", false, (c.Checksatuandalamtanah.value == true)?double.tryParse(filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["ketebalanTanah"].text)!/100:double.tryParse(filterdataobject()[c.ObjectIndexSelectedEdit.value].propertyLainnya["ketebalanTanah"].text)!, "", 0);
                                //   // onPresosMtT(c.id_type_tanah.value,false);
                                //
                                //   // onPreso(indexrumusMediaTanamfix,  satuanm);
                                //
                                //   hitung(c.indexsubMenuRawatan.value, "(bTPt/bTHa)*JPk",
                                //       cariValue("vTPt").toString());
                                // // print("s1dsa ${} ${cariValue("vTPt")}");
                                // }else{
                                //   // onPreso(indexrumusMediaTanamfix,  satuanm);
                                //   hitung(c.indexsubMenuRawatan.value, "(LMt/10000)*JPk",
                                //       cariValue("LMt").toString());
                                // }
                                //
                                //
                                //
                                // // widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlersso;
                                // // widget.datakatRumus![indexrumusMediaTanamfix].valuess = data;
                                // // print("datanya ${data}");
                                //
                                // // fieldo = fieldso(indexKe, data, indexMediaTanam, satuanm);
                                //
                              });
                            });
                      }),
                ),
              (widget.dropdowns == true)
                  ? Column(
                      children: [
                        DropDowns((newActivity) {
                          setState(
                            () {
                              c.satuan.value = satuanm;
                              print(
                                  "dataidrumus  + $dropdownKey ${dataKategoriRumus.where((element) => element.idMediaTanam == indexMediaTanam).map((e) => e.nama).toList()} ${filtersdata.map((e) => e.mediatanam)}");
                              dataidrumus = dataKategoriRumus
                                  .where((element) =>
                                      element.idMediaTanam == indexMediaTanam)
                                  .map((e) => e.nama)
                                  .toList();

                              onPreso(indexrumusMediaTanamfix, satuanm);
                            },
                          );
                        }, widget.tema, dropdownKey, dropdownKey[0],
                            dropdownKey[0], "Tipe media ", []),
                        DropDowns((newActivity) {
                          setState(
                            () {
                              c.satuan.value = satuanm;
                              indexrumusMediaTanamfix =
                                  dataidrumus.indexOf(newActivity);
                              (c.selectedItemCalcT.value == 1)
                                  ? c.indpots.value =
                                      ids[indexrumusMediaTanamfix]
                                  : 0;

                              c.indexselectmediaLahan.value =
                                  indexrumusMediaTanamfix;

                              droping = indexrumusMediaTanamfix;
                              drop = indexrumusMediaTanamfix;

                              if (widget.datakatRumus![indexrumusMediaTanamfix]
                                  .valuess.isEmpty) {
                                dataVariabel = variablesNew(
                                    widget
                                        .datakatRumus![indexrumusMediaTanamfix]
                                        .rumus,
                                    0);
                                // widget.datakatRumus![indexrumusMediaTanamfix].fieldValue = myControlerssi(Map.of(widget.datakatRumus![indexrumusMediaTanamfix].valuess));
                                // widget.datakatRumus![indexrumusMediaTanamfix].valuess = dataVariabel;
                                // // widget.onChangeState(indexMediaTanam,indexrumusMediaTanamfix, "m",dataVariabel,cariValue("LMt").toString());
                                //
                              } else {
                                dataVariabel = widget
                                    .datakatRumus![indexrumusMediaTanamfix]
                                    .valuess;

                                // print("field variabel 1 => INDEX ${indexrumusMediaTanamfix} ${dataVariabel} ${filterdataobject().map((e) => e.kategoriRumusKu.map((e) => e.valuess)).toList()}");
                              }

                              myControlersso = myControlerssi(dataVariabel);

                              onPreso(indexrumusMediaTanamfix, satuanm);

                              print(
                                  "dataidrumus1 + ${dataidrumus.toSet().toList()} ${dataidrumus[widget.idBentukMediaTanam]} ${dataidrumus[indexrumusMediaTanamfix]}");
                            },
                          );
                        },
                            widget.tema,
                            (c.indexMenuRawatan.value == 5)
                                ? [dataidrumus.toSet().toList()[0]]
                                : dataidrumus.toSet().toList(),
                            (c.indexMenuRawatan.value == 5)
                                ? dataidrumus.toSet().toList()[0]
                                : dataidrumus
                                    .toSet()
                                    .toList()[widget.idBentukMediaTanam],
                            (c.indexMenuRawatan.value == 5)
                                ? dataidrumus.toSet().toList()[0]
                                : dataidrumus
                                    .toSet()
                                    .toList()[indexrumusMediaTanamfix],
                            "Bentuk media Tanam",
                            []),
                      ],
                    )
                  : Container(),
              // DropDowns((newActivity) {
              //   setState(
              //         () {
              //       // c.satuan.value = newActivity;
              //       sat = newActivity;
              //       print(c.satuan.value);
              //     },
              //   );
              // }, widget.tema, dropdownSatuan, c.satuan.value,
              //     sat, "Tipe Satuan"),
              Column(
                children: fieldo,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: heightfit(defaultPadding)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${filtersdata[(c.indexMenuRawatan.value == 3 || c.indexMenuRawatan.value == 4) ? 0 : indexMediaTanam].mediatanam} ${c.indexMenuRawatan.value == 1 ? "${widget.namaCategoryTanam}" : datakategorisubMenuRawatan.where((element) => element.id_MenuRawatan == widget.indexmenu.toString()).toList()[widget.indexsubmenu].namaKomoditi}",
                        style: TextStyle(
                            color: widget.tema,
                            fontWeight: FontWeight.bold,
                            fontSize: heightfit(20))),
                    Container(
                        // height: heightfit(100),
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // dataKategoriInisialisasi[dataKategoriInisialisasi
                          //     .where((element) => element.vari == v)
                          //     .first
                          //     .id]
                          //     .nilai = double.tryParse((element.text.isEmpty)?"0":element.text)!;

                          children: List<Widget>.from(dataVariabel.keys
                              // .asMap()
                              .map((v) {
                            // if(satuanm=="cm"){
                            //   dataKategoriInisialisasi[dataKategoriInisialisasi
                            //       .where((element) => element.vari == v)
                            //       .first
                            //       .id]
                            //       .nilai = dataKategoriInisialisasi[dataKategoriInisialisasi
                            //       .where((element) => element.vari == v)
                            //       .first
                            //       .id]
                            //       .nilai/1000000;
                            // }
                            double datapusat = dataKategoriInisialisasi[
                                    dataKategoriInisialisasi
                                        .where((element) => element.vari == v)
                                        .first
                                        .id]
                                .nilai;

                            return RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: (datapusat.toString() != "" &&
                                          datapusat != 0.0 &&
                                          datapusat != 0 &&
                                          datapusat.toString() != "0" &&
                                          datapusat != 0.0)
                                      ? "${dataVariabel[v][0]} :${satuanm == "cm" ? datapusat : datapusat} ${(v == "LMt" || v == "LJt") ? satuanm == "cm" ? "cm" : "m" :
                                          // satuanm == "cm" ? "cm" :
                                          dataKategoriInisialisasi.where((element) => element.vari == v).first.satuan.toString()}"
                                      : "${v[0]} perlu diisi..",
                                  style: TextStyle(
                                      color: (datapusat != 0.0 &&
                                              datapusat != 0 &&
                                              datapusat.toString() != "0" &&
                                              datapusat != 0.0)
                                          ? widget.tema
                                          : Colors.red,
                                      fontSize: heightfit(20)),
                                )
                              ]),
                            );
                          })).toList(),
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            // edited
                            text:
                                // "${ widget.datakatRumus![indexrumusMediaTanamfix].nama}\n${convertRumus( dataVariabel,  widget.datakatRumus![indexrumusMediaTanamfix].rumus)}\n"
                                // (c.islabelLayer)?"${cariStringnamavar("LJt")} : ${cariValue("LMt")} ${c.satuan.value}³",

                                (c.indexMenuRawatan.value == 0)
                                    ? "jarak yang ditempuh per liter BBM : ${(widget.dropdowns == true) ? cariValue("LMt") : cariValue("LJt")} ${dataKategoriInisialisasi.where((element) => element.vari == "KBBM").first.satuan.toString()}"
                                    : "Hasil luasan : ${(widget.dropdowns == true) ? (satuanm == "cm") ? cariValue("LMt") : cariValue("LMt") : (satuanm == "cm") ? cariValue("LJt") : cariValue("LJt")} m²",
                            // ,
                            style: TextStyle(
                                color: widget.tema, fontSize: heightfit(20)),
                          )
                        ]))
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
        onChangeState: () {},
        indexmenu: widget.indexmenu,
        indexsubmenu: widget.indexsubmenu,
        warna: widget.warna,
      );
    });
  }
}

//
// untuk proses kalkulasi dengan format lama
class ProsesWidgetsold extends StatefulWidget {
  final List dataproses;
  final List datahasils;
  final Color tema;
  final String namaobj;
  final int stateID;
  final Function(int, List, List, List) onChangeState;

  const ProsesWidgetsold(
      {super.key,
      required this.dataproses,
      required this.tema,
      required this.onChangeState,
      required this.namaobj,
      required this.stateID,
      required this.datahasils});

  @override
  _ProsesWidgetsoldState createState() => _ProsesWidgetsoldState();
}

class _ProsesWidgetsoldState extends State<ProsesWidgetsold> {
  // int indexKe = 0;
  List<TextEditingController> myControlerss(int indexKes) =>
      List<TextEditingController>.generate(
          widget.dataproses[indexKes].variabels.length,
          (i) => TextEditingController(
              text: (widget.dataproses[indexKes].variabels.values
                  .elementAt(i)[1]
                  .toString())));

  List<Widget> fieldss(int indexKes) {
    List<Widget> fieldsss = [];
    setState(() {
      fieldsss = List<Widget>.generate(
          widget.dataproses[indexKes].variabels.length, (index) {
        TextEditingController controllers =
            List<TextEditingController>.from(myControlers)[index];
        return Fields(
          controller: controllers,
          satuan: List.from(widget.dataproses[indexKes].variabels.keys
                      .toList())[index] ==
                  "berat"
              ? "Kg"
              : List.from(widget.dataproses[indexKes].variabels.keys.toList())[
                          index] ==
                      "TB_0"
                  ? "Bedengan"
                  : widget.dataproses[indexKes].satuan,
          title: widget.dataproses[indexKes].variabels.values
              .elementAt(index)[0]
              .toString(),
          tema: widget.tema,
          onStateChange: (values) {
            // setState(() {
            onPress(indexKes);

            // });
          },
          inputType: TextInputType.numberWithOptions(decimal: true),
          enable: true,
        );
      });
    });
    return fieldsss;
  }

  void onPress(indexKe) {
    Map<String, dynamic> rumusku = Map.from(widget.datahasils[0].rumus);
    Map<String, dynamic> rumuskuT2M = Map.from(widget.datahasils[0].rumus);
    List datainput = [];
    List dataprosess = [];
    List datahasil = [];
    print(
        "keys ${List.from(widget.dataproses[indexKe].variabels.keys.toList()).last}");
    setState(() {
      myControlers.asMap().forEach((index, element) {
        widget.dataproses[indexKe].variabels[
                widget.dataproses[indexKe].variabels.keys.elementAt(index)][1] =
            double.tryParse(element.text);
        //  datainput = [panajng, lebar]
        datainput.add(double.tryParse(element.text));

        widget.dataproses[indexKe]
                .hasil[widget.dataproses[indexKe].hasil.keys.elementAt(index)]
            [1] = double.tryParse(element.text);

        // satuan field
        widget.dataproses[indexKe].perhitungan[
                widget.dataproses[indexKe].perhitungan.keys.elementAt(index)]
            [1] = List.from(widget.dataproses[indexKe].variabels.keys.toList())[
                    index] ==
                "berat"
            ? "${element.text} Kg"
            : List.from(widget.dataproses[indexKe].variabels.keys.toList())[
                        index] ==
                    "TB_0"
                ? "${element.text} Bedengan"
                : "${element.text} ${widget.dataproses[indexKe].satuan}";
      });

      dataprosess = Map.from(widget.dataproses[indexKe].rumusStr)
          .values
          .map((value) =>
              "${convertRumus(widget.dataproses[indexKe].variabels, value[1])} = ${convertRumus(widget.dataproses[indexKe].variabels, value[1]).interpret().toDouble().toStringAsFixed(1)}")
          .toList();

      datahasil = Map.from(widget.dataproses[indexKe].rumusStr)
          .values
          .map((value) => double.tryParse(
                  convertRumus(widget.dataproses[indexKe].variabels, value[1])
                      .interpret()
                      .toDouble()
                      .toStringAsFixed(1))
              ?.toDouble())
          .toList();
      widget.dataproses[indexKe].perhitungan["luas"][1] = dataprosess;
      widget.dataproses[indexKe].hasilAkhir["0"][1] = datahasil;
      widget.datahasils[indexKe].input["Senyawa Aktif"] = datahasil;
      // print("ccobas ${datahasil}");
      // print("sebelum ${widget.datahasils[indexKe].input}");

      // print("sesudah ${widget.datahasils[indexKe].input}");

      if (widget.datahasils[0].nama == "Kalkulasi Majemuk ke Tunggal") {
        print("aktif vo");
        List asi2 = convertListRumus(widget.datahasils[0].input,
            List.from(rumusku["Rumus Kalkulasi Senyawa Aktif ke Pupuk"]));

        widget.datahasils[0].hasilAkhir["0"][1] =
            asi2.map((e) => e.toString().interpret().toDouble()).toList();

        // List asi2 = convertListRumus(widget.datahasils[0].input,
        //     List.from(rumusku["Rumus Kalkulasi Senyawa Aktif ke Pupuk"]));

        datainputanGF.value = [
          widget.dataproses[0].variabels["berat"][1].toInt(),
          List.from(widget.dataproses[0].variabels.values)
              .map((e) => e[1])
              .toList(),
          widget.dataproses[0].hasilAkhir["0"][1].map((e) => e).toList(),
          widget.datahasils[0].hasilAkhir["0"][1]
        ];
      } else {
        // print("aktif vso");
        // print("sebelum ${widget.datahasils[0].input["Dosis Pupuk"]}");
        gethasil();

        // print("sesudah ${widget.datahasils[0].input["Dosis Pupuk"]}");
        // print("sesudah ${widget.datahasils[0].input["SenyawaAktif"]}");
      }
      widget.onChangeState(indexKe, datainput, dataprosess, datahasil);
    });
  }

  List<TextEditingController> myControlers = [];
  List<Widget> fields = []; // penampungan inputan.
  @override
  Widget build(BuildContext context) {
    int indexKe = widget.stateID;

    myControlers = myControlerss(indexKe);

    // widget.dataproses[indexKe].fieldValue = myControlers;
    fields = fieldss(indexKe);

    return CardFields(
      tema: widget.tema,
      judul: widget.dataproses[indexKe].nama,
      columns: Padding(
        padding: EdgeInsets.only(top: heightfit(defaultPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.dataproses.map((e) => e.nama).toList().length > 1
                ? DropDowns((newActivity) {
                    // setState(
                    //   () {
                    indexKe = widget.dataproses
                        .map((e) => e.nama)
                        .toList()
                        .indexOf(newActivity);
                    myControlers = myControlerss(indexKe);
                    // widget.dataproses[indexKe].fieldValue = myControlers;
                    fields = fieldss(indexKe);
                    onPress(indexKe);
                    //   },
                    // );
                  },
                    widget.tema,
                    widget.dataproses.map((e) => e.nama).toList(),
                    widget.dataproses.map((e) => e.nama).toList()[0],
                    widget.dataproses.map((e) => e.nama).toList()[indexKe],
                    widget.namaobj, [])
                : Container(),
            Column(children: fields),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.dataproses[indexKe].nama}",
                      style: TextStyle(
                          color: widget.tema,
                          fontWeight: FontWeight.bold,
                          fontSize: heightfit(20))),
                  SizedBox(
                      height: heightfit(80),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: List<Widget>.from(widget
                            .dataproses[indexKe].perhitungan.values
                            .map((v) => RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: (v[1].toString() != "" &&
                                              v[1].toString() != "0.0" &&
                                              v[1].toString() != "0" &&
                                              v[1] != "0 m" &&
                                              v[1] != "0.0 m")
                                          ? "${v[0]} : ${v[1]}"
                                          : "Perlu Diisi..",
                                      style: TextStyle(
                                          color: widget.tema,
                                          fontSize: heightfit(20)),
                                    )
                                  ]),
                                ))).toList(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      onChangeState: () {},
      indexmenu: c.indexMenuRawatan.value,
      indexsubmenu: c.indexsubMenuRawatan.value,
      warna: Colors.white,
    );
  }
}
