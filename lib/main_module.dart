import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:omniprotest/data/api/photo_api.dart';
import 'package:omniprotest/data/datasource/photo_datasource.dart';
import 'package:omniprotest/data/repository/photo_repository_imp.dart';
import 'package:omniprotest/domain/repository/photo_repository.dart';
import 'package:omniprotest/domain/usecase/get_photo_usecase.dart';
import 'package:omniprotest/presentation/home/bloc/home_bloc.dart';
import 'package:omniprotest/presentation/home/home_page.dart';

class MainModule extends Module {
  static const routerMain = '/';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    // HttpClient
    i.addSingleton(() => Client());
    // Datasources
    i.add<PhotoDatasource>(
      () => PhotoApiImpl(i<Client>()),
    );
    // Repositories
    i.add<PhotoRepository>(
      () => PhotoRepositoryImp(datasource: i.get()),
    );
    // UseCases
    i.add<GetPhotoUseCase>(GetPhotoUseCase.new);
    // Blocs
    i.addLazySingleton<HomeBloc>(HomeBloc.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    super.routes(r);
  }
}
