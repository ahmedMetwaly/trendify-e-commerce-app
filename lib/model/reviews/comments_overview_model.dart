import 'precent_overall_fit.dart';

class CommentsOverview {
  String? localSiteNum;
  String? localSiteScore;
  String? onlyCommentNumShow;
  String? isShowMore;
  String? ratingRulesUrl;
  String? rankPercentInfo;
  String? spu;
  String? goodsId;
  int? commentNum;
  String? commentRank;
  String? commentRankAverage;
  PercentOverallFit? percentOverallFit;
  String? hasFit;
  String? commentNumShow;
  String? localSiteNumShow;
  String? selTagScore;

  CommentsOverview(
      {this.localSiteNum,
      this.localSiteScore,
      this.onlyCommentNumShow,
      this.isShowMore,
      this.ratingRulesUrl,
      this.rankPercentInfo,
      this.spu,
      this.goodsId,
      this.commentNum,
      this.commentRank,
      this.commentRankAverage,
      this.percentOverallFit,
      this.hasFit,
      this.commentNumShow,
      this.localSiteNumShow,
      this.selTagScore});

  CommentsOverview.fromJson(Map<String, dynamic> json) {
    localSiteNum = json['localSiteNum'];
    localSiteScore = json['localSiteScore'];
    onlyCommentNumShow = json['onlyCommentNumShow'];
    isShowMore = json['isShowMore'];
    ratingRulesUrl = json['ratingRulesUrl'];
    rankPercentInfo = json['rankPercentInfo'];
    spu = json['spu'];
    goodsId = json['goods_id'];
    commentNum = json['comment_num'];
    commentRank = json['comment_rank'];
    commentRankAverage = json['comment_rank_average'];
    percentOverallFit = json['percent_overall_fit'] != null
        ? PercentOverallFit.fromJson(json['percent_overall_fit'])
        : null;
    hasFit = json['hasFit'];
    commentNumShow = json['commentNumShow'];
    localSiteNumShow = json['localSiteNumShow'];
    selTagScore = json['sel_tag_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['localSiteNum'] = localSiteNum;
    data['localSiteScore'] = localSiteScore;
    data['onlyCommentNumShow'] = onlyCommentNumShow;
    data['isShowMore'] = isShowMore;
    data['ratingRulesUrl'] = ratingRulesUrl;
    data['rankPercentInfo'] = rankPercentInfo;
    data['spu'] = spu;
    data['goods_id'] = goodsId;
    data['comment_num'] = commentNum;
    data['comment_rank'] = commentRank;
    data['comment_rank_average'] = commentRankAverage;
    if (percentOverallFit != null) {
      data['percent_overall_fit'] = percentOverallFit!.toJson();
    }
   
    data['hasFit'] = hasFit;
    data['commentNumShow'] = commentNumShow;
    data['localSiteNumShow'] = localSiteNumShow;
    data['sel_tag_score'] = selTagScore;
    return data;
  }
}
