import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
      children: <Widget>[
        Text(
          'No transactions added yet!',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            )),
      ],
    )
        : ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text('₹${transactions[index].amount}', style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                  ),),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(transactions[index].date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.lightGreen,
              onPressed: () => deleteTx(transactions[index].id),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}