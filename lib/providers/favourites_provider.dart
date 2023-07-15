import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
  FavMealsNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal) {
    final exists = state.contains(meal);
    if (exists) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favProvider = StateNotifierProvider<FavMealsNotifier, List<Meal>>(
    (ref) => FavMealsNotifier());
