package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
public class Chapter {
    private int id;
    private String title;
    private String chapterDesc;
    private String duration;
    private Byte isFinished;
    private String isLike;
    private Course courseByCourseId;
    private Set<Term> termsById;

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
    @Column(name = "chapter_desc", nullable = true, length = 255)
    public String getChapterDesc() {
        return chapterDesc;
    }

    public void setChapterDesc(String chapterDesc) {
        this.chapterDesc = chapterDesc;
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
    @Column(name = "is_finished", nullable = true)
    public Byte getIsFinished() {
        return isFinished;
    }

    public void setIsFinished(Byte isFinished) {
        this.isFinished = isFinished;
    }

    @Basic
    @Column(name = "is_like", nullable = true, length = 255)
    public String getIsLike() {
        return isLike;
    }

    public void setIsLike(String isLike) {
        this.isLike = isLike;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Chapter chapter = (Chapter) o;

        if (id != chapter.id) return false;
        if (title != null ? !title.equals(chapter.title) : chapter.title != null) return false;
        if (chapterDesc != null ? !chapterDesc.equals(chapter.chapterDesc) : chapter.chapterDesc != null) return false;
        if (duration != null ? !duration.equals(chapter.duration) : chapter.duration != null) return false;
        if (isFinished != null ? !isFinished.equals(chapter.isFinished) : chapter.isFinished != null) return false;
        if (isLike != null ? !isLike.equals(chapter.isLike) : chapter.isLike != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (chapterDesc != null ? chapterDesc.hashCode() : 0);
        result = 31 * result + (duration != null ? duration.hashCode() : 0);
        result = 31 * result + (isFinished != null ? isFinished.hashCode() : 0);
        result = 31 * result + (isLike != null ? isLike.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "course_id", referencedColumnName = "course_id")
    public Course getCourseByCourseId() {
        return courseByCourseId;
    }

    public void setCourseByCourseId(Course courseByCourseId) {
        this.courseByCourseId = courseByCourseId;
    }

    @OneToMany(mappedBy = "chapterByChapterId")
    public Set<Term> getTermsById() {
        return termsById;
    }

    public void setTermsById(Set<Term> termsById) {
        this.termsById = termsById;
    }
}
