import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/controllers/news_controller.dart';
import 'package:project_newsapp/models/article.dart';
//import 'package:project_newsapp/views/home_view.dart';


class ArticlePage extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());
  final Articles article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
        //  mainAxisAlignment: MainAxisAlignment.start,
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null ?
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage.toString()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ) :
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Positioned(
              left: 10,
              top: 50,
              child: CircleAvatar(
               // radius: 20,
                  backgroundColor: Colors.transparent,
                child: GestureDetector(
                    onTap: () => Navigator.pop( context

                    ),
                    child: Icon(Icons.arrow_back,color: Colors.white,size: 42.0,shadows: <Shadow>[Shadow(color: Colors.grey.shade900, blurRadius: 21.0)],),

                ),
                  ),
            ),


            Positioned(
              top: 570,
              left: 0,
              child: Container(


                padding: EdgeInsets.all(6.0),
               // decoration: BoxDecoration(
               //   color: Colors.red,
               //   borderRadius: BorderRadius.circular(30.0),
              //  ),
                child: Positioned(
                  top: 500,
                  left: 20,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                     // sigmaX: 5,
                     // sigmaY: 5,
                    ),
                    child: LimitedBox(
                      maxWidth: 300,

                      child: Text(
                        article.description.toString()
                        ,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'RobotoSlab',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
        Positioned(
        top: 550,
        left: 250,
        child: Text(
          article.publishedAt.toString().substring(0,10),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
        ),
            Positioned(
              top: 350,
              left: 20,
              child: LimitedBox(
                maxWidth: 320,
                child: Text(
                  article.title.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}