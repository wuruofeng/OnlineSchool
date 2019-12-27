package org.vo;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class CourseTagPK implements Serializable {
    private int courseId;
    private int tagId;

    @Column(name = "course_id", nullable = false)
    @Id
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    @Column(name = "tag_id", nullable = false)
    @Id
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CourseTagPK that = (CourseTagPK) o;

        if (courseId != that.courseId) return false;
        if (tagId != that.tagId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = courseId;
        result = 31 * result + tagId;
        return result;
    }
}
