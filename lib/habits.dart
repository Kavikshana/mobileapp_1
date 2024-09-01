    import 'package:flutter/material.dart';
    import 'constants.dart';
    import 'setting.dart';

    class Habits extends StatefulWidget {
      const Habits({super.key});

      @override
      State<StatefulWidget> createState() => _HabitsState();
    }

    class _HabitsState extends State<Habits> {

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Habits'),
          ),
          body:  GridView.count(
            crossAxisCount: 2,
            children: [
              IconButton(
                icon: ClipRRect(borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(walking,
                // height: 40,
                // width: 40,
                // fit: BoxFit.cover,
                ),
                ),
                onPressed: () => _showForm(),
                iconSize: 5.0,
              ),
              IconButton(
                icon: ClipRRect(borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(water,
                  // height: 40,
                  // width: 40,
                  // fit: BoxFit.cover,
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting())).then((_) => null),
                iconSize: 5.0,
              ),
            ],
          ),
        );
      }

      void _showForm() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Customize Your Task'),
              content: Form(
                key: GlobalKey<FormState>(),
                child: Row(
                  children: [
                      TextFormField(
                        key: UniqueKey(),
                        decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                      // TextFormField(
                      //   key: UniqueKey(),
                      //   decoration: InputDecoration(
                      //     labelText: 'Type',
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your name.';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Goal',
                      //   ),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your name.';
                      //     }
                      //     return null;
                      //   },
                      // ),
                       TextFormField(
                         key: UniqueKey(),
                        decoration: InputDecoration(
                          labelText: 'Frequency',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    print('Submitted');
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      }
    }