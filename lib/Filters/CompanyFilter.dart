import 'package:personal_grouth/Filters/FilterAbstract.dart';

class CompanyFilter extends FilterAbstract {
  final List<int> companiesIdList;

  CompanyFilter({
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
