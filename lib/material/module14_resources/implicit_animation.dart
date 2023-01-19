import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({super.key});

  @override
  State<ImplicitAnimationsExample> createState() =>
      _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  bool _bigger = false;

  void _buttonHandler() {
    setState(() {
      _bigger = !_bigger;
    });
  }

  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Without animation:"),
              ),
              Container(
                child: Image.asset("images/lake.jpg"),
                width: _bigger ? 300 : 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 8),
                child: Text("Using animation:"),
              ),
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                child: Image.asset("images/lake.jpg"),
                width: _bigger ? 300 : 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                duration: Duration(seconds: 2),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => _buttonHandler(),
                  child: Text(_bigger ? "Make it smaller" : "Make it bigger!"))
            ],
          ),
        )),
      ),
    );
  }
}

// class PaddingApp extends StatelessWidget {
//   const PaddingApp({super.key});

//   static const String _title = 'padding nganu';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const MyStatefulWidget(),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   double padValue = 0.0;
//   void _updatePadding(double value) {
//     setState(() {
//       padValue = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         AnimatedPadding(
//           padding: EdgeInsets.all(padValue),
//           duration: const Duration(seconds: 2),
//           curve: Curves.easeInOut,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 5,
//             color: Colors.blue,
//           ),
//         ),
//         Text('Padding: $padValue'),
//         ElevatedButton(
//             child: const Text('ganti padding'),
//             onPressed: () {
//               _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
//             }),
//       ],
//     );
//   }
// }

// class Anu extends StatelessWidget {
//   const Anu({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// [AnimationController]s can be created with `vsync: this` because of
// /// [TickerProviderStateMixin].
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 3),
//     vsync: this,
//   )..repeat();
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.fastOutSlowIn,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizeTransition(
//         sizeFactor: _animation,
//         axis: Axis.horizontal,
//         axisAlignment: -1,
//         child: const Center(
//           child: FlutterLogo(size: 200.0),
//         ),
//       ),
//     );
//   }
// }

class Ani extends StatelessWidget {
  const Ani({super.key});

  static const String _title = 'testing coy';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  'jangan sentuh aku',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
