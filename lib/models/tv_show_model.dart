class TvShowModel {
  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final List<String>? genres;
  final Rating? rating;
  final Image? image;
  final String? summary;
  final String? status;
  final String? ended;
  final String? premiered;

  TvShowModel({
    this.id,
    this.url,
    this.name,
    this.type,
    this.genres,
    this.status,
    this.rating,
    this.image,
    this.summary,
    this.ended,
    this.premiered,
  });

  TvShowModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        url = json['url'] as String?,
        name = json['name'] as String?,
        type = json['type'] as String?,
        genres = (json['genres'] as List?)?.map((dynamic e) => e as String).toList(),
        status = json['status'] as String?,
        ended = json['ended'] as String?,
        premiered = json['premiered'] as String?,
        rating = (json['rating'] as Map<String, dynamic>?) != null
            ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
            : null,
        image = (json['image'] as Map<String, dynamic>?) != null
            ? Image.fromJson(json['image'] as Map<String, dynamic>)
            : null,
        summary = json['summary'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'name': name,
        'type': type,
        'genres': genres,
        'status': status,
        'rating': rating?.toJson(),
        'image': image?.toJson(),
        'summary': summary,
        'ended': ended,
        'premiered': premiered,
      };
}

class Rating {
  final double? average;

  Rating({
    this.average,
  });

  Rating.fromJson(Map<String, dynamic> json) : average = json['average'] as double?;

  Map<String, dynamic> toJson() => {'average': average};
}

class Image {
  final String? medium;
  final String? original;

  Image({
    this.medium,
    this.original,
  });

  Image.fromJson(Map<String, dynamic> json)
      : medium = json['medium'] as String?,
        original = json['original'] as String?;

  Map<String, dynamic> toJson() => {'medium': medium, 'original': original};
}
