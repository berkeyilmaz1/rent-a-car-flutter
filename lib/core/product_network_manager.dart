import 'dart:io';

import 'package:rent_a_car/core/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManager extends NetworkManager<BaseErrorModel> {
  ProductNetworkManager()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: _baseUrl,
            contentType: _contentType,
            validateStatus: (status) {
              return (status ?? 0) < HttpStatus.permanentRedirect;
            },
          ),
        );
  static const String _baseUrl = 'https://localhost:7299/';
  static const String _contentType = 'application/json';
}
