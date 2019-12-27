package org.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.util.SessionFactoryUtil;
import org.vo.UserCourse;
import org.vo.UserInfo;
import org.vo.UserTerm;

import javax.swing.*;

public class UserInfoDAO {
    
    public static List<UserInfo> queryAll() {
    	SessionFactoryUtil.create();
    	Query query=SessionFactoryUtil.session.createQuery("from UserInfo");
    	List<UserInfo> list=query.list();
    	SessionFactoryUtil.close();
    	if(list==null||list.size()==0) return null;
    	return list;
    }
    
    public static List<UserInfo> queryByPage(HashMap<String, Integer> mp){
    	SessionFactoryUtil.create();
    	Query query=SessionFactoryUtil.session.createQuery("from UserInfo");
		query.setFirstResult((Integer)mp.get("beginIndex"));
		query.setMaxResults((Integer)mp.get("rows"));
    	List<UserInfo> list=query.list();
    	for(UserInfo userInfo:list){
    	    userInfo.getTeacherById();
        }
    	SessionFactoryUtil.close();
    	return list;
    }
    
    public static int queryNum() {
    	SessionFactoryUtil.create();
    	Criteria criteria = SessionFactoryUtil.session.createCriteria(UserInfo.class);
    	criteria.setProjection(Projections.rowCount());
    	Object ojb = criteria.uniqueResult();
    	Long lojb = (Long)ojb;
    	int count = lojb.intValue();
    	return count;
    }

    public static UserInfo queryByUsername(UserInfo userInfo){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from UserInfo where username=:username");
        query.setParameter("username",userInfo.getUsername());
        List<UserInfo> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static List<UserInfo> queryByUsernameLikely(UserInfo userInfo){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from UserInfo where username like :username");
        query.setParameter("username","%"+userInfo.getUsername()+"%");
        List<UserInfo> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static UserInfo queryByUserId(UserInfo userInfo){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from UserInfo where id=:id");
        query.setParameter("id",userInfo.getId());
        List<UserInfo> list=query.list();
        if(list.size()==0){
            SessionFactoryUtil.close();
            return null;
        }else{
            userInfo=list.get(0);
            userInfo.getTeacherById();
            SessionFactoryUtil.close();
            return userInfo;
        }
    }

    public static Set<UserCourse> queryUserCourseByUserId(UserInfo userInfo){
    	SessionFactoryUtil.create();
        userInfo=SessionFactoryUtil.session.load(UserInfo.class,userInfo.getId());
        if(userInfo==null) return null;
        Set<UserCourse> set= (Set<UserCourse>) userInfo.getUserCoursesById();
        if(set==null||set.size()==0) set=null;
        SessionFactoryUtil.close();
        return set;
    }

    public static Set<UserTerm> queryUserTermByUserId(UserInfo userInfo){
    	SessionFactoryUtil.create();
        userInfo=SessionFactoryUtil.session.load(UserInfo.class,userInfo.getId());
        if(userInfo==null) return null;
        Set<UserTerm> set= (Set<UserTerm>) userInfo.getUserTermsById();
        if(set==null||set.size()==0) return set=null;
        SessionFactoryUtil.close();
        return set;
    }

    public static UserInfo queryByUsernameAndPassword(UserInfo userInfo){
    	SessionFactoryUtil.create();
    	if(userInfo.getUsername()==null||userInfo.getPassword()==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from UserInfo where username=:username and password=:password");
        query.setParameter("username", userInfo.getUsername());
        query.setParameter("password", userInfo.getPassword());
        List<UserInfo> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static boolean deleteUserByID(UserInfo userInfo){
    	SessionFactoryUtil.create();
        userInfo=SessionFactoryUtil.session.load(UserInfo.class,userInfo.getId());
        if(userInfo==null) return false;
        SessionFactoryUtil.session.delete(userInfo);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean updateUserByUserId(UserInfo userInfo){
    	SessionFactoryUtil.create();
        SessionFactoryUtil.session.update(userInfo);
        userInfo.getTeacherById();
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertUser(UserInfo userInfo){
    	SessionFactoryUtil.create();
        SessionFactoryUtil.session.save(userInfo);
        SessionFactoryUtil.close();
        return true;
    }

}
