import 'package:flutter/material.dart';
//Code written by Pratik Mehkarkar to work on basic concepts of layout in flutter
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  //The root of flutter application
  @override
  Widget build(BuildContext context)
  {
    Widget title = Container(
      padding: const EdgeInsets.all(32),
      color: Colors.black87,
      child: Row(
        children: [
          Icon(Icons.photo_camera,color: Colors.white,),
          Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Instagram',style: TextStyle(
                      fontWeight: FontWeight.w900,color: Colors.white),
                  ),
                ),],),
          ),
          Icon(Icons.near_me,color: Colors.white,)
        ],
      ),
    );
    //Color color = Theme.of(context).accentColor;
    Widget textSelection = Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(32),
      child: Text(
          'Look deep into nature and then you will understand everything better.',
          style: TextStyle(color: Colors.white),
          softWrap: true),
    );

    return MaterialApp(
      title: 'Instagram Clone App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instagram Clone App'),
        ),
        body:
        ListView(
          children: [
            title,
            Image.asset(
              'assets/images/Nature.jpg',
              width: 600,
              height: 300,
              fit: BoxFit.cover,
            ),
            //buttonSection,
            LikeImageWidget(),
            textSelection
          ],
        ),
      ),
    );
  }

}

class LikeImageWidget extends StatefulWidget
{
  @override
  LikeImageWidgetState createState() => LikeImageWidgetState();
}

class LikeImageWidgetState extends State<LikeImageWidget>
{
  bool like = true;
  int noLike = 1;

  @override
  Widget build(BuildContext context)
  {
    Color color = Theme.of(context).accentColor;
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: like ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                    color: Colors.white,
                    onPressed: checkLike
                ),
                Text(
                  '$noLike',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          _buildButtonColumn(color, Icons.comment, 'Comment'),
          _buildButtonColumn(color, Icons.share, 'Share'),
        ],
      ),
    );
  }


  void checkLike()
  {
    setState(()
    {
      if (like)
      {
        noLike -= 1;
        like = false;
      }
      else
      {
        noLike += 1;
        like = true;
      }
    });
  }
}
Column _buildButtonColumn(Color color,IconData icon,String label)
{
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon,color: Colors.white),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}


