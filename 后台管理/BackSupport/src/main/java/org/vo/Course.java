package org.vo;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Set;

@Entity
public class Course {
    private int courseId;
    private String title;
    private String img;
    private BigDecimal price;
    private Byte isLike;
    private String rank;
    private Integer number;
    private String courseDesc;
    private Byte isComplete;
    private Integer praise;
    private String shortTitle;
    private Set<Chapter> chaptersByCourseId;
    private Teacher teacherByTeacherId;
    private Set<CourseTag> courseTagsByCourseId;
    private Set<UserCourse> userCoursesByCourseId;

    @Id
    @Column(name = "course_id", nullable = false)
    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
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
    @Column(name = "img", nullable = true, length = 255)
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Basic
    @Column(name = "price", nullable = true, precision = 2)
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Basic
    @Column(name = "is_like", nullable = true)
    public Byte getIsLike() {
        return isLike;
    }

    public void setIsLike(Byte isLike) {
        this.isLike = isLike;
    }

    @Basic
    @Column(name = "rank", nullable = true, length = 255)
    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    @Basic
    @Column(name = "number", nullable = true)
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Basic
    @Column(name = "course_desc", nullable = true, length = 255)
    public String getCourseDesc() {
        return courseDesc;
    }

    public void setCourseDesc(String courseDesc) {
        this.courseDesc = courseDesc;
    }

    @Basic
    @Column(name = "is_complete", nullable = true)
    public Byte getIsComplete() {
        return isComplete;
    }

    public void setIsComplete(Byte isComplete) {
        this.isComplete = isComplete;
    }

    @Basic
    @Column(name = "praise", nullable = true)
    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    @Basic
    @Column(name = "short_title", nullable = true, length = 255)
    public String getShortTitle() {
        return shortTitle;
    }

    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Course course = (Course) o;

        if (courseId != course.courseId) return false;
        if (title != null ? !title.equals(course.title) : course.title != null) return false;
        if (img != null ? !img.equals(course.img) : course.img != null) return false;
        if (price != null ? !price.equals(course.price) : course.price != null) return false;
        if (isLike != null ? !isLike.equals(course.isLike) : course.isLike != null) return false;
        if (rank != null ? !rank.equals(course.rank) : course.rank != null) return false;
        if (number != null ? !number.equals(course.number) : course.number != null) return false;
        if (courseDesc != null ? !courseDesc.equals(course.courseDesc) : course.courseDesc != null) return false;
        if (isComplete != null ? !isComplete.equals(course.isComplete) : course.isComplete != null) return false;
        if (praise != null ? !praise.equals(course.praise) : course.praise != null) return false;
        if (shortTitle != null ? !shortTitle.equals(course.shortTitle) : course.shortTitle != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = courseId;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (img != null ? img.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (isLike != null ? isLike.hashCode() : 0);
        result = 31 * result + (rank != null ? rank.hashCode() : 0);
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (courseDesc != null ? courseDesc.hashCode() : 0);
        result = 31 * result + (isComplete != null ? isComplete.hashCode() : 0);
        result = 31 * result + (praise != null ? praise.hashCode() : 0);
        result = 31 * result + (shortTitle != null ? shortTitle.hashCode() : 0);
        return result;
    }

    public Set<Chapter> getChaptersByCourseId() {
        return chaptersByCourseId;
    }

    public void setChaptersByCourseId(Set<Chapter> chaptersByCourseId) {
        this.chaptersByCourseId = chaptersByCourseId;
    }

    public Teacher getTeacherByTeacherId() {
        return teacherByTeacherId;
    }

    public void setTeacherByTeacherId(Teacher teacherByTeacherId) {
        this.teacherByTeacherId = teacherByTeacherId;
    }

    public Set<CourseTag> getCourseTagsByCourseId() {
        return courseTagsByCourseId;
    }

    public void setCourseTagsByCourseId(Set<CourseTag> courseTagsByCourseId) {
        this.courseTagsByCourseId = courseTagsByCourseId;
    }

    public Set<UserCourse> getUserCoursesByCourseId() {
        return userCoursesByCourseId;
    }

    public void setUserCoursesByCourseId(Set<UserCourse> userCoursesByCourseId) {
        this.userCoursesByCourseId = userCoursesByCourseId;
    }
}
