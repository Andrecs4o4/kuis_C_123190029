
import 'package:ex_mobile/data_dummy.dart';
import 'package:flutter/material.dart';


import 'login_page.dart';

class DetailPage extends StatelessWidget {
  final DataMovie dataMovie;

  const DetailPage({Key? key, required this.dataMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataMovie.title),

      ),

      body: Container(
        child: _createCard(dataMovie, context),

      ),
    );
  }


  Widget _createCard(DataMovie dataMovie, BuildContext context) {
    return Card(

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
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    '${dataMovie.trailer}',
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    '${dataMovie.popularity}',
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    '${dataMovie.vote_count}',
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }),
                            (route) => false,
                      );
                    },
                    child: Text("Logout"),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                  ),
                ],
              )
          ),

        ]),
      ),

    );

  }
}