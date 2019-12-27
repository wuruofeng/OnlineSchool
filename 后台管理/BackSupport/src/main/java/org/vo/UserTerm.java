package org.vo;

import javax.persistence.*;

@Entity
@Table(name = "user_term", schema = "onlineschool_v4", catalog = "")
@IdClass(UserTermPK.class)
public class UserTerm {
    private int termId;
    private int userId;
    private Integer rate;
    private Term termByTermId;
    private UserInfo userInfoByUserId;

    @Id
    @Column(name = "term_id", nullable = false)
    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "rate", nullable = true)
    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserTerm userTerm = (UserTerm) o;

        if (termId != userTerm.termId) return false;
        if (userId != userTerm.userId) return false;
        if (rate != null ? !rate.equals(userTerm.rate) : userTerm.rate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = termId;
        result = 31 * result + userId;
        result = 31 * result + (rate != null ? rate.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "term_id", referencedColumnName = "id", nullable = false)
    public Term getTermByTermId() {
        return termByTermId;
    }

    public void setTermByTermId(Term termByTermId) {
        this.termByTermId = termByTermId;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    public UserInfo getUserInfoByUserId() {
        return userInfoByUserId;
    }

    public void setUserInfoByUserId(UserInfo userInfoByUserId) {
        this.userInfoByUserId = userInfoByUserId;
    }
}
