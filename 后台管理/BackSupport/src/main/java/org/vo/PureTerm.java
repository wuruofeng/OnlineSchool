package org.vo;

public class PureTerm {
    private int id;
    private String title;
    private String duration;
    private String videoUrl;
    private String termDesc;
    private Integer idx;
    private Integer exp;
    private Integer updatedAtDay;
    private String updatedAtYearMonth;
    private String coverUrl;
    private Integer courseId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getTermDesc() {
        return termDesc;
    }

    public void setTermDesc(String termDesc) {
        this.termDesc = termDesc;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getUpdatedAtDay() {
        return updatedAtDay;
    }

    public void setUpdatedAtDay(Integer updatedAtDay) {
        this.updatedAtDay = updatedAtDay;
    }

    public String getUpdatedAtYearMonth() {
        return updatedAtYearMonth;
    }

    public void setUpdatedAtYearMonth(String updatedAtYearMonth) {
        this.updatedAtYearMonth = updatedAtYearMonth;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}
