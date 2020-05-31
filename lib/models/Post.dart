
class Post {
    Graphql graphql;

    Post({
        this.graphql,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        graphql: Graphql.fromJson(json["graphql"]),
    );

    Map<String, dynamic> toJson() => {
        "graphql": graphql.toJson(),
    };
}

class Graphql {
    ShortcodeMedia shortcodeMedia;

    Graphql({
        this.shortcodeMedia,
    });

    factory Graphql.fromJson(Map<String, dynamic> json) => Graphql(
        shortcodeMedia: ShortcodeMedia.fromJson(json["shortcode_media"]),
    );

    Map<String, dynamic> toJson() => {
        "shortcode_media": shortcodeMedia.toJson(),
    };
}

class ShortcodeMedia {
    String typename;
    String id;
    String shortcode;
    Dimensions dimensions;
    dynamic gatingInfo;
    dynamic factCheckOverallRating;
    dynamic factCheckInformation;
    dynamic sensitivityFrictionInfo;
    dynamic mediaOverlayInfo;
    String mediaPreview;
    String displayUrl;
    List<DisplayResource> displayResources;
    String accessibilityCaption;
    bool isVideo;
    String trackingToken;
    EdgeMediaToCaptionClass edgeMediaToTaggedUser;
    EdgeMediaToCaptionClass edgeMediaToCaption;
    bool captionIsEdited;
    bool hasRankedComments;
    EdgeMediaToParentCommentClass edgeMediaToParentComment;
    EdgeMediaToCaptionClass edgeMediaToHoistedComment;
    EdgeMediaPreview edgeMediaPreviewComment;
    bool commentsDisabled;
    bool commentingDisabledForViewer;
    int takenAtTimestamp;
    EdgeMediaPreview edgeMediaPreviewLike;
    EdgeMediaToCaptionClass edgeMediaToSponsorUser;
    dynamic location;
    bool viewerHasLiked;
    bool viewerHasSaved;
    bool viewerHasSavedToCollection;
    bool viewerInPhotoOfYou;
    bool viewerCanReshare;
    ShortcodeMediaOwner owner;
    bool isAd;
    EdgeMediaToCaptionClass edgeWebMediaToRelatedMedia;

    ShortcodeMedia({
        this.typename,
        this.id,
        this.shortcode,
        this.dimensions,
        this.gatingInfo,
        this.factCheckOverallRating,
        this.factCheckInformation,
        this.sensitivityFrictionInfo,
        this.mediaOverlayInfo,
        this.mediaPreview,
        this.displayUrl,
        this.displayResources,
        this.accessibilityCaption,
        this.isVideo,
        this.trackingToken,
        this.edgeMediaToTaggedUser,
        this.edgeMediaToCaption,
        this.captionIsEdited,
        this.hasRankedComments,
        this.edgeMediaToParentComment,
        this.edgeMediaToHoistedComment,
        this.edgeMediaPreviewComment,
        this.commentsDisabled,
        this.commentingDisabledForViewer,
        this.takenAtTimestamp,
        this.edgeMediaPreviewLike,
        this.edgeMediaToSponsorUser,
        this.location,
        this.viewerHasLiked,
        this.viewerHasSaved,
        this.viewerHasSavedToCollection,
        this.viewerInPhotoOfYou,
        this.viewerCanReshare,
        this.owner,
        this.isAd,
        this.edgeWebMediaToRelatedMedia,
    });

    factory ShortcodeMedia.fromJson(Map<String, dynamic> json) => ShortcodeMedia(
        typename: json["__typename"],
        id: json["id"],
        shortcode: json["shortcode"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        gatingInfo: json["gating_info"],
        factCheckOverallRating: json["fact_check_overall_rating"],
        factCheckInformation: json["fact_check_information"],
        sensitivityFrictionInfo: json["sensitivity_friction_info"],
        mediaOverlayInfo: json["media_overlay_info"],
        mediaPreview: json["media_preview"],
        displayUrl: json["display_url"],
        displayResources: List<DisplayResource>.from(json["display_resources"].map((x) => DisplayResource.fromJson(x))),
        accessibilityCaption: json["accessibility_caption"],
        isVideo: json["is_video"],
        trackingToken: json["tracking_token"],
        edgeMediaToTaggedUser: EdgeMediaToCaptionClass.fromJson(json["edge_media_to_tagged_user"]),
        edgeMediaToCaption: EdgeMediaToCaptionClass.fromJson(json["edge_media_to_caption"]),
        captionIsEdited: json["caption_is_edited"],
        hasRankedComments: json["has_ranked_comments"],
        edgeMediaToParentComment: EdgeMediaToParentCommentClass.fromJson(json["edge_media_to_parent_comment"]),
        edgeMediaToHoistedComment: EdgeMediaToCaptionClass.fromJson(json["edge_media_to_hoisted_comment"]),
        edgeMediaPreviewComment: EdgeMediaPreview.fromJson(json["edge_media_preview_comment"]),
        commentsDisabled: json["comments_disabled"],
        commentingDisabledForViewer: json["commenting_disabled_for_viewer"],
        takenAtTimestamp: json["taken_at_timestamp"],
        edgeMediaPreviewLike: EdgeMediaPreview.fromJson(json["edge_media_preview_like"]),
        edgeMediaToSponsorUser: EdgeMediaToCaptionClass.fromJson(json["edge_media_to_sponsor_user"]),
        location: json["location"],
        viewerHasLiked: json["viewer_has_liked"],
        viewerHasSaved: json["viewer_has_saved"],
        viewerHasSavedToCollection: json["viewer_has_saved_to_collection"],
        viewerInPhotoOfYou: json["viewer_in_photo_of_you"],
        viewerCanReshare: json["viewer_can_reshare"],
        owner: ShortcodeMediaOwner.fromJson(json["owner"]),
        isAd: json["is_ad"],
        edgeWebMediaToRelatedMedia: EdgeMediaToCaptionClass.fromJson(json["edge_web_media_to_related_media"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "shortcode": shortcode,
        "dimensions": dimensions.toJson(),
        "gating_info": gatingInfo,
        "fact_check_overall_rating": factCheckOverallRating,
        "fact_check_information": factCheckInformation,
        "sensitivity_friction_info": sensitivityFrictionInfo,
        "media_overlay_info": mediaOverlayInfo,
        "media_preview": mediaPreview,
        "display_url": displayUrl,
        "display_resources": List<dynamic>.from(displayResources.map((x) => x.toJson())),
        "accessibility_caption": accessibilityCaption,
        "is_video": isVideo,
        "tracking_token": trackingToken,
        "edge_media_to_tagged_user": edgeMediaToTaggedUser.toJson(),
        "edge_media_to_caption": edgeMediaToCaption.toJson(),
        "caption_is_edited": captionIsEdited,
        "has_ranked_comments": hasRankedComments,
        "edge_media_to_parent_comment": edgeMediaToParentComment.toJson(),
        "edge_media_to_hoisted_comment": edgeMediaToHoistedComment.toJson(),
        "edge_media_preview_comment": edgeMediaPreviewComment.toJson(),
        "comments_disabled": commentsDisabled,
        "commenting_disabled_for_viewer": commentingDisabledForViewer,
        "taken_at_timestamp": takenAtTimestamp,
        "edge_media_preview_like": edgeMediaPreviewLike.toJson(),
        "edge_media_to_sponsor_user": edgeMediaToSponsorUser.toJson(),
        "location": location,
        "viewer_has_liked": viewerHasLiked,
        "viewer_has_saved": viewerHasSaved,
        "viewer_has_saved_to_collection": viewerHasSavedToCollection,
        "viewer_in_photo_of_you": viewerInPhotoOfYou,
        "viewer_can_reshare": viewerCanReshare,
        "owner": owner.toJson(),
        "is_ad": isAd,
        "edge_web_media_to_related_media": edgeWebMediaToRelatedMedia.toJson(),
    };
}

class Dimensions {
    int height;
    int width;

    Dimensions({
        this.height,
        this.width,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
    };
}

class DisplayResource {
    String src;
    int configWidth;
    int configHeight;

    DisplayResource({
        this.src,
        this.configWidth,
        this.configHeight,
    });

    factory DisplayResource.fromJson(Map<String, dynamic> json) => DisplayResource(
        src: json["src"],
        configWidth: json["config_width"],
        configHeight: json["config_height"],
    );

    Map<String, dynamic> toJson() => {
        "src": src,
        "config_width": configWidth,
        "config_height": configHeight,
    };
}

class EdgeMediaPreview {
    int count;
    List<EdgeMediaPreviewCommentEdge> edges;

    EdgeMediaPreview({
        this.count,
        this.edges,
    });

    factory EdgeMediaPreview.fromJson(Map<String, dynamic> json) => EdgeMediaPreview(
        count: json["count"],
        edges: List<EdgeMediaPreviewCommentEdge>.from(json["edges"].map((x) => EdgeMediaPreviewCommentEdge.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
    };
}

class EdgeMediaToParentCommentClass {
    int count;
    PageInfo pageInfo;
    List<EdgeMediaPreviewCommentEdge> edges;

    EdgeMediaToParentCommentClass({
        this.count,
        this.pageInfo,
        this.edges,
    });

    factory EdgeMediaToParentCommentClass.fromJson(Map<String, dynamic> json) => EdgeMediaToParentCommentClass(
        count: json["count"],
        pageInfo: PageInfo.fromJson(json["page_info"]),
        edges: List<EdgeMediaPreviewCommentEdge>.from(json["edges"].map((x) => EdgeMediaPreviewCommentEdge.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "page_info": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
    };
}

class PurpleNode {
    String id;
    String text;
    int createdAt;
    bool didReportAsSpam;
    NodeOwner owner;
    bool viewerHasLiked;
    EdgeOwnerToTimelineMediaClass edgeLikedBy;
    bool isRestrictedPending;
    EdgeMediaToParentCommentClass edgeThreadedComments;

    PurpleNode({
        this.id,
        this.text,
        this.createdAt,
        this.didReportAsSpam,
        this.owner,
        this.viewerHasLiked,
        this.edgeLikedBy,
        this.isRestrictedPending,
        this.edgeThreadedComments,
    });

    factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        id: json["id"],
        text: json["text"],
        createdAt: json["created_at"],
        didReportAsSpam: json["did_report_as_spam"],
        owner: NodeOwner.fromJson(json["owner"]),
        viewerHasLiked: json["viewer_has_liked"],
        edgeLikedBy: EdgeOwnerToTimelineMediaClass.fromJson(json["edge_liked_by"]),
        isRestrictedPending: json["is_restricted_pending"],
        edgeThreadedComments: json["edge_threaded_comments"] == null ? null : EdgeMediaToParentCommentClass.fromJson(json["edge_threaded_comments"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "created_at": createdAt,
        "did_report_as_spam": didReportAsSpam,
        "owner": owner.toJson(),
        "viewer_has_liked": viewerHasLiked,
        "edge_liked_by": edgeLikedBy.toJson(),
        "is_restricted_pending": isRestrictedPending,
        "edge_threaded_comments": edgeThreadedComments == null ? null : edgeThreadedComments.toJson(),
    };
}

class EdgeMediaPreviewCommentEdge {
    PurpleNode node;

    EdgeMediaPreviewCommentEdge({
        this.node,
    });

    factory EdgeMediaPreviewCommentEdge.fromJson(Map<String, dynamic> json) => EdgeMediaPreviewCommentEdge(
        node: PurpleNode.fromJson(json["node"]),
    );

    Map<String, dynamic> toJson() => {
        "node": node.toJson(),
    };
}

class PageInfo {
    bool hasNextPage;
    String endCursor;

    PageInfo({
        this.hasNextPage,
        this.endCursor,
    });

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["has_next_page"],
        endCursor: json["end_cursor"] == null ? null : json["end_cursor"],
    );

    Map<String, dynamic> toJson() => {
        "has_next_page": hasNextPage,
        "end_cursor": endCursor == null ? null : endCursor,
    };
}

class EdgeOwnerToTimelineMediaClass {
    int count;

    EdgeOwnerToTimelineMediaClass({
        this.count,
    });

    factory EdgeOwnerToTimelineMediaClass.fromJson(Map<String, dynamic> json) => EdgeOwnerToTimelineMediaClass(
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
    };
}

class NodeOwner {
    String id;
    bool isVerified;
    String profilePicUrl;
    String username;

    NodeOwner({
        this.id,
        this.isVerified,
        this.profilePicUrl,
        this.username,
    });

    factory NodeOwner.fromJson(Map<String, dynamic> json) => NodeOwner(
        id: json["id"],
        isVerified: json["is_verified"],
        profilePicUrl: json["profile_pic_url"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_verified": isVerified,
        "profile_pic_url": profilePicUrl,
        "username": username,
    };
}

class EdgeMediaToCaptionClass {
    List<EdgeMediaToCaptionEdge> edges;

    EdgeMediaToCaptionClass({
        this.edges,
    });

    factory EdgeMediaToCaptionClass.fromJson(Map<String, dynamic> json) => EdgeMediaToCaptionClass(
        edges: List<EdgeMediaToCaptionEdge>.from(json["edges"].map((x) => EdgeMediaToCaptionEdge.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
    };
}

class EdgeMediaToCaptionEdge {
    FluffyNode node;

    EdgeMediaToCaptionEdge({
        this.node,
    });

    factory EdgeMediaToCaptionEdge.fromJson(Map<String, dynamic> json) => EdgeMediaToCaptionEdge(
        node: FluffyNode.fromJson(json["node"]),
    );

    Map<String, dynamic> toJson() => {
        "node": node.toJson(),
    };
}

class FluffyNode {
    String text;

    FluffyNode({
        this.text,
    });

    factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
    };
}

class ShortcodeMediaOwner {
    String id;
    bool isVerified;
    String profilePicUrl;
    String username;
    bool blockedByViewer;
    dynamic restrictedByViewer;
    bool followedByViewer;
    String fullName;
    bool hasBlockedViewer;
    bool isPrivate;
    bool isUnpublished;
    bool requestedByViewer;
    EdgeOwnerToTimelineMediaClass edgeOwnerToTimelineMedia;

    ShortcodeMediaOwner({
        this.id,
        this.isVerified,
        this.profilePicUrl,
        this.username,
        this.blockedByViewer,
        this.restrictedByViewer,
        this.followedByViewer,
        this.fullName,
        this.hasBlockedViewer,
        this.isPrivate,
        this.isUnpublished,
        this.requestedByViewer,
        this.edgeOwnerToTimelineMedia,
    });

    factory ShortcodeMediaOwner.fromJson(Map<String, dynamic> json) => ShortcodeMediaOwner(
        id: json["id"],
        isVerified: json["is_verified"],
        profilePicUrl: json["profile_pic_url"],
        username: json["username"],
        blockedByViewer: json["blocked_by_viewer"],
        restrictedByViewer: json["restricted_by_viewer"],
        followedByViewer: json["followed_by_viewer"],
        fullName: json["full_name"],
        hasBlockedViewer: json["has_blocked_viewer"],
        isPrivate: json["is_private"],
        isUnpublished: json["is_unpublished"],
        requestedByViewer: json["requested_by_viewer"],
        edgeOwnerToTimelineMedia: EdgeOwnerToTimelineMediaClass.fromJson(json["edge_owner_to_timeline_media"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_verified": isVerified,
        "profile_pic_url": profilePicUrl,
        "username": username,
        "blocked_by_viewer": blockedByViewer,
        "restricted_by_viewer": restrictedByViewer,
        "followed_by_viewer": followedByViewer,
        "full_name": fullName,
        "has_blocked_viewer": hasBlockedViewer,
        "is_private": isPrivate,
        "is_unpublished": isUnpublished,
        "requested_by_viewer": requestedByViewer,
        "edge_owner_to_timeline_media": edgeOwnerToTimelineMedia.toJson(),
    };
}
