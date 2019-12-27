package cn.miaozt.onlineschool.model;

import cn.miaozt.onlineschool.enums.CourseIsFree;
import cn.miaozt.onlineschool.enums.CourseIsOver;

import java.io.Serializable;

public class CourseInfo implements Serializable {

  private long id;
  private long authorId;
  private String bigType;
  private String imageUrl;
  private String description;
  private String title;
  private CourseIsFree isFree;
  private java.sql.Timestamp createdAt;
  private CourseIsOver isOver;
  private String seriesUrl;
  private String totalChapters;
  private String exp;
  private String descriptionFull;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getAuthorId() {
    return authorId;
  }

  public void setAuthorId(long authorId) {
    this.authorId = authorId;
  }


  public String getBigType() {
    return bigType;
  }

  public void setBigType(String bigType) {
    this.bigType = bigType;
  }


  public String getImageUrl() {
    return imageUrl;
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public CourseIsFree getIsFree() {
    return isFree;
  }

  public void setIsFree(CourseIsFree isFree) {
    this.isFree = isFree;
  }


  public java.sql.Timestamp getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(java.sql.Timestamp createdAt) {
    this.createdAt = createdAt;
  }


  public CourseIsOver getIsOver() {
    return isOver;
  }

  public void setIsOver(CourseIsOver isOver) {
    this.isOver = isOver;
  }


  public String getSeriesUrl() {
    return seriesUrl;
  }

  public void setSeriesUrl(String seriesUrl) {
    this.seriesUrl = seriesUrl;
  }


  public String getTotalChapters() {
    return totalChapters;
  }

  public void setTotalChapters(String totalChapters) {
    this.totalChapters = totalChapters;
  }


  public String getExp() {
    return exp;
  }

  public void setExp(String exp) {
    this.exp = exp;
  }


  public String getDescriptionFull() {
    return descriptionFull;
  }

  public void setDescriptionFull(String descriptionFull) {
    this.descriptionFull = descriptionFull;
  }

  public CourseInfo(long id, long authorId, String bigType, String imageUrl, String description, String title, CourseIsFree isFree, java.sql.Timestamp createdAt, CourseIsOver isOver, String seriesUrl, String totalChapters, String exp, String descriptionFull) {
    super();
    this.id = id;
    this.authorId = authorId;
    this.bigType = bigType;
    this.imageUrl = imageUrl;
    this.description = description;
    this.title = title;
    this.isFree = isFree;
    this.createdAt = createdAt;
    this.isOver = isOver;
    this.seriesUrl = seriesUrl;
    this.totalChapters = totalChapters;
    this.exp = exp;
    this.descriptionFull = descriptionFull;
  }

  public CourseInfo() {
    super();
  }

  @Override
  public String toString() {
    return "CourseInfo{" +
            "id=" + id +
            ", authorId=" + authorId +
            ", bigType='" + bigType + '\'' +
            ", imageUrl='" + imageUrl + '\'' +
            ", description='" + description + '\'' +
            ", title='" + title + '\'' +
            ", isFree='" + isFree + '\'' +
            ", createdAt='" + createdAt + '\'' +
            ", isOver='" + isOver + '\'' +
            ", seriesUrl='" + seriesUrl + '\'' +
            ", totalChapters='" + totalChapters + '\'' +
            ", exp='" + exp + '\'' +
            ", descriptionFull='" + descriptionFull + '\'' +
            '}';
  }
}
