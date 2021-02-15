import 'package:personal_grouth/Filters/FilterAbstract.dart';

class ProductFilter extends FilterAbstract {
  final List<int> companiesIdList;

  ProductFilter({
    int id
    , this.companiesIdList
    , DateTime createdAt
    , DateTime updatedAt
  })
    : super(
      id: id
      , createdAt: createdAt
      , updatedAt: updatedAt
    );
}
