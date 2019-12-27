package org.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.util.SessionFactoryUtil;
import org.vo.Chapter;
import org.vo.Course;
import org.vo.Term;
import org.vo.UserTerm;

public class TermDAO {
    public static List<Term> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Term");
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Term queryByTermId(Term term){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Term where id=:id");
        query.setParameter("id",term.getId());
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static List<Term> queryByPage(HashMap<String, Integer> mp){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Term");
        query.setFirstResult((Integer)mp.get("beginIndex"));
        query.setMaxResults((Integer)mp.get("rows"));
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list==null||list.size()==0) return null;
        return list;
    }

    public static int queryNum() {
        SessionFactoryUtil.create();
        Criteria criteria = SessionFactoryUtil.session.createCriteria(Term.class);
        criteria.setProjection(Projections.rowCount());
        Object ojb = criteria.uniqueResult();
        Long lojb = (Long)ojb;
        int count = lojb.intValue();
        return count;
    }

    public static Set<UserTerm> queryUserTermByTermId(Term term){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Term.class,term.getId())==null) return null;
        Set<UserTerm> set= (Set<UserTerm>) term.getUserTermsById();
        if(set==null||set.size()==0) set=null;
        SessionFactoryUtil.close();
        return set;
    }

    public static List<Term> queryByChapterId(Chapter chapter){
    	SessionFactoryUtil.create();
        chapter=ChapterDAO.queryByChapterId(chapter);
        if(SessionFactoryUtil.session.load(Chapter.class, chapter.getId())==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from Term where chapterByChapterId=:chapterByChapterId");
        query.setParameter("chapterByChapterId",chapter);
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Term> queryByTitle(Term term){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Term where title=:title");
        query.setParameter("title",term.getTitle());
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Term> queryByTitleLikely(Term term){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Term where title like :title");
        query.setParameter("title","%"+term.getTitle()+"%");
        List<Term> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static boolean deleteByTermId(Term term){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Term.class, term.getId())==null) return false;
        SessionFactoryUtil.session.delete(term);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean updateByTermId(Term term){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Term.class, term.getId())==null) return false;
        SessionFactoryUtil.session.update(term);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertTerm(Term term){
        SessionFactoryUtil.create();
        SessionFactoryUtil.session.save(term);
        SessionFactoryUtil.close();
        return true;
    }
}
