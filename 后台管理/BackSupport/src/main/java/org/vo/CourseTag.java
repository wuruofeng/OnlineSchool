package org.vo;

import javax.persistence.*;

@Entity
@Table(name = "course_tag", schema = "onlineschool_v4", catalog = "")
@IdClass(CourseTagPK.class)
public class CourseTag {
    private int courseId;
    private int tagId;
    private int elt;
    private Course courseByCourseId;
    private Tag tagByTagId;

    @Id
    @Column(name = "course_id", nullable = false)
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    @Id
    @Column(name = "tag_id", nullable = false)
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    @Basic
    @Column(name = "elt", nullable = false)
    public int getElt() {
        return elt;
    }

    public void setElt(int elt) {
        this.elt = elt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CourseTag courseTag = (CourseTag) o;

        if (courseId != courseTag.courseId) return false;
        if (tagId != courseTag.tagId) return false;
        if (elt != courseTag.elt) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = courseId;
        result = 31 * result + tagId;
        result = 31 * result + elt;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "course_id", referencedColumnName = "course_id", nullable = false)
    public Course getCourseByCourseId() {
        return courseByCourseId;
    }

    public void setCourseByCourseId(Course courseByCourseId) {
        this.courseByCourseId = courseByCourseId;
    }

    @ManyToOne
    @JoinColumn(name = "tag_id", referencedColumnName = "tag_id", nullable = false)
    public Tag getTagByTagId() {
        return tagByTagId;
    }

    public void setTagByTagId(Tag tagByTagId) {
        this.tagByTagId = tagByTagId;
    }
}
