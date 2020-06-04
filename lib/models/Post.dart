
class Post {
    Post({
        this.graphql,
    });

    Graphql graphql;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        graphql: Graphql.fromJson(json["graphql"]),
    );

    Map<String, dynamic> toJson() => {
        "graphql": graphql.toJson(),
    };
}

class Graphql {
    Graphql({
        this.shortcodeMedia,
    });

    ShortcodeMedia shortcodeMedia;

    factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        shortcodeMedia: ShortcodeMedia.fromJson(json["shortcode_media"]),
    );

    Map<String, dynamic> toJson() => {
        "shortcode_media": shortcodeMedia.toJson(),
    };
}

class ShortcodeMedia {
    ShortcodeMedia({

        this.displayUrl,
        this.videoUrl,
    });

    String displayUrl;
    String videoUrl;
    
    factory ShortcodeMedia.fromJson(Map<String, dynamic> json) => ShortcodeMedia(

        displayUrl: json["display_url"],
        videoUrl: json["video_url"],

    );

    Map<String, dynamic> toJson() => {

        "display_url": displayUrl,
        "video_url": videoUrl,
    };
}
















