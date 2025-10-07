import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myform/product.model.dart';
import 'package:myform/sqflite_service.dart';

class Transaction extends ConsumerStatefulWidget {
  const Transaction({super.key});

  @override
  ConsumerState<Transaction> createState() => _TransactionState();
}

class _TransactionState extends ConsumerState<Transaction> {
  @override
  Widget build(BuildContext context) {
    TextEditingController customername = TextEditingController();
    TextEditingController productPrice = TextEditingController();
    TextEditingController productID = TextEditingController();
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          Text(
            'Welcome to transactions',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: customername,
            decoration: InputDecoration(hint: Text('Customer Name')),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: productPrice,
            decoration: InputDecoration(hint: Text('Product Price')),
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: productID,
            decoration: InputDecoration(hint: Text('Product ID')),
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () async {
              final prodModel = ProductModel.fromJson({
                'customerName': customername.text,
                'productPrice': productPrice.text,
                'productID': productID.text,
              });
              await LocalDB.insertDoc(prod: prodModel);
              ref.invalidate(fetchedProdProvider);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black),
            ),
            child: const Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
