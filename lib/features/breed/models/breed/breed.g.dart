// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Breed _$$_BreedFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Breed',
      json,
      ($checkedConvert) {
        final val = _$_Breed(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          imageUrl: $checkedConvert('image_url', (v) => v as String),
          weight: $checkedConvert('weight', (v) => v as String?),
          height: $checkedConvert('height', (v) => v as String?),
          bredFor: $checkedConvert('bred_for', (v) => v as String?),
          breedGroup: $checkedConvert('breed_group', (v) => v as String?),
          lifeSpan: $checkedConvert('life_span', (v) => v as String?),
          temperament: $checkedConvert('temperament', (v) => v as String?),
          origin: $checkedConvert('origin', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'imageUrl': 'image_url',
        'bredFor': 'bred_for',
        'breedGroup': 'breed_group',
        'lifeSpan': 'life_span'
      },
    );

Map<String, dynamic> _$$_BreedToJson(_$_Breed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'weight': instance.weight,
      'height': instance.height,
      'bred_for': instance.bredFor,
      'breed_group': instance.breedGroup,
      'life_span': instance.lifeSpan,
      'temperament': instance.temperament,
      'origin': instance.origin,
    };
