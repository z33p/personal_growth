import 'package:personal_grouth/Filters/CompanyFilter.dart';
import 'package:personal_grouth/Model/Company.dart';
import 'package:personal_grouth/Repositories/RepositoryAbstract.dart';

class CompanyRepository extends RepositoryAbstract<CompanyFilter, Company> {
  @override
  Future<List<Company>> findBy({ CompanyFilter filter }) async {
    var companiesMap = await database.query(Company.tableName);

    var companies = Company.fromMapList(companiesMap);

    return companies;
  }
}
