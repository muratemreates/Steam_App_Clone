import 'package:flutter/material.dart';
import 'package:steam_app_clone/main.dart';

class Bildirimler extends StatefulWidget {
  const Bildirimler({super.key});

  @override
  State<Bildirimler> createState() => _BildirimlerState();
}

class _BildirimlerState extends State<Bildirimler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 19, 19),
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              //Navigator.of(context).popUntil((contex) => contex.isFirst);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: Row(children: [
          const Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              "BİLDİRİMLER",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
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
      ),
    );
  }
}
