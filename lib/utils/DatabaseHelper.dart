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
            isLastSold INTEGER,
            listID INTEGER,
            name TEXT,
            model TEXT,
            price REAL,
            year INTEGER,
            brand TEXT,
            km INTEGER,
            isNew INTEGER,
            isAuto INTEGER,
            color INTEGER,
            image TEXT
          )
        """);
      },
    );

    return database;
  }

  Future<void> addItem(Car item) async {
    final db = await init(); //open database

    item.listID = (await getCarsInStock()).length;


    db.rawInsert(
      """
      INSERT INTO Cars (listID, inStock, name, model, price, year, brand, km, isNew, isAuto, color, image, isLastSold)
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,
      [
        item.listID,
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
        item.image,
        item.isLastSold,
      ],
    );
  }

  Future<List<Car>> getCarsInStock() async {
    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 1', //true
      orderBy: 'listID',
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
        image: maps[i]['image'],
        isLastSold: maps[i]['isLastSold'],
        listID: maps[i]['listID'],
      );
    });
  }

  Future<List<Car>> getSoldCars() async {
    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 0', //false
      orderBy: 'listID'
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
        image: maps[i]['image'],
        isLastSold: maps[i]['isLastSold'],
        listID: maps[i]['listID'],
      );
    });
  }

  Future<Car> getLastSold() async {
    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'isLastSold = 1', //true
      limit: 1,
      orderBy: 'id DESC',
    ); //query all the rows in a table as an array of maps

    if (maps.length == 0)
      return Car(
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
      image: maps[0]['image'],
      isLastSold: maps[0]['isLastSold'],
      listID: maps[0]['listID'],
    );
  }

  Future<List<Car>> getLastAdded() async {
    final db = await init();
    final maps = await db.query(
      "Cars",
      where: 'inStock = 1', //true
      limit: 6,
      orderBy: 'id DESC',
    ); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
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
        image: maps[i]['image'],
        isLastSold: maps[i]['isLastSold'],
        listID: maps[i]['listID'],
      );
    });
  }

  Future<void> changeStockStatus(int id, int current) async {
    int newStatus = current == 1 ? 0 : 1;
    List<Car> cars = [];
    int listID;
    final db = await init();

    if(current == 1) {
      //car is in stock -> going to sold
      cars = await getSoldCars();

      listID = cars.length;
    } else {
      //going to stock
      cars = await getCarsInStock();

      listID = cars.length;
    }


    await db.rawUpdate(
      """
        UPDATE Cars SET inStock = ?, listID = ?
          WHERE id = ?
    """,
      [newStatus, listID, id],
    );
  }

  Future<void> updateLastSold(int id) async {
    final db = await init();

    await db.rawUpdate("""
        UPDATE Cars SET isLastSold = 0
          WHERE isLastSold = 1
    """);

    await db.rawUpdate("""
        UPDATE Cars SET isLastSold = 1
          WHERE id = ?
    """, [id]);

    
  }

  Future<void> goBackLastSold() async{
    final db = await init();
    List<Car> cars = [];

    cars = await getSoldCars();

    if(cars.length == 1) {
      // is the last car in sold
      await db.rawUpdate("""
          UPDATE Cars SET isLastSold = 0
          WHERE isLastSold = 1
      """);
    } else {
      await updateLastSold(cars[cars.length -1].id);
    }

  }
}
