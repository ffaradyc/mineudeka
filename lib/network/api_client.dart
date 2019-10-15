import 'package:http/http.dart';
import 'package:mineudeka/model/drinks.dart';

class ApiClient {
  static Future<Drinks> getDrinks(String mDrinkName) async {
    String searchParam = "s=" + mDrinkName;
    Response response = await get(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?" +
            searchParam);
    return drinksFromJson(response.body);
  }
}
