import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
void main() => runApp(StatsApp());

class StatsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Baiosen"),backgroundColor: Colors.indigo,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () => { }),
            IconButton(icon: Icon(Icons.account_circle), onPressed: () => { }),
          ]),
        drawer: MenuLateral(),
        body: SimplePieChart([
          new charts.Series<LinearSales, int>(
            id: 'Sales',
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: [
              new LinearSales(0, 100),
              new LinearSales(1, 75),
              new LinearSales(2, 25),
              new LinearSales(3, 5),
            ],
          )
        ]),
      ),
    );
  }
}

// Pie Chart
class SimplePieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimplePieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory SimplePieChart.withSampleData() {
    return new SimplePieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}


// Menu lateral con las opc de usuario
class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Juan Perez"),
            accountEmail: Text("juanperez@baiosen.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://www.w3schools.com/howto/img_avatar.png"),
                    fit: BoxFit.fitWidth
                )
            ),
          ),
          Ink(
            child: new ListTile(
              title: Text("Inicio"),
              onTap: (){},
            ),
          ),
          new ListTile(
            title: Text("Datos Personales"),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Resultados"),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Estadísticas"),
            onTap: (){},
          ),
          new ListTile(
            title: Text("Configuración"),
            onTap: (){},
          )

        ],
      ) ,
    );
  }
}