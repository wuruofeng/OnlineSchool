package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.ChapterInfo;
import cn.miaozt.onlineschool.model.CommentInfo;

import java.util.List;

public interface CommentInfoMapper {
    List<CommentInfo> getCommentByChapterId(Long chapterId);
    List<CommentInfo> getCommentByCommentId(Long id);
    List<CommentInfo> getCommentByPostUserId(Long postUserId);
    void deleteCommentByCommentId(Long chapterId);
    void updateCommentByChapterId(CommentInfo commentInfo);
    void insComment(CommentInfo commentInfo);
}
