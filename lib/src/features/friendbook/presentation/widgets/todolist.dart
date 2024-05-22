import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 330,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 247, 188, 38),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.databaseRepository
                        .getAllProfiles()[0]
                        .dataList
                        .length,
                    itemBuilder: (context, index) {
                      final String? title = widget.databaseRepository
                          .getAllProfiles()[0]
                          .dataList[index]["title"];
                      return CheckboxListTile(
                        value: widget.databaseRepository
                            .getAllProfiles()[0]
                            .dataList[index]["isChecked"],
                        onChanged: (value) {
                          setState(() {
                            widget.databaseRepository
                                .getAllProfiles()[0]
                                .dataList[index]["isChecked"] = value!;
                          });
                        },
                        title: title != null
                            ? Text(
                                title,
                                style: const TextStyle(color: Colors.black87),
                              )
                            : null,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Container(
                width: 150,
                height: 50,
                color: const Color.fromARGB(255, 247, 188, 38),
                child: Image.asset(
                  'assets/checklist.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
