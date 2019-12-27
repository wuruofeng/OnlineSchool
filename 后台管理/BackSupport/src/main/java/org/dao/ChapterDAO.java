package org.dao;

import org.hibernate.Query;
import org.util.SessionFactoryUtil;
import org.vo.Chapter;
import org.vo.Course;

import java.util.List;


public class ChapterDAO {
    public static List<Chapter> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Chapter");
        List<Chapter> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Chapter queryByChapterId(Chapter chapter){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Chapter where id=:id");
        query.setParameter("id",chapter.getId());
        List<Chapter> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static List<Chapter> queryByChapterTitle(Chapter chapter){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Chapter where title=:title");
        query.setParameter("title",chapter.getTitle());
        List<Chapter> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Chapter> queryByCourseId(Course course){
    	SessionFactoryUtil.create();
        course=SessionFactoryUtil.session.load(Course.class, course.getCourseId());
        if(course==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from Chapter where courseByCourseId=:courseByCourseId");
        query.setParameter("courseByCourseId",course);
        List<Chapter> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static boolean deleteByChapterId(Chapter chapter){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Chapter.class, chapter.getId())==null) return false;
        SessionFactoryUtil.session.delete(chapter);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean updateByChapterId(Chapter chapter){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Chapter.class, chapter.getId())==null) return false;
        SessionFactoryUtil.session.update(chapter);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertChapter(Chapter chapter){
    	SessionFactoryUtil.create();
        SessionFactoryUtil.session.save(chapter);
        SessionFactoryUtil.close();
        return true;
    }

}
