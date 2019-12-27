package cn.miaozt.onlineschool.model;


import cn.miaozt.onlineschool.enums.CourseIsFree;

import java.io.Serializable;
import java.sql.Timestamp;

public class ChapterInfo implements Serializable {

  private long id;
  private long courseId;
  private String title;
  private String videoUrl;
  private String imageUrl;
  private String description;
  private String descriptionFull;
  private String documentUrl;
  private java.sql.Timestamp createdAt;
  private String episodeDuration;
  private String chapterIndex;
  private String exp;
  private CourseIsFree isFree;

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getVideoUrl() {
    return videoUrl;
  }

  public void setVideoUrl(String videoUrl) {
    this.videoUrl = videoUrl;
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

  public String getDescriptionFull() {
    return descriptionFull;
  }

  public void setDescriptionFull(String descriptionFull) {
    this.descriptionFull = descriptionFull;
  }

  public String getDocumentUrl() {
    return documentUrl;
  }

  public void setDocumentUrl(String documentUrl) {
    this.documentUrl = documentUrl;
  }

  public Timestamp getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Timestamp createdAt) {
    this.createdAt = createdAt;
  }

  public String getEpisodeDuration() {
    return episodeDuration;
  }

  public void setEpisodeDuration(String episodeDuration) {
    this.episodeDuration = episodeDuration;
  }

  public String getChapterIndex() {
    return chapterIndex;
  }

  public void setChapterIndex(String chapterIndex) {
    this.chapterIndex = chapterIndex;
  }

  public String getExp() {
    return exp;
  }

  public void setExp(String exp) {
    this.exp = exp;
  }

  public CourseIsFree getIsFree() {
    return isFree;
  }

  public void setIsFree(CourseIsFree isFree) {
    this.isFree = isFree;
  }

  public ChapterInfo(long id, long courseId, String title, String videoUrl, String imageUrl, String description, String descriptionFull, String documentUrl,
                     Timestamp createdAt, String episodeDuration, String chapterIndex, String exp, CourseIsFree isFree) {
    this.id = id;
    this.courseId = courseId;
    this.title = title;
    this.videoUrl = videoUrl;
    this.imageUrl = imageUrl;
    this.description = description;
    this.descriptionFull = descriptionFull;
    this.documentUrl = documentUrl;
    this.createdAt = createdAt;
    this.episodeDuration = episodeDuration;
    this.chapterIndex = chapterIndex;
    this.exp = exp;
    this.isFree = isFree;
  }

  @Override
  public String toString() {
    return "ChapterInfo{" +
            "id=" + id +
            ", courseId=" + courseId +
            ", title='" + title + '\'' +
            ", videoUrl='" + videoUrl + '\'' +
            ", imageUrl='" + imageUrl + '\'' +
            ", description='" + description + '\'' +
            ", descriptionFull='" + descriptionFull + '\'' +
            ", documentUrl='" + documentUrl + '\'' +
            ", createdAt=" + createdAt +
            ", episodeDuration='" + episodeDuration + '\'' +
            ", chapterIndex='" + chapterIndex + '\'' +
            ", exp='" + exp + '\'' +
            ", isFree=" + isFree +
            '}';
  }
}
