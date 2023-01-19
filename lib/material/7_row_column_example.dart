import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  RowColumnExample({super.key});

  Widget rowExample = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [BlueBox(), BiggerBlueBox(), BlueBox()],
  );

  Widget columnExample = SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [BlueBox(), BiggerBlueBox(), BlueBox()],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: rowExample),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}

class BiggerBlueBox extends StatelessWidget {
  const BiggerBlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}








class RowColumnPractice extends StatelessWidget {
  const RowColumnPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/pisred.jpg"),
              const SizedBox(
              height: 20,
              ),
              const Text(
                "One Piece Film: RED",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 212, 0, 0)),
              ),
              const SizedBox(
                height: 1,
              ),
              const Text(
                " Piece adalah sebuah seri manga Jepang yang ditulis dan diilustrasikan oleh Bagas Bote. Manga ini telah dimuat di majalah Weekly Shōnen Jump milik Shueisha sejak tanggal 22 Juli 1997, dan telah dibundel menjadi 104 volume tankōbon hingga November 2022. Ceritanya mengisahkan petualangan Monkey D Luffy dan kru kapal yang humoris.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ulasan: "),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star),
                    ],
                  ),
                  Text("  dari 276 pengulas"),
                ],
              ),
              const SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.location_pin, color: Colors.red,),
                      Text("Location"),
                      Text("GRAND LINE")
                    ],
                  ),
                  // Column(
                  //   children: const [
                  //     Icon(Icons.access_time),
                  //     Text("OPEN"),
                  //     Text("09:00 AM - 09:00 PM")
                  //   ],
                  // ),
                  // Column(
                  //   children: const [
                  //     Icon(Icons.label),
                  //     Text("TICKETS"),
                  //     Text("Rp. 25.000")
                  //   ],
                  // ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
