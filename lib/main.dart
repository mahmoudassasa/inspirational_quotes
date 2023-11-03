import 'package:flutter/material.dart';
import 'package:inspirational_quotes/widgets/quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InspirationalQuotes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InspirationalQuotes extends StatefulWidget {
  const InspirationalQuotes({super.key});

  @override
  State<InspirationalQuotes> createState() => _InspirationalQuotesState();
}

class InspQuotes {
  String title;
  String author;
  InspQuotes({required this.title, required this.author});
}

class _InspirationalQuotesState extends State<InspirationalQuotes> {
  List myQuotes = [
    InspQuotes(title: "“ Enter Your Quote 1 „", author: "Admin"),
    InspQuotes(
        title: "“ There are no shortcuts to any place worth going. „",
        author: "Beverly Sills"),
  ];

  addNewQuote() {
    setState(() {
      myQuotes.add(
          InspQuotes(title: myController.text, author: authorController.text));
    });
  }

  final authorController = TextEditingController();
  final myController = TextEditingController();

  removeQuote(int remove) {
    setState(() {
      myQuotes.remove(myQuotes[remove]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                // backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  // color: const Color.fromRGBO(58, 66, 86, 0.7),
                  padding: const EdgeInsets.all(20),
                  // height: double.infinity,
                  height: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 50,
                        decoration: const InputDecoration(
                            labelText: "Write Your Quote"),
                      ),
                      TextField(
                        controller: authorController,
                        maxLength: 50,
                        decoration: const InputDecoration(
                            labelText: "Write Author Name"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            addNewQuote();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          )),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 30),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(209, 224, 224, 0.2),
        elevation: 0.0,
        title: const Text("Inspirational Quotes",
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: 600,
            child: ListView.builder(
                itemCount: myQuotes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Quotes(
                    index: index,
                    addNewQ: addNewQuote,
                    authorName: myQuotes[index].author,
                    varTitle: myQuotes[index].title, 
                    delTask: removeQuote,

                  );
                })),
      ),
    );
  }
}
