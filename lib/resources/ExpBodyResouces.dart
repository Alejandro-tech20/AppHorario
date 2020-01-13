import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ExpenseGraph.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ExpBodyResources extends StatefulWidget {
  @override
  _ExpBodyResourcesState createState() => _ExpBodyResourcesState();
}

class _ExpBodyResourcesState extends State<ExpBodyResources> {
  PageController _controller;
  int currentPage = DateTime.now().month - 1;

  @override
  void initState() {
    super.initState();

    // Firestore.instance
    //     .collection('expenses')
    //     .where("month", isEqualTo: currentPage)
    //     .snapshots()
    //     .listen(
    //       (data) => data.documents.forEach(
    //         (doc) => print(
    //           doc["value"],
    //         ),
    //       ),
    //     );
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: AssetImage('assets/img/fondo1.jpg'),
          //     ),
          //   ),
          // ),
          Column(
            children: <Widget>[
              _selector(),
              Card(
                borderOnForeground: true,
                color: Color.fromRGBO(7, 7, 7, .65),
                elevation: 8,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: _expenses(),
                ),
              ),
              Card(
                borderOnForeground: true,
                color: Color.fromRGBO(7, 7, 7, .65),
                elevation: 8,
                margin: EdgeInsets.symmetric(
                  vertical: 0.0,
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    child: _graph()),
              ),
              SizedBox(
                height: 8,
              ),
              _list(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.green.withOpacity(0.6),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(7, 7, 7, .75),
        borderRadius: BorderRadius.circular(20),
      ),
      // height: 5000.0,
      // width: 100,

      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Align(
        alignment: _alignment,
        child: Text(
          name,
          style: position == currentPage ? selected : unselected,
        ),
      ),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
      size: Size.fromHeight(50.0),
      child: PageView(
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
        controller: _controller,
        children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Agosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
        ],
      ),
    );
  }

  Widget _expenses() {
    return Column(
      children: <Widget>[
        Text(
          "\$2361,41",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Colors.white,
          ),
        ),
        Text(
          "Total expenses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _graph() {
    return Container(
      height: 140.0,
      child: GraphWidget(),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) =>
            _item(FontAwesomeIcons.shoppingCart, "Shopping", 14, 145.12),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: .05,
            thickness: .1,
          );
        },
      ),
    );
  }

  Widget _item(IconData icon, String name, int percent, double value) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: Card(
        borderOnForeground: true,
        color: Color.fromRGBO(7, 7, 7, .65),
        elevation: 4,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(
            right: 18,
            left: 18,
          ),
          leading: Icon(
            icon,
            size: 22.0,
            color: Colors.white.withOpacity(.5),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white.withOpacity(.7),
            ),
          ),
          subtitle: Text(
            "$percent% of expenses",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue.withOpacity(.7),
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$$value",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
