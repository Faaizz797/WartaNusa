import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.news});

  final Data news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "WARTA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                )
              ),
              TextSpan(
                text: "Nusa",
                style: TextStyle(
                  backgroundColor: Colors.blueAccent,
                  color: Colors.white,
                  fontSize: 20,
                )
              ),
            ]
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InteractiveViewer(
            child: Center(
              child: Hero(
                tag: "Image", 
                child: Image.network(news.image!.large!)
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
            // TITLE
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                news.title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            // DATE
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Date : ${news.isoDate.toString().substring(0, 10)}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            // CONTENT
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                news.contentSnippet!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}