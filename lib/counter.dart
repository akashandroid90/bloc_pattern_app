import 'package:bloc_pattern_app/counter_bloc.dart';
import 'package:bloc_pattern_app/counter_event.dart';
import 'package:bloc_pattern_app/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder(
          bloc: BlocProvider.of<CounterBloc>(context),
          builder: (BuildContext context, CounterState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                {BlocProvider.of<CounterBloc>(context).add(IncrementEvent())},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () =>
                {BlocProvider.of<CounterBloc>(context).add(DecrementEvent())},
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
