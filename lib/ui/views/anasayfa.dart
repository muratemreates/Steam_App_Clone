import 'package:flutter/material.dart';
import 'package:steam_app_clone/data/entity/functions.dart';
import 'package:steam_app_clone/data/entity/oyun.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  var tfController = TextEditingController();
  int seciliIndex = 0;
  Future<List<Oyun>> oyunlariGetir() async {
    var oyunListesi = <Oyun>[];
    var o1 = Oyun(
        id: 1,
        oyunAdi: "Red Dead Redemption",
        oyunResmi: "rdr2.jpg",
        fiyat: 1200);
    var o2 =
        Oyun(id: 2, oyunAdi: "Fifa 24", oyunResmi: "fifa24.jpg", fiyat: 750);
    var o3 =
        Oyun(id: 3, oyunAdi: "Last of Us", oyunResmi: "los.jpg", fiyat: 899);
    var o4 = Oyun(id: 4, oyunAdi: "GTA V", oyunResmi: "gta5.jpg", fiyat: 450);
    var o5 = Oyun(
        id: 4, oyunAdi: "Cyber Punk 2077", oyunResmi: "cyber.jpg", fiyat: 950);
    oyunListesi.addAll([o1, o2, o3, o4, o5]);
    print(oyunListesi);
    return oyunListesi;
  }

  Future<List<Oyun>> oyunlariGetir2() async {
    var oyunListesi = <Oyun>[];
    var o1 = Oyun(
        id: 1, oyunAdi: "Witcher III", oyunResmi: "witcher.jpg", fiyat: 390);
    var o2 =
        Oyun(id: 2, oyunAdi: "Survival", oyunResmi: "survival.jpg", fiyat: 250);
    var o3 = Oyun(
        id: 3, oyunAdi: "Anonymous Hacker", oyunResmi: "anon.jpg", fiyat: 899);
    oyunListesi.addAll([o1, o2, o3]);
    print(oyunListesi);
    return oyunListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 19, 41, 71),
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color.fromARGB(255, 20, 19, 19),
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                  width: MyMediaQuery.genislik(context, 0.65),
                  height: MyMediaQuery.yukseklik(context, 0.075),
                  child: SearchBar(
                    leading: Image.asset("images/st_ico.png"),
                    hintText: "STEAM",
                    trailing: <Widget>[
                      Tooltip(
                        message: "Search Games",
                        child: IconButton(
                            icon: const Icon(
                              Icons.search,
                            ),
                            onPressed: () {}),
                      )
                    ],
                  )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
                iconSize: 25,
              ),
              GestureDetector(
                onTap: () {
                  print("Basıldı");
                },
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: Image.asset("images/ellie.jpeg"),
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "MENÜ ▼ ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text("İSTEK LİSTESİ",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Text("CÜZDAN (\$0.00 USD)",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: SizedBox(
                height:
                    MyMediaQuery.yukseklik(context, 0.30), //yukseklik * 0.30,
                width: MyMediaQuery.ekranGenisligi(context),
                child: Image.asset(
                  "images/ind.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              "ÖNE ÇIKANLAR VE TAVSİYE EDİLENLER",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: SizedBox(
                height:
                    MyMediaQuery.yukseklik(context, 0.30), //yukseklik * 0.30,
                child: FutureBuilder<List<Oyun>>(
                  future: oyunlariGetir(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var oyunListem = snapshot.data;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: oyunListem!.length,
                        itemBuilder: (context, index) {
                          var oyun = oyunListem[index];
                          return SizedBox(
                            width: MyMediaQuery.genislik(
                                context, 0.90), //genislik * 0.90,
                            child: Card(
                                color: Colors.grey[900],
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: MyMediaQuery.yukseklik(
                                            context, 0.20),
                                        width: MyMediaQuery.genislik(
                                            context, 0.90),
                                        child: Image.asset(
                                          "images/${oyun.oyunResmi}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        oyun.oyunAdi,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("\$ ${oyun.fiyat} USD",
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
                    } else {
                      return const Center();
                    }
                  },
                ),
              ),
            ),
            const Text(
              "ÖZEL TEKLİFLER",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: MyMediaQuery.yukseklik(context, 0.50), //yukseklik * 0.50,
              child: FutureBuilder<List<Oyun>>(
                future: oyunlariGetir2(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var oyunListem = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: oyunListem!.length,
                      itemBuilder: (context, index) {
                        var oyun = oyunListem[index];
                        return SizedBox(
                          width: MyMediaQuery.genislik(
                              context, 0.90), //genislik * 0.90,
                          child: Card(
                            color: Colors.grey[900],
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MyMediaQuery.yukseklik(
                                        context, 0.35), //yukseklik * 0.35,
                                    child: Image.asset(
                                      "images/${oyun.oyunResmi}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: MyMediaQuery.genislik(
                                        context, 0.90), //genislik * 0.90,
                                    height: MyMediaQuery.yukseklik(
                                        context, 0.139), //yukseklik * 0.139,
                                    color: Colors.blue,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          oyun.oyunAdi,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        ),
                                        const Text(
                                          "11 Nis @ 20:00 Tarihinde teklif sona erecek.",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "\$ ${oyun.fiyat} USD",
                                          style: const TextStyle(
                                              color: Colors.greenAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
