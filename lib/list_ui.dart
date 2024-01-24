import 'package:bmipackage/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProvider extends StatelessWidget {
  //@override
  //_ListProviderState createState() => _ListProviderState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new _ListProviderState(),
    );

    throw UnimplementedError();
  }
}

class _ListProviderState extends StatelessWidget/*<ListProvider>*/ {
  // List<String> titles = ['Sun', 'Moon', 'Star','Sun', 'Moon', 'Star'];
  // List<String> titles2 = [];

  // void Select(BuildContext context) {
  //   Provider.of<SelectProvider>(context, listen: false).Select(context);
  // }
  //
  // void unSelect(BuildContext context) {
  //   Provider.of<SelectProvider>(context, listen: false);
  // }

  @override
  Widget build(BuildContext context) {
    //var right = Provider.of<SelectProvider>(context);
    // var left = Provide
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),

      /*body: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width / 2,

        child:
      ListView.builder(
          shrinkWrap: false,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int index){
                        return GestureDetector(
                          child: ListTile(
                              leading: Icon(Icons.list),
                              title:Text("List item $index"),
                            //trailing: Text("GFG",
                            //style: TextStyle(
                                //color: Colors.green,fontSize: 8),),
                          ),
                          onTap: () {
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text(index.toString())));
                            //.remove(index);
                          }
                        );
                      }
                  ),

      ),*/

      //========
      body: Consumer<SelectProvider>(
        builder: (BuildContext context, provider, Widget child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            //width: MediaQuery.of(context).size.width / 2,
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: provider.titles.length,
                  itemBuilder: (context, index) {
                    final item = provider.titles[index];
                    return Card(
                      color: Colors.white10,
                      child: ListTile(
                        title: Text(item),
                        onTap: () {
                          //    w/o Provider                  <-- onTap
                          // setState(() {
                          //   titles.insert(index, 'Planet');
                          // });

                          //   w/ Provider
                          // Select(context);
                        },
                        onLongPress: () {
                          //                            <-- onLongPress
                          //setState(() {
                          //int index2=0;
                          //titles2.insert(index,'added');
                          // print(titles.elementAt(index));
                          // titles2.insert(index2,titles.elementAt(index));
                          // print(titles2);
                          // titles.removeAt(index);
                          //});

                          provider.Select(provider.titles[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: provider.titles2.length,
                  itemBuilder: (context, index) {
                    final item = provider.titles2[index];
                    return Card(
                      color: Colors.white10,
                      child: ListTile(
                        title: Text(item),
                        onTap: () {
                          //                                  <-- onTap
                          //setState(() {
                          //titles.insert(index, 'Planet');
                          // });
                        },
                        onLongPress: () {
                          //                            <-- onLongPress
                          //setState(() {
                          //   titles.insert(index,titles2.elementAt(index));
                          //   titles2.removeAt(index);
                          //});
                          provider.unSelect(provider.titles2[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      //=========
    );
  }
}
