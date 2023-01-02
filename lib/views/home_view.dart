import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/controllers/news_controller.dart';
import 'package:project_newsapp/views/articles_details_page.dart';

class HomeView extends StatelessWidget {
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
                fontFamily: 'RobotoSlab',
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
              : ListView.builder (
                  itemCount: _newsController.articles.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var title =   _newsController.articles[index].title!;
                     var newTitle= title.substring(0,title.lastIndexOf('-'));
                     var source =title.substring((title.lastIndexOf('-')+2),title.length);
                     var img = _newsController.articles[index].urlToImage!;

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
                                 // 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/330px-Image_created_with_a_mobile_phone.png'
                                img,
                              ),
                              fit: BoxFit.cover,
                              height: 250,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArticlePage(
                                          article:
                                              _newsController.articles[index]),
                                    ),
                                  );
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        newTitle,
                   //                   _newsController.articles[index].title!,
                                        // textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 18,
                                          fontFamily: 'RobotoSlab',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(

                                      children: [

                                        Positioned(
                                            top:5000,
                                            left: 3800,
                                            child: Text(source,style: const TextStyle(
                                                color: Colors.white,
                                              fontFamily: 'RobotoSlab',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),),),
                                    const SizedBox(
                                      width: 10,
                                    ),

                                    Text(
                                      _newsController
                                          .articles[index].publishedAt!
                                          .substring(0, 10),
                                      //  textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                            //    Text(_newsController.articles[0].sourceName.toString()),
                                    //    Text(_newsController.articles['source']['name'].toString()),
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
