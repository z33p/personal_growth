import 'package:personal_grouth/Filters/ProductFilter.dart';
import 'package:personal_grouth/Model/Product.dart';
import 'package:personal_grouth/Repositories/RepositoryAbstract.dart';

class ProductsRepository extends RepositoryAbstract<ProductFilter, Product> {
  @override
  Future<List<Product>> findBy({ ProductFilter filter }) async {
    var productsMap = await database.query(Product.tableName);

    var products = Product.fromMapList(productsMap);

    return products;
  }
}
