package org.dao;

import java.util.List;

import org.hibernate.Query;
import org.util.SessionFactoryUtil;
import org.vo.Type;

public class TypeDAO {
    public static List<Type> queryAll(){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Type");
        List<Type> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static Type queryByTypeId(Type type){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Type where id=:id");
        query.setParameter("id",type.getId());
        List<Type> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static List<Type> queryByName(Type type){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Type where name=:name");
        query.setParameter("name",type.getName());
        List<Type> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    public static List<Type> queryByDesc(Type type){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from Type where desc=:desc");
        query.setParameter("desc",type.getDesc());
        List<Type> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

}
