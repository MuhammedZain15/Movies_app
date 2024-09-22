import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';
import 'package:movies_app/moduls/home/popular_manager/states.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

class PopularCubit extends Cubit<PopularStates> {
  PopularCubit() : super(LoadingPopularStates());
   List<MoviesModel> _popularMovies = [];

  List<MoviesModel> get popularList => _popularMovies;

  static PopularCubit get(context) => BlocProvider.of(context);

  Future<void> getPopularMovies() async {
    try {
      _popularMovies =await ApiManager.fetchPopularMovies();
      emit(SuccessPopularStates());
    } catch (e) {
      emit(ErrorPopularStates());
    }
  }
}
