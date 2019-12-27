package org.dao;

import java.util.List;

import org.hibernate.Query;
import org.util.SessionFactoryUtil;
import org.vo.Teacher;
import org.vo.UserInfo;

public class TeacherDAO {
    public static List<Teacher> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Teacher");
        List<Teacher> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Teacher queryByUserId(UserInfo userInfo){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(UserInfo.class, userInfo.getId())==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from Teacher where userid=:userid");
        query.setParameter("userid",userInfo.getId());
        List<Teacher> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static Teacher queryByName(Teacher teacher){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Teacher where name=:name");
        query.setParameter("name",teacher.getName());
        List<Teacher> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static boolean updateByUserId(Teacher teacher){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Teacher.class, teacher.getUserid())==null) return false;
        SessionFactoryUtil.session.update(teacher);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean deleteByUserId(Teacher teacher){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Teacher.class, teacher.getUserid())==null) return false;
        SessionFactoryUtil.session.delete(teacher);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertTeacher(Teacher teacher){
        SessionFactoryUtil.create();
        SessionFactoryUtil.session.save(teacher);
        SessionFactoryUtil.close();
        return true;
    }

}
