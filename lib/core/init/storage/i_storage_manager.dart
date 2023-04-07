import 'package:recipes_app/core/base/model/base_storage_model.dart';
import 'package:recipes_app/core/init/user_subscription/i_user_subscription.dart';

abstract class IStorageManager implements IUserSubscription {
  Future<void> initialize();

  Future<void> write<T extends BaseStorageModel<T>>({required T parseModel});
  Future<T?> read<T extends BaseStorageModel<T>>({required T parseModel});
  Future<List<T>> readAll<T extends BaseStorageModel<T>>({
    required T parseModel,
  });
  Future<void> delete<T extends BaseStorageModel<T>>({
    required T parseModel,
  });
}
