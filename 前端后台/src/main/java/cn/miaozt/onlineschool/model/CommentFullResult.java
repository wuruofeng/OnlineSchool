package cn.miaozt.onlineschool.model;

import java.util.List;

public class CommentFullResult {
    private ChapterInfo chapterInfo;
    private List<CommentInfo> commentInfos;

    public ChapterInfo getChapterInfo() {
        return chapterInfo;
    }

    public List<CommentInfo> getCommentInfos() {
        return commentInfos;
    }

    public CommentFullResult(ChapterInfo chapterInfo, List<CommentInfo> commentInfos) {
        super();
        this.chapterInfo = chapterInfo;
        this.commentInfos = commentInfos;
    }

    @Override
    public String toString() {
        return "CommentFullResult{" +
                "chapterInfo=" + chapterInfo +
                ", commentInfos=" + commentInfos +
                '}';
    }
}
