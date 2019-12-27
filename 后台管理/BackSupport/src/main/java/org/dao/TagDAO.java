package org.dao;

import java.util.List;

import org.hibernate.Query;
import org.util.SessionFactoryUtil;
import org.vo.Tag;
import org.vo.Type;

public class TagDAO {
    public static List<Tag> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Tag");
        List<Tag> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Tag queryByTagId(Tag tag){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Tag where id=:id");
        query.setParameter("id",tag.getTagId());
        List<Tag> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static Type queryTypeByTagID(Tag tag){
    	SessionFactoryUtil.create();
        tag=SessionFactoryUtil.session.load(Tag.class,tag.getTagId());
        return tag.getTypeByTypeId();
    }

    public static List<Tag> queryByTypeId(Type type){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Tag where typeByTypeId=:typeByTypeId");
        query.setParameter("typeByTypeId",type);
        List<Tag> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Tag> queryByName(Tag tag){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Tag where name=:name");
        query.setParameter("name",tag.getName());
        List<Tag> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Tag> queryByTagDesc(Tag tag){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Tag where tagDesc=:tagDesc");
        query.setParameter("tagDesc",tag.getTagDesc());
        List<Tag> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static boolean updateByTagId(Tag tag){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Tag.class, tag.getTagId())==null) return false;
        SessionFactoryUtil.session.update(tag);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean deleteByTagId(Tag tag){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Tag.class, tag.getTagId())==null) return false;
        SessionFactoryUtil.session.delete(tag);
        SessionFactoryUtil.close();
        return true;
    }

    public static boolean insertTag(Tag tag){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Tag.class, tag.getTagId())!=null) return false;
        SessionFactoryUtil.session.save(tag);
        SessionFactoryUtil.close();
        return true;
    }

}
