import 'package:flutter/material.dart';
import './quotes.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const QuotesApp());
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  String text = "";
  String author = "";

  setQuote() {
    int randomNumber = Random().nextInt(quotes.length);
    setState(() {
      text = quotes[randomNumber]["text"]!;
      author = quotes[randomNumber]["author"]!;
    });
  }

  @override
  initState() {
    setQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  author,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lobster(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              TextButton(
                onPressed: setQuote,
                child: Image.asset(
                  'assets/next.png',
                  width: 75,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
