// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<NewsDb> {
  @override
  final int typeId = 2;

  @override
  NewsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsDb(
      title: fields[0] as String?,
      articleId: fields[1] as String?,
      imageUrl: fields[2] as String?,
      link: fields[3] as String?,
      description: fields[4] as String?,
      pubDate: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NewsDb obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.articleId)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.link)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.pubDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
