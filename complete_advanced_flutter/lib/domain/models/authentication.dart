import 'package:complete_advanced_flutter/domain/models/contact.dart';
import 'package:complete_advanced_flutter/domain/models/customer.dart';

class Authentication {
  Customer? customer;
  Contact? contact;
  Authentication(this.customer, this.contact);
}
