import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/presentation/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'You have pushed the button this many times:',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<CounterCubit, CounterInitial>(
              listener: (context, state) {
                if (state.isIncremented!) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(milliseconds: 200),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(milliseconds: 200),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.myCounter}',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incrementCounter();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                color: Colors.greenAccent,
                child: const Text(
                  'Go to Third Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (mContext) => BlocProvider.value(
                            value: BlocProvider.of<CounterCubit>(context),
                            child: const ThirdScreen(title: 'Third Screen'),
                          )));
                })
          ],
        ),
      ),
    );
  }
}
