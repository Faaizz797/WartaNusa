import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/presentation/detail_page/detail_page.dart';

class ItemNewsWidget extends StatelessWidget {
  const ItemNewsWidget({super.key, required this.news});

  final Data news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailPage(news: news,),
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3.0,
              offset: Offset(-4.0, 5.0)
            )
          ],
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          )
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
              ),
              child: Image.network(
                news.image!.large!,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                news.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            )
          ],
        ),
      ),
    );
  }
}