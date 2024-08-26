// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prize _$PrizeFromJson(Map<String, dynamic> json) => Prize(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      description: json['description'] as String?,
      amount: json['amount'] as int,
      price: json['price'] as int,
      amount_remaining: json['amount_remaining'] as int,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$PrizeToJson(Prize instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'description': instance.description,
      'amount': instance.amount,
      'price': instance.price,
      'amount_remaining': instance.amount_remaining,
      'image': instance.image,
    };
