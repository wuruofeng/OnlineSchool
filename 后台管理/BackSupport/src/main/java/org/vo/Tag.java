package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
public class Tag {
    private int tagId;
    private String name;
    private String tagDesc;
    private Set<CourseTag> courseTagsByTagId;
    private Type typeByTypeId;

    @Id
    @Column(name = "tag_id", nullable = false)
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "tag_desc", nullable = true, length = 255)
    public String getTagDesc() {
        return tagDesc;
    }

    public void setTagDesc(String tagDesc) {
        this.tagDesc = tagDesc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tag tag = (Tag) o;

        if (tagId != tag.tagId) return false;
        if (name != null ? !name.equals(tag.name) : tag.name != null) return false;
        if (tagDesc != null ? !tagDesc.equals(tag.tagDesc) : tag.tagDesc != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = tagId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (tagDesc != null ? tagDesc.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "tagByTagId")
    public Set<CourseTag> getCourseTagsByTagId() {
        return courseTagsByTagId;
    }

    public void setCourseTagsByTagId(Set<CourseTag> courseTagsByTagId) {
        this.courseTagsByTagId = courseTagsByTagId;
    }

    @ManyToOne
    @JoinColumn(name = "type_id", referencedColumnName = "id")
    public Type getTypeByTypeId() {
        return typeByTypeId;
    }

    public void setTypeByTypeId(Type typeByTypeId) {
        this.typeByTypeId = typeByTypeId;
    }
}
