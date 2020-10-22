import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path/path.dart'; //used to join paths
import 'package:concessionaria_paiv/models/Car.dart'; //import model class
import 'dart:async';

class DatabaseHelper {
  Future<Database> init() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'cars.db');

    Database database = await openDatabase(
      //open the database or create a database if there isn't any
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE IF NOT EXISTS Cars(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            inStock INTEGER,
            name TEXT,
            model TEXT,
            price REAL,
            year INTEGER,
            brand TEXT,
            km INTEGER,
            isNew INTEGER,
            isAuto INTEGER,
            color TEXT
          )
        """);
      },
    );

    return database;
  }

  Future<void> addItem(Car item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    db.rawInsert(
      """
      INSERT INTO Cars (inStock, name, model, price, year, brand, km, isNew, isAuto, color)
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,
      [
        item.inStock,
        item.name,
        item.model,
        item.price,
        item.year,
        item.brand,
        item.km,
        item.isNew,
        item.isAuto,
        item.color,
      ],
    );
  }

  Future<List<Car>> getCarsInStock() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 1', //true
    ); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return Car(
        id: maps[i]['id'],
        inStock: maps[i]['inStock'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        price: maps[i]['price'],
        year: maps[i]['year'],
        brand: maps[i]['brand'],
        km: maps[i]['km'],
        isNew: maps[i]['isNew'],
        isAuto: maps[i]['isAuto'],
        color: maps[i]['color'],
        // image: maps[i]['image'],
      );
    });
  }

  Future<List<Car>> getSoldCars() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 0', //false
    ); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return Car(
        id: maps[i]['id'],
        inStock: maps[i]['inStock'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        price: maps[i]['price'],
        year: maps[i]['year'],
        brand: maps[i]['brand'],
        km: maps[i]['km'],
        isNew: maps[i]['isNew'],
        isAuto: maps[i]['isAuto'],
        color: maps[i]['color'],
        // image: maps[i]['image'],
      );
    });
  }

  Future<Car> getLastSold() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 0', //false
      limit: 1,
      orderBy: 'id DESC',
    ); //query all the rows in a table as an array of maps

    if (maps.length == 0) return Car(
      id: null,
      // image: "https://www.cstatic-images.com/stock/400x500/123919.jpg&height=369&autotrim=1"
    );

    return Car(
      id: maps[0]['id'],
      inStock: maps[0]['inStock'],
      name: maps[0]['name'],
      model: maps[0]['model'],
      price: maps[0]['price'],
      year: maps[0]['year'],
      brand: maps[0]['brand'],
      km: maps[0]['km'],
      isNew: maps[0]['isNew'],
      isAuto: maps[0]['isAuto'],
      color: maps[0]['color'],
      // image: maps[0]['image'],
    );
  }

  Future<List<Car>> getLastAdded() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 1', //false
      limit: 6,
      orderBy: 'id DESC',
    ); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return Car(
        id: maps[i]['id'],
        inStock: maps[i]['inStock'],
        name: maps[i]['name'],
        model: maps[i]['model'],
        price: maps[i]['price'],
        year: maps[i]['year'],
        brand: maps[i]['brand'],
        km: maps[i]['km'],
        isNew: maps[i]['isNew'],
        isAuto: maps[i]['isAuto'],
        color: maps[i]['color'],
        // image: maps[i]['image'],
      );
    });
  }

  Future<void> dropTable() async {
    final db = await init();

    db.execute("DROP TABLE Cars");
  }
}
