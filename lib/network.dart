import 'package:api_test/fatch_data.dart';

class NetworkHolder{
  final int? id;
  final String? name;
  final String? location;
  final String? code;
  final int? waiter;
  final int? active;
  final int? outside;
  final double? created;
  final double? updated;

  NetworkHolder(
      {this.id,
      this.name,
      this.location,
      this.code,
      this.waiter,
      this.active,
      this.outside,
      this.created,
      this.updated}
      );



}