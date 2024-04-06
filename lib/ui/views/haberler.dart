import 'package:flutter/material.dart';

class Haberler extends StatefulWidget {
  const Haberler({super.key});

  @override
  State<Haberler> createState() => _HaberlerState();
}

class _HaberlerState extends State<Haberler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Text(
                "HABERLER",
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
                iconSize: 25,
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
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 20, 19, 19),
      ),
     
    );
  }
}
