import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/controllers/news_controller.dart';
import 'package:project_newsapp/models/article.dart';
import 'package:project_newsapp/views/articles_details_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsController _newsController = Get.put(NewsController());
    return Scaffold(
        backgroundColor: const Color(0xFF464646),
        appBar: AppBar(
          backgroundColor: const Color(0xFF000000),
          title: const Text(
            " HEADLINES",
            style: TextStyle(
                fontSize: 29,
                letterSpacing: 2.0,
                color: Color(0xFF464646),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => _newsController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                )
              : ListView.builder(
                  itemCount: _newsController.articles.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                      decoration: BoxDecoration(
                          // color: const Color(0xFF464646),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Card(
                        
                        margin: EdgeInsets.zero,
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        shadowColor: Colors.black87,
                        elevation: 300.0,

                        child: Stack(

                         alignment: Alignment.bottomCenter,
                          children: [

                            Ink.image(
                              image: NetworkImage(
                                _newsController.articles[index].urlToImage!,
                              ),
                              fit: BoxFit.cover,
                              height: 250,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArticlePage(
                                              article: _newsController
                                                  .articles[index])));
                                  //_newsController.articles[index].description;
                                },
                              ),
                            ),
                            SafeArea(
                              child: Column(
                                children: [
                                  Positioned(
                                    top: 1000,
                                    left: 600,
                                    right: 1000,
                                    child:
                                  Text(
                                    _newsController.articles[index].title!,
                                   // textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 18,
                                      fontFamily: 'RobotoSlab',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  ),
                                 SizedBox(
                                   height: 10,
                                 ),

                                  Positioned(
                                    top:5000,
                                    left: 4000,
                                    child:
                                  Text(
                                    
                                    _newsController
                                        .articles[index].publishedAt!,
                                  //  textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),

                                  ),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
