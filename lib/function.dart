import 'package:flutter/material.dart';
import 'package:myform/account.dart';
import 'package:myform/home.dart';
import 'package:myform/setting.dart';
import 'package:myform/transaction.dart';

dynamic validateForm(String value, type) {
  switch (type) {
    case 'Email':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        // r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
      ).hasMatch(value)) {
        return 'Sorry, $type must be email';
      }
    // break;
    case 'Name':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      }
    // abc @ --- . com
    // xyz@yahoo.com
    // xyz.com
    case 'Password':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$',
      ).hasMatch(value)) {
        return 'Sorry $type must have numbers and characters';
      }
    case 'Confirm Password':
      if (value.isEmpty) {
        return 'Sorry, $type is required';
      } else if (value.length <= 5) {
        return 'Sorry, $type must be greater 5 characters';
      } else if (!RegExp(
        r'^(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$',
      ).hasMatch(value)) {
        return 'Sorry $type must have numbers and characters';
      }
    // break;
    default:
      return 'Error';
  }
}

Widget screenWidget(int index) {
  switch (index) {
    case 0:
      return Home();

    case 1:
      return Transaction();

    case 2:
      return Settings();
    case 3:
      return Account();
    default:
      return Text('');
  }
}
