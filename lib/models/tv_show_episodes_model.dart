class TvShowEpisodesModel {
  final int? id;
  final String? url;
  final String? name;
  final int? season;
  final int? number;
  final String? type;
  final String? airdate;
  final String? airtime;
  final String? airstamp;
  final int? runtime;
  final Rating? rating;
  final Image? image;
  final String? summary;

  TvShowEpisodesModel({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
  });

  TvShowEpisodesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        url = json['url'] as String?,
        name = json['name'] as String?,
        season = json['season'] as int?,
        number = json['number'] as int?,
        type = json['type'] as String?,
        airdate = json['airdate'] as String?,
        airtime = json['airtime'] as String?,
        airstamp = json['airstamp'] as String?,
        runtime = json['runtime'] as int?,
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
        'season': season,
        'number': number,
        'type': type,
        'airdate': airdate,
        'airtime': airtime,
        'airstamp': airstamp,
        'runtime': runtime,
        'rating': rating?.toJson(),
        'image': image?.toJson(),
        'summary': summary
      };
}

class Rating {
  final dynamic average;

  Rating({
    this.average,
  });

  Rating.fromJson(Map<String, dynamic> json) : average = json['average'];

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
