package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
public class Type {
    private int id;
    private String name;
    private String desc;
    private Set<Tag> tagsById;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "desc", nullable = true, length = 255)
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Type type = (Type) o;

        if (id != type.id) return false;
        if (name != null ? !name.equals(type.name) : type.name != null) return false;
        if (desc != null ? !desc.equals(type.desc) : type.desc != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (desc != null ? desc.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "typeByTypeId")
    public Set<Tag> getTagsById() {
        return tagsById;
    }

    public void setTagsById(Set<Tag> tagsById) {
        this.tagsById = tagsById;
    }
}
