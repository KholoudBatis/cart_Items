import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_end/models/cart.dart';
import 'package:provider_end/models/item.dart';
import 'package:provider_end/screans/chackout.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Item> items =[
    Item(title : 'laptop',price:500.0),
    Item(title : 'iphone x',price:400.0),
    Item(title : 'keyboard',price:40.0),

  ];
  @override
  Widget build(BuildContext context) {

    return Consumer<Cart>(
      builder:(context,cart,child){
      return Scaffold(
        appBar: AppBar(

          title: Text('shopping cart',style:TextStyle(fontSize:30.0,color:Colors.black,fontWeight: FontWeight.bold,)),
          backgroundColor: Colors.pinkAccent[700],
          actions:<Widget>[
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Row(
                children:<Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart,
                        color:Colors.white),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> CheckoutPage(),
                      ));
                    },
                  ),
                  Text(cart.count.toString()),
                ],

              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount:items.length,
          itemBuilder:(context,index){
            return ListTile(
              title:Text(items[index].title,
                style:TextStyle(
                  fontSize:25.0,),),
              subtitle: Text(items[index].price.toString()),

              trailing: Icon(Icons.add),
              onTap:(){
                cart.add(items[index]);
              },
            );
          },
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    );
  }
}
