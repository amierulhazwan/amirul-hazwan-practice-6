import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'text_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TextCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String word = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                BlocBuilder<TextCubit, String>(
                    bloc: context.read<TextCubit>(),
                    builder: (context, state) {
                      return Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter word: ',
                              fillColor: Colors.grey[100],
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  print(state);
                                  context.read<TextCubit>().capatalise(state);
                                },
                                icon: const Icon(Icons.check_circle_rounded),
                              ),
                            ),
                            onChanged: (String? value) {
                              state = value!;
                            },
                          ),
                        ],
                      );
                    }),
                BlocBuilder(
                    bloc: context.read<TextCubit>(),
                    builder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.yellowAccent,
                        ),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('$state')],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
