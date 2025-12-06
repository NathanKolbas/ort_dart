import 'package:flutter/material.dart';
import 'package:ort/ort.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized(throwOnFail: true);

  runApp(const MyApp());
}

const matmulModel = [
  8, 9, 18, 0, 58, 55, 10, 17, 10, 1, 97, 10, 1, 98, 18, 1, 99, 34, 6, 77, 97,
  116, 77, 117, 108, 18, 1, 114, 90, 9, 10, 1, 97, 18, 4, 10, 2, 8, 1, 90, 9,
  10, 1, 98, 18, 4, 10, 2, 8, 1, 98, 9, 10, 1, 99, 18, 4, 10, 2, 8, 1, 66, 2,
  16, 20
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Session? session;
  final vecOne = TextEditingController(text: '1, 2, 3, 4');
  final vecTwo = TextEditingController(text: '1, 2, 3, 4');
  final outputController = TextEditingController(text: 'Click "Execute" to see output');

  bool running = false;

  Tensor<double> _tensorFromText(String text) => Tensor.fromArrayF32(
    data: text.split(RegExp(r',\s+')).map((e) => double.parse(e)).toList(),
  );

  void _run() async {
    final session = this.session;
    if (session == null) {
      setState(() {
        outputController.text = 'Session is not ready... Please wait.';
      });
      return;
    }

    setState(() {
      running = true;
      outputController.text = '';
    });

    final Tensor<double> tensorA;
    try {
      tensorA = _tensorFromText(vecOne.text);
    } catch (_) {
      setState(() {
        running = false;
        outputController.text = 'Failed to parse vector one';
      });
      return;
    }

    final Tensor<double> tensorB;
    try {
      tensorB = _tensorFromText(vecTwo.text);
    } catch (_) {
      setState(() {
        running = false;
        outputController.text = 'Failed to parse vector two';
      });
      return;
    }

    final output = await session.run(inputValues: {
      'a': tensorA,
      'b': tensorB,
    });

    setState(() {
      running = false;
      outputController.text = 'Output is: ${output['c']!.data.first}';
    });
  }

  void init() async {
    session = await Session.builder()
      .withExecutionProviders([
        CUDAExecutionProvider(),
        CPUExecutionProvider(),
      ])
      .commitFromMemory(matmulModel);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    vecOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ORT Example/Demo')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 12,
            children: [
              TextField(
                controller: vecOne,
                decoration: InputDecoration(
                  labelText: 'Vector One',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: vecTwo,
                decoration: InputDecoration(
                  labelText: 'Vector Two',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: _run,
                child: const Text('Execute'),
              ),
              const SizedBox(height: 24,),
              running
                  ? const CircularProgressIndicator()
                  : TextField(
                controller: outputController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Output',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
