import 'package:complete_advanced_flutter/app/extensions.dart';
import 'package:complete_advanced_flutter/app/utils.dart';
import 'package:complete_advanced_flutter/data/responses/responses.dart';
import 'package:complete_advanced_flutter/domain/models/authentication.dart';
import 'package:complete_advanced_flutter/domain/models/contact.dart';
import 'package:complete_advanced_flutter/domain/models/customer.dart';

/**
 * Convert the response into a non nullable object model
 */

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.notifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
      this?.phone?.orEmpty() ?? EMPTY,
      this?.website?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer?.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}
