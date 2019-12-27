package cn.miaozt.onlineschool.model;

import java.util.Date;

public class CommentInfo {
    private long id;
    private long postUserId;
    private String content;
    private long chapterId;
    private String type;
    private Date postTime;
    private long parentId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getPostUserId() {
        return postUserId;
    }

    public void setPostUserId(long postUserId) {
        this.postUserId = postUserId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getChapterId() {
        return chapterId;
    }

    public void setChapterId(long chapterId) {
        this.chapterId = chapterId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getPostTime() {
        return postTime;
    }

    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }

    public long getParentId() {
        return parentId;
    }

    public void setParentId(long parentId) {
        this.parentId = parentId;
    }

    public CommentInfo(long id, long postUserId, String content, long chapterId, String type, Date postTime, long parentId) {
        super();
        this.id = id;
        this.postUserId = postUserId;
        this.content = content;
        this.chapterId = chapterId;
        this.type = type;
        this.postTime = postTime;
        this.parentId = parentId;
    }

    public CommentInfo(){}

    @Override
    public String toString() {
        return "CommentInfo{" +
                "id=" + id +
                ", postUserId=" + postUserId +
                ", content='" + content + '\'' +
                ", chapterId=" + chapterId +
                ", type='" + type + '\'' +
                ", postTime=" + postTime +
                ", parentId=" + parentId +
                '}';
    }
}
