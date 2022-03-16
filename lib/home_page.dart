import 'package:ex_mobile/data_dummy.dart';
import 'package:ex_mobile/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  var dataProduct = getDataMovie;

  HomePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pusat Film Bajakan21"),
      ),
      body: Container(
        child: _listView(),
      ),
    );
  }

  Widget _gridView(){
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => FlutterLogo(),
      itemCount: 12,
    );
  }

  Widget _listView() {
    return ListView.separated(
          itemBuilder: (context, index) {
            return _createCard(getDataMovie[index], context);
          },
          itemCount: getDataMovie.length,
          separatorBuilder: (BuildContext context, int index) {
            return _separator();
          },
        );
  }

  Widget _createCard(DataMovie dataMovie, BuildContext context){
    return Card(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailPage(dataMovie: dataMovie);
            }));
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Image.network(dataMovie.poster_path, width: 100,),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      dataMovie.title,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataMovie.overview,
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      dataMovie.release_date,
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    Text(
                      '${dataMovie.vote_average}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      '${dataMovie.popularity}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      '${dataMovie.vote_count}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    Text(
                      '${dataMovie.trailer}',
                      style: TextStyle(fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return DetailPage(dataMovie: dataMovie);
                      }));
                    }, child: Text("View >>")),
                  ],
                )
              ),

            ]),
          ),
        ),
    );
  }

  Widget _separator() {
    return Container(
      color: Colors.white,
      child: Text(
        'Separator',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}
