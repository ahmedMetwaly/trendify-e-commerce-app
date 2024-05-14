
import 'package:shop_app/model/reviews/member_size.dart';
import 'package:shop_app/model/reviews/sku_ingo_list.dart';

import 'comments_image.dart';

class ProductComments {
  String? localFlag;
  String? sppRelatedGoodsId;
  String? connetLabelTips;
  String? productInfo;
  String? spu;
  String? addTime;
  String? commentId;
  List<CommentImage>? commentImage;
  String? commentRank;
  String? content;
  String? faceSmallImg;
  String? userName;
  String? size;
  String? color;
  String? goodsId;
  String? goodsStdAttr;
  String? languageFlag;
  String? isTranslate;
  List<MemberSize>? memberSize;
  String? likeNum;
  String? unlikeNum;
  String? currentMemberZan;
  List<SkuInfoList>? skuInfoList;
  String? showSkuSale;
  List? contentTag;
  String? selectTag;
  String? memberId;

  ProductComments({
    this.localFlag,
    this.sppRelatedGoodsId,
    this.connetLabelTips,
    this.productInfo,
    this.spu,
    this.addTime,
    this.commentId,
    this.commentImage,
    this.commentRank,
    this.content,
    this.faceSmallImg,
    this.memberId,
    this.memberSize,
    this.userName,
    this.size,
    this.color,
    this.goodsId,
    this.goodsStdAttr,
    this.languageFlag,
    this.isTranslate,
    this.likeNum,
    this.unlikeNum,
    this.currentMemberZan,
    this.skuInfoList,
    this.showSkuSale,
    this.contentTag,
    this.selectTag,
  });

  ProductComments.fromJson(Map<String, dynamic> json) {
    localFlag = json['localFlag'];
    sppRelatedGoodsId = json['sppRelatedGoodsId'];
    connetLabelTips = json['connetLabelTips'];
    productInfo = json['productInfo'];
    spu = json['spu'];
    addTime = json['add_time'];
    commentId = json['comment_id'];
    if (json['comment_image'] != null) {
      commentImage = <CommentImage>[];
      json['comment_image'].forEach((v) {
        commentImage!.add(CommentImage.fromJson(v));
      });
    }
    commentRank = json['comment_rank'];
    content = json['content'];
    faceSmallImg = json['face_small_img'];
    memberId = json['member_id'];

    userName = json['user_name'];
    size = json['size'];
    color = json['color'];
    goodsId = json['goods_id'];
    goodsStdAttr = json['goods_std_attr'];
    languageFlag = json['language_flag'];
    isTranslate = json['is_translate'];

    if (json['member_size_'] != null) {
      memberSize = <MemberSize>[];
      json['member_size_'].forEach((v) {
        memberSize!.add(MemberSize.fromJson(v));
      });
    }
    likeNum = json['like_num'];
    unlikeNum = json['unlike_num'];
    currentMemberZan = json['current_member_zan'];
    if (json['sku_info_list'] != null) {
      skuInfoList = <SkuInfoList>[];
      json['sku_info_list'].forEach((v) {
        skuInfoList!.add(SkuInfoList.fromJson(v));
      });
    }
    showSkuSale = json['show_sku_sale'];
    contentTag = json['contentTag'];
    selectTag = json['selectTag'];
    memberId = json['memberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['localFlag'] = localFlag;
    data['sppRelatedGoodsId'] = sppRelatedGoodsId;
    data['connetLabelTips'] = connetLabelTips;
    data['productInfo'] = productInfo;
    data['spu'] = spu;
    data['add_time'] = addTime;
    data['comment_id'] = commentId;
    if (commentImage != null) {
      data['comment_image'] = commentImage!.map((v) => v.toJson()).toList();
    }
    data['comment_rank'] = commentRank;
    data['content'] = content;
    data['face_small_img'] = faceSmallImg;
    data['member_id'] = memberId;

    data['user_name'] = userName;
    data['size'] = size;
    data['color'] = color;
    data['goods_id'] = goodsId;
    data['goods_std_attr'] = goodsStdAttr;
    data['language_flag'] = languageFlag;
    data['is_translate'] = isTranslate;

    if (memberSize != null) {
      data['member_size_'] = memberSize!.map((v) => v.toJson()).toList();
    }
    data['like_num'] = likeNum;
    data['unlike_num'] = unlikeNum;
    data['current_member_zan'] = currentMemberZan;
    if (skuInfoList != null) {
      data['sku_info_list'] = skuInfoList!.map((v) => v.toJson()).toList();
    }
    data['show_sku_sale'] = showSkuSale;
    data['contentTag'] = contentTag;
    data['selectTag'] = selectTag;
    data['memberId'] = memberId;
    return data;
  }
}
