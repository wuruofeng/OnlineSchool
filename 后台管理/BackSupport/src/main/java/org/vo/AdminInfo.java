package org.vo;

import javax.persistence.*;

@Entity
@Table(name = "admin_info", schema = "onlineschool_v4", catalog = "")
public class AdminInfo {
    private int id;
    private String adminName;
    private String adminPassword;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "admin_name", nullable = false, length = 255)
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Basic
    @Column(name = "admin_password", nullable = false, length = 255)
    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminInfo adminInfo = (AdminInfo) o;

        if (id != adminInfo.id) return false;
        if (adminName != null ? !adminName.equals(adminInfo.adminName) : adminInfo.adminName != null) return false;
        if (adminPassword != null ? !adminPassword.equals(adminInfo.adminPassword) : adminInfo.adminPassword != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (adminName != null ? adminName.hashCode() : 0);
        result = 31 * result + (adminPassword != null ? adminPassword.hashCode() : 0);
        return result;
    }
}
