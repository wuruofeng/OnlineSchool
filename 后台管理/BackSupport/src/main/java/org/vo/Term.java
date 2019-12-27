package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
public class Term {
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
    private Chapter chapterByChapterId;
    private Set<UserTerm> userTermsById;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title", nullable = true, length = 255)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "duration", nullable = true, length = 255)
    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Basic
    @Column(name = "video_url", nullable = true, length = 255)
    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    @Basic
    @Column(name = "term_desc", nullable = true, length = 255)
    public String getTermDesc() {
        return termDesc;
    }

    public void setTermDesc(String termDesc) {
        this.termDesc = termDesc;
    }

    @Basic
    @Column(name = "idx", nullable = true)
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    @Basic
    @Column(name = "exp", nullable = true)
    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    @Basic
    @Column(name = "updated_at_day", nullable = true)
    public Integer getUpdatedAtDay() {
        return updatedAtDay;
    }

    public void setUpdatedAtDay(Integer updatedAtDay) {
        this.updatedAtDay = updatedAtDay;
    }

    @Basic
    @Column(name = "updated_at_year_month", nullable = true, length = 255)
    public String getUpdatedAtYearMonth() {
        return updatedAtYearMonth;
    }

    public void setUpdatedAtYearMonth(String updatedAtYearMonth) {
        this.updatedAtYearMonth = updatedAtYearMonth;
    }

    @Basic
    @Column(name = "cover_url", nullable = true, length = 255)
    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    @Basic
    @Column(name = "course_id", nullable = true)
    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Term term = (Term) o;

        if (id != term.id) return false;
        if (title != null ? !title.equals(term.title) : term.title != null) return false;
        if (duration != null ? !duration.equals(term.duration) : term.duration != null) return false;
        if (videoUrl != null ? !videoUrl.equals(term.videoUrl) : term.videoUrl != null) return false;
        if (termDesc != null ? !termDesc.equals(term.termDesc) : term.termDesc != null) return false;
        if (idx != null ? !idx.equals(term.idx) : term.idx != null) return false;
        if (exp != null ? !exp.equals(term.exp) : term.exp != null) return false;
        if (updatedAtDay != null ? !updatedAtDay.equals(term.updatedAtDay) : term.updatedAtDay != null) return false;
        if (updatedAtYearMonth != null ? !updatedAtYearMonth.equals(term.updatedAtYearMonth) : term.updatedAtYearMonth != null)
            return false;
        if (coverUrl != null ? !coverUrl.equals(term.coverUrl) : term.coverUrl != null) return false;
        if (courseId != null ? !courseId.equals(term.courseId) : term.courseId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (duration != null ? duration.hashCode() : 0);
        result = 31 * result + (videoUrl != null ? videoUrl.hashCode() : 0);
        result = 31 * result + (termDesc != null ? termDesc.hashCode() : 0);
        result = 31 * result + (idx != null ? idx.hashCode() : 0);
        result = 31 * result + (exp != null ? exp.hashCode() : 0);
        result = 31 * result + (updatedAtDay != null ? updatedAtDay.hashCode() : 0);
        result = 31 * result + (updatedAtYearMonth != null ? updatedAtYearMonth.hashCode() : 0);
        result = 31 * result + (coverUrl != null ? coverUrl.hashCode() : 0);
        result = 31 * result + (courseId != null ? courseId.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "chapter_id", referencedColumnName = "id")
    public Chapter getChapterByChapterId() {
        return chapterByChapterId;
    }

    public void setChapterByChapterId(Chapter chapterByChapterId) {
        this.chapterByChapterId = chapterByChapterId;
    }

    @OneToMany(mappedBy = "termByTermId")
    public Set<UserTerm> getUserTermsById() {
        return userTermsById;
    }

    public void setUserTermsById(Set<UserTerm> userTermsById) {
        this.userTermsById = userTermsById;
    }
}
