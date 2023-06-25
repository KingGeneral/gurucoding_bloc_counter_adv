import 'dart:ffi';

import 'package:bloc_test/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('============ Method build di jalankan ============');

    final counterState =
        BlocProvider.of<CounterBloc>(context, listen: true).state;

    Widget body = const SizedBox(height: 10.0);

    if (counterState.status == Status.loading) {
      body = const Center(child: CircularProgressIndicator());
    }

    if (counterState.status == Status.error) {
      body = Center(
        child: Text("${counterState.error}"),
      );
    }

    if (counterState.status == Status.loaded ||
        counterState.status == Status.initial) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counterState}',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              // '$_counter',
              '${counterState.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: body,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // DONE: bloc increment
          FloatingActionButton(
            // onPressed: _incrementCounter,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context, listen: false)
                  .add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10.0,
          ),
          // DONE: bloc decrement
          FloatingActionButton(
            // onPressed: _decrementCounter,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context, listen: false)
                  .add(CounterDecrementEvent());
            },
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
