import 'package:recipes_app/core/init/network/i_network_manager.dart';
import 'package:recipes_app/core/init/storage/i_storage_manager.dart';

abstract class BaseService {
  BaseService(this.networkManager, this.storageManager);

  final INetworkManager networkManager;

  final IStorageManager storageManager;

  final duration = const Duration(seconds: 1);
}
