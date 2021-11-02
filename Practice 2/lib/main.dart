import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider(
        create: (context) => InputCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 200),
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                BlocBuilder<InputCubit, String>(
                    bloc: context.read<InputCubit>(),
                    builder: (context, state) {
                      return Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'User Input : ',
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  print(state);
                                  context.read<InputCubit>().capatalise(state);
                                },
                                icon: const Icon(Icons.send_outlined),
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
                    bloc: context.read<InputCubit>(),
                    builder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          // color: Colors.blue,
                        ),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('USER INPUT : $state')],
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
