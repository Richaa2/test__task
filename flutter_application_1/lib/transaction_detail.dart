import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/containers.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:intl/intl.dart';

import 'consts.dart';

class TransactionDetail extends StatelessWidget {
  final Transaction transaction;

  TransactionDetail({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var time = DateFormat.yMd().format(transaction.dateTime) +
        '   ' +
        DateFormat.jms().format(transaction.dateTime);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            Text(
              '${transaction.sum}\$',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 65),
            ),
            Text(
              transaction.name != null ? '${transaction.name}' : '',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '$time',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          transaction.pending == false
                              ? 'Status: Approved'
                              : 'Status: Pending',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      Text(
                        transaction.nameOfUser != null
                            ? '${transaction.nameOfUser}'
                            : 'Payment',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          Text('${transaction.sum}\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17))
                        ],
                      ),
                    ]),
              ),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              width: screenSize.width,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Describe:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      Text('${transaction.describe}')
                    ]),
              ),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(10)),
              width: screenSize.width,
              height: 100,
            )
          ]),
        ),
      ),
    );
  }
}
