package org.vo;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class UserTermPK implements Serializable {
    private int termId;
    private int userId;

    @Column(name = "term_id", nullable = false)
    @Id
    public int getTermId() {
        return termId;
    }

    public void setTermId(int termId) {
        this.termId = termId;
    }

    @Column(name = "user_id", nullable = false)
    @Id
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserTermPK that = (UserTermPK) o;

        if (termId != that.termId) return false;
        if (userId != that.userId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = termId;
        result = 31 * result + userId;
        return result;
    }
}
