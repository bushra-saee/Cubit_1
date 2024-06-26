import 'package:cubit_test/view_model/cubit/text_cubit.dart';
import 'package:cubit_test/view_model/cubit/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text List App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: TextCubit.get(context).inputController,
                        decoration: const InputDecoration(
                          labelText: 'Enter text',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        TextCubit.get(context).addInput();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<TextCubit, TextState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.inputs[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              TextCubit.get(context).removeInput(index);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.inputs.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
