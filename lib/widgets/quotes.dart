import 'package:flutter/material.dart';

class Quotes extends StatelessWidget {
  const Quotes({
    super.key,
    required this.varTitle,
    required this.index,
    required this.addNewQ,
    required this.authorName,
    required this.delTask,
  });
  final String varTitle;
  final int index;
  final Function addNewQ;
  final String authorName;
  final Function delTask;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color.fromRGBO(209, 224, 224, 0.2),
            ),
            child: Column(
              children: [
                Text(
                  varTitle,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      authorName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        delTask(index);
                      },
                      icon: const Icon(Icons.delete_rounded),
                      color: Colors.red,
                      iconSize: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  
}
