import 'package:recipes_app/core/base/model/base_auth_model.dart';

abstract class IUserSubscription {
  void createUser(BaseAuthModel<dynamic> model);
  void deleteUser();
}
