import 'package:counterbloc/bloc/counter_bloc.dart';
import 'package:counterbloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});


  
  @override
  Widget build(BuildContext context) {
final counterBloc = BlocProvider.of<CounterBloc>(context);
 
 
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Hompage"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, counter) {
                    return Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
               FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterIncrement());
                } ,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 5,),
              FloatingActionButton(
                onPressed: () {
                 counterBloc.add(CounterDecrement());
               
                } ,
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
      }
}