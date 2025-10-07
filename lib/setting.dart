import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myform/sqflite_service.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    final prods = ref.watch(fetchedProdProvider);
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          Text('Welcome to settings', style: TextStyle(color: Colors.white)),
          SizedBox(height: 50),
          prods.when(
            data: (data) {
              return Table(
                children: [
                  TableRow(
                    children: [
                      Text('S/n'),
                      Text('Cust Name'),
                      Text('Prod Price'),
                      Text('Prod ID'),
                    ],
                  ),
                  ...data!.map(
                    (e) => TableRow(
                      children: [
                        Text(data.indexOf(e).toString()),
                        Text(e.customerName),
                        Text(e.productPrice.toString()),
                        Text(e.productID),
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (erro, st) => Text('Error Occurred'),
            loading: () => Text('Loading...'),
          ),
        ],
      ),
    );
  }
}
