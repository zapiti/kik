import 'package:kik/model/field_facility.dart';
import 'package:kik/model/field_order.dart';
import 'package:kik/model/cleaner_category.dart';
import 'package:kik/model/cleaner_field.dart';
import 'package:kik/model/user.dart';

import 'image_utils.dart';

var sampleUser = User(
    id: "user01",
    name: "Nathan",
    email: "Nathan@mail.com",
    accountType: "teste",
    imageProfile: ImageUtils.defaultImage);

var _diary = CleanerCategory(
  name: "Diarista",
  image: ImageUtils.changingRoom,
);
var _washAndIron = CleanerCategory(
  name: "Lavar e passar",
  image: ImageUtils.changingRoom,
);

var _complete = CleanerCategory(
  name: "Diarista - Lavar e passar",
  image: ImageUtils.changingRoom,
);

List<CleanerCategory> cleanerCategories = [_diary, _washAndIron, _complete];

CleanerField data1 = CleanerField(
  id: '01',
  name: 'Rafaela',
  address: 'Rua Jendral Sudirman, nº 31, São Paulo, SP',
  category: _washAndIron,
  phoneNumber: '0812 2345 6789',
  openDay: 'Segunda a Domingo',
  openTime: '08.00',
  closeTime: '16.00',
  imageAsset: ImageUtils.defaultImage,
  price: 80000,
);

CleanerField data2 = CleanerField(
  id: '02',
  name: 'Centro de limpeza LDTA',
  address: 'Rua Tanah Agung, nº 12, Rio de Janeiro, RJ',
  category: _diary,
  phoneNumber: '0812 3333 4444',
  openDay: 'Todos os dias',
  openTime: '07.00',
  closeTime: '22.00',
  imageAsset: ImageUtils.defaultImage,
  price: 100000,
);

CleanerField data3 = CleanerField(
  id: '05',
  name: 'Nathan',
  address: 'Rua Kalimegah, nº 55, Belo Horizonte, MG',
  category: _diary,
  phoneNumber: '0888 9999 1111',
  openDay: 'Todos os dias',
  openTime: '06.00',
  closeTime: '18.00',
  imageAsset: ImageUtils.defaultImage,
  price: 75000,
);

CleanerField data4 = CleanerField(
  id: '06',
  name: 'Pedro alves',
  address: 'Rua Mekarsari, nº 17, Salvador, BA',
  category: _diary,
  phoneNumber: '0855 6666 7777',
  openDay: 'Todos os dias',
  openTime: '09.00',
  closeTime: '18.00',
  imageAsset: ImageUtils.defaultImage,
  price: 85000,
);

CleanerField data5 = CleanerField(
  id: '09',
  name: 'Juana DARK',
  address: 'Rua Sinagara, nº 53, Brasília, DF',
  category: _washAndIron,
  phoneNumber: '0844 5555 6666',
  openDay: 'Todos os dias',
  openTime: '08.00',
  closeTime: '18.00',
  imageAsset: ImageUtils.defaultImage,
  price: 70000,
);

List<CleanerField> cleanerFieldList = [
  data1,
  data2,
  data3,
  data4,
  data5,
];

List<CleanerField> recommendedCleanerField = [data2, data1];

List<FieldOrder> dummyUserOrderList = [];

List<String> timeToBook = [
  "06.00",
  "07.00",
  "08.00",
  "09.00",
  "10.00",
  "11.00",
  "12.00",
  "13.00",
  "14.00",
  "15.00",
  "16.00",
  "17.00",
  "18.00",
  "19.00",
  "20.00",
  "21.00",
  "22.00",
  "23.00"
];
