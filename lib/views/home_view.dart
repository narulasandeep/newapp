import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_newsapp/controllers/news_controller.dart';

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
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(() => _newsController.isLoading.value ?
        const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ) : ListView.builder(

          itemCount: _newsController.articles.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              // padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(5, 40, 38, 1),
                  borderRadius: BorderRadius.circular(8)

              ),
              child:
              Card(
                child:


                Stack(

                  alignment: Alignment(1,1 ),
                  children:[


                    Ink.image(image: NetworkImage(
                      _newsController.articles[index].urlToImage!,

                    ),
                      fit: BoxFit.cover,
                      height:250 ,
                      child: InkWell(
                        onTap: (){
                          _newsController.articles[index].description;
                        },
                      ),

                    ),
                    Text(

                      _newsController.articles[index].title!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 24,width: double.infinity,),
                    Text(_newsController.articles[index].publishedAt!,
                      style: TextStyle(
                        color: Colors.white,
                      ),

                    ),


                  ],
                ),

              ),
            );
          },
        ),
        )
    );
  }
}
