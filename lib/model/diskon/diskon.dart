List diskon= [
  {
    "id": 0,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/banner_app.png",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "0"
  },
  {
    "id": 1,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/BANNER APPS-02.jpg",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "1"
  },
  {
    "id": 2,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/BANNER APPS-05.jpg",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "2"
  },
  {
    "id": 3,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/BANNER APPS-04.jpg",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "3"
  },
  {
    "id": 4,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/BANNER APPS-03.jpg",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "4"
  },
  {
    "id": 5,
    "created_at": "2023-10-07 23:04:13.982406+00",
    "nama": "Diskon",
    "kupon": "Rach",
    "waktu": "",
    "Img": "assets/images/BANNER APPS-06.jpg",
    "link": "https://shopee.co.id/rawatanofficialshop",
    "id_MenuRawatan": "5"
  }
];
class Diskon{
  int id;
  String nama;
  String Img;
  String kupon;
  String waktu;
  String link;
  String id_MenuRawatan;
  Diskon({
    required this.id,
    required this.nama,
    required this.Img,
    required this.kupon,
    required this.waktu,
    required this.link,
    required this.id_MenuRawatan,
  });

  Diskon.fromJson(Map json)
      : id = json["id"],
        nama = json["nama"],
        Img= json["Img"],
        kupon = json["kupon"],
        waktu = json["waktu"],
        link = json["link"],
        id_MenuRawatan = json["id_MenuRawatan"];

  static List<Diskon> decodew(List<dynamic> listData) {

    return (listData)
        .map<Diskon>((item) {
      // print("kolah ${item["id"]}");
      // print("kolah ${item["nama"]}");
      // print("kolah ${item["id_MenuRawatan"]}");
      // print("kolah ${item["link"]}");
      // print("kolah ${item["Img"]}");
      // print("kolah ${item["waktu"]}");
      // print("kolah ${item["kupon"]}");
      return Diskon.fromJson(item);})
        .toList();
  }

}

List<Diskon> datadiskon= [
  for (var i = 0; i < diskon.length; i++)
    Diskon(
        id: i,
        nama: diskon[i]["nama"],
        Img: diskon[i]["Img"],
        id_MenuRawatan: diskon[i]["id_MenuRawatan"],
        kupon: diskon[i]["kupon"],
      waktu : diskon[i]["waktu"],
        link :diskon[i]['link']
    )
];