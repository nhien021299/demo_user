import 'package:demo_user/modules/user/domain/models/address.dart';
import 'package:demo_user/modules/user/domain/models/company.dart';
import 'package:demo_user/modules/user/domain/models/geo.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';

User createUser() {
  return User(
      id: 1,
      name: "Leanne Graham",
      username: "Bret",
      email: "Sincere@april.biz",
      address: createAddress(),
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: createCompany(),
  );
}

Address createAddress() {
  return Address(
    street: "Kulas Light",
    suite: "Apt. 556",
    city: "Gwenborough",
    zipCode: "92998-3874",
    geo: createGeo(),
  );
}

Geo createGeo() {
  return Geo(
      lat: "-37.3159",
      lng: "81.1496"
  );
}

Company createCompany() {
  return Company(
    companyName: "Romaguera-Crona",
    catchPhrase: "Multi-layered client-server neural-net",
    bs: "harness real-time e-markets",
  );
}