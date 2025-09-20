import 'package:sqflite/sqflite.dart';
import '../../../../core/db/cart_database.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/repository/cart_repository.dart';
import '../mapper/cart_mapper.dart';
import '../model/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDatabase dbHelper = CartDatabase.instance;

  @override
  Future<void> addToCart(CartEntity item) async {
    final db = await dbHelper.database;
    final model = CartMapper.toModel(item);

    await db.insert(
      'cart',
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<CartEntity>> getCartItems() async {
    final db = await dbHelper.database;
    final result = await db.query('cart');

    return result
        .map((e) => CartMapper.toEntity(CartModel.fromJson(e)))
        .toList();
  }

  @override
  Future<void> updateQuantity(int id, int quantity) async {
    final db = await dbHelper.database;
    await db.update(
      'cart',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> removeItem(int id) async {
    final db = await dbHelper.database;
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
