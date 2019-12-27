package org.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.util.SessionFactoryUtil;
import org.vo.Course;
import org.vo.Teacher;
import org.vo.UserCourse;
import org.vo.UserInfo;

public class CourseDAO {

    public static List<Course> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Course");
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Course queryByCourseId(Course course){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Course where id=:id");
        query.setParameter("id",course.getCourseId());
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static List<Course> queryByPage(HashMap<String, Integer> mp){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Course");
        query.setFirstResult((Integer)mp.get("beginIndex"));
        query.setMaxResults((Integer)mp.get("rows"));
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list==null||list.size()==0) return null;
        return list;
    }

    public static int queryNum() {
        SessionFactoryUtil.create();
        Criteria criteria = SessionFactoryUtil.session.createCriteria(Course.class);
        criteria.setProjection(Projections.rowCount());
        Object ojb = criteria.uniqueResult();
        Long lojb = (Long)ojb;
        int count = lojb.intValue();
        return count;
    }

    public static Set<UserCourse> queryUserCourseByCourseId(Course course){
    	SessionFactoryUtil.create();
        course=SessionFactoryUtil.session.load(Course.class,course.getCourseId());
        if(course==null) return null;
        Set<UserCourse> set= (Set<UserCourse>) course.getUserCoursesByCourseId();
        if(set==null||set.size()==0) set=null;
        SessionFactoryUtil.close();
        return set;
    }

    public static List<Course> queryByCourseTitle(Course course){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Course where title=:title");
        query.setParameter("title",course.getTitle());
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Course> queryByCourseTitleLikely(Course course){
        SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Course where title like :title");
        query.setParameter("title","%"+course.getTitle()+"%");
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Course> queryByTeacherId(Teacher teacher){
    	SessionFactoryUtil.create();
        UserInfo userInfo=new UserInfo();
        userInfo.setId(teacher.getUserid());
        teacher=SessionFactoryUtil.session.load(Teacher.class, teacher.getUserid());
        if(teacher==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from Course where teacherByTeacherId=:teacherByTeacherId");
        query.setParameter("teacherByTeacherId",teacher);
        List<Course> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static boolean deleteByCourseId(Course course){
    	SessionFactoryUtil.create();
        course=SessionFactoryUtil.session.load(Course.class, course.getCourseId());
        if(course==null) return false;
        SessionFactoryUtil.session.delete(course);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertCourse(Course course){
    	SessionFactoryUtil.create();
    	SessionFactoryUtil.session.save(course);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean updateCourseByCourseId(Course course){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Course.class, course.getCourseId())==null) return false;//当course不存在时，则不能修改
        SessionFactoryUtil.session.update(course);
        SessionFactoryUtil.close();
        return true;
    }

}
