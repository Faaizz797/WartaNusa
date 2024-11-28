import 'package:flutter/material.dart';
import 'package:news_app/model/response_news.dart';
import 'package:news_app/network/net_client.dart';
import 'package:news_app/presentation/home_page/widget/item_news_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<String> endPoint = ["cnn-news/olahraga", "cnbc-news/tech"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: FutureBuilder(
        future: NetClient().fetchNews(news: endPoint[currentIndex]), 
        builder: (BuildContext context, AsyncSnapshot<ResponseNews> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            final news = snapshot.data!.data!;
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ItemNewsWidget(news: news[index]);
              }
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.black,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events,
              size: 30,
            ),
            label: "Sport"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.developer_board,
              size: 30,
            ),
            label: "Tech"
          ),
        ],
      ),
    );
  }
}