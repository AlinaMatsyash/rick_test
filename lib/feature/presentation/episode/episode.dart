import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rickandmorty/feature/presentation/episode/widgets/episode_list.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Episodes',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: EpisodeList(),
    );
  }
}

// class EpisodeScreen extends StatefulWidget {
//   @override
//   _EpisodeScreenState createState() => _EpisodeScreenState();
// }
//
// class _EpisodeScreenState extends State<EpisodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           'Episodes',
//           style: Theme.of(context).textTheme.headline6,
//         ),
//       ),
//       body: FutureBuilder(
//         future: pageData(),
//         builder: (BuildContext context, AsyncSnapshot snapshots) {
//           if (snapshots.hasError) {
//             return Text('${snapshots.error}');
//           } else if (snapshots.hasData) {
//             return ListView.builder(
//               itemCount: snapshots.data.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   behavior: HitTestBehavior.translucent,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                           builder: (context) =>
//                               EpisodeDetails(data: snapshots.data[index])),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               snapshots.data[index].name,
//                               style: TextStyle(fontSize: 24),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
