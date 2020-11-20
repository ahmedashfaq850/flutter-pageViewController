import 'package:flutter/material.dart';


void main(){runApp(MaterialApp(home: homepage(),));}




class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  // Create pagecontroller and assign initial page: 0

  PageController pageController = PageController(initialPage: 0);
  int pagechanged =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageViewController"),
        actions: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            pageController.animateToPage(--pagechanged, duration: Duration(milliseconds:250), curve: Curves.bounceIn); // i am using --pagechanged because its prefix notation its mean first update the value then change the UI 
          }),
          IconButton(icon: Icon(Icons.arrow_forward), onPressed: (){
            pageController.animateToPage(++pagechanged, duration: Duration(milliseconds:250), curve: Curves.bounceIn); //i am using ++pagechanged because its prefix notation its mean first update the value then change the UI
          }),
        ],
      ),
      // Create pageview in body
      body: PageView(
        controller: pageController,         // pass controller from top where i created a object
        onPageChanged: (index){
          pagechanged = index;
        },
        children: [
          Container(color: Colors.blueAccent,),
          Container(color:Colors.orange),
          Container(color:Colors.red),
        ],
      ),
    );
  }
}