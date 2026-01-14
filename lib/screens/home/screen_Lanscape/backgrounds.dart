import 'package:rawatt/components/tema_Page.dart';
import 'package:rawatt/model/data_.dart';
import 'package:rawatt/model/datafix.dart';
import 'package:rawatt/model/product/mdl_Produk.dart';
import 'package:rawatt/screens/convert/component/inisialisasi_var.dart';
import 'package:rawatt/screens/home/screen_Lanscape/main_content.dart';
import 'package:flutter/material.dart';

class BackgraundHomeR extends StatelessWidget {
  const BackgraundHomeR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DataProducts> shopItems = filterdataByPerusahaan(0);
    List selectedQuotesList = quotes;
    return BackgraundLanscape(
      widgets: Row(
        children: [
          // Flexible(
          //   fit: FlexFit.tight,
          //   flex: 2,
          //   child: ContentLeft(
          //     widgets: TentangPerusahaan(
          //         heights: heightfit(460),
          //         scrollDirection: Axis.vertical,
          //         selectedperusahaanList: perusahaan),
          //   ),
          // ),
          Flexible(
            fit: FlexFit.tight,
            flex: 6,
            child: MainContent(
                shopItems: shopItems, selectedQuotesList: selectedQuotesList),
          ),
        ],
      ),
    );
  }
}
