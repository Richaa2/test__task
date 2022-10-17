import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts.dart';

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Latest Transactions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(15)),
          width: screenSize.width - 15,
          height: 550,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              indent: 15,
              height: 1,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                isThreeLine: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment'),
                    Text('\$100'),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text('sub'), Text('sub 2')],
                    ),
                    Text('3%'),
                  ],
                ),
                trailing: Icon(Icons.chevron_right_rounded),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black87,
                  ),
                  child: Icon(
                    Icons.apple,
                    color: white,
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
