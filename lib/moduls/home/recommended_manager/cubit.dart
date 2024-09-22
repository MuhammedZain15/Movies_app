import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';
import 'package:movies_app/moduls/home/recommended_manager/states.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

class RecommendedCubit extends Cubit<RecommendedStates> {
  RecommendedCubit() : super(LoadingRecommendedStates());
  List<MoviesModel> _recommendedList = [];

  List<MoviesModel> get recommendedList => _recommendedList;

  static RecommendedCubit get(context) => BlocProvider.of(context);

  Future<void> getRecommendedList() async {
    try {
      _recommendedList = await ApiManager.fetchRecommendedMovies();
      emit(SuccessRecommendedStates());
    } catch (e) {
      emit(ErrorRecommendedStates());
    }
  }
}
