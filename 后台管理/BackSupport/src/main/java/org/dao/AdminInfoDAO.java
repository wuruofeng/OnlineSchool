package org.dao;

import java.util.List;

import org.hibernate.Query;
import org.util.SessionFactoryUtil;
import org.vo.AdminInfo;

import javax.swing.*;

public class AdminInfoDAO {

	public static AdminInfo queryByAdminName(AdminInfo adminInfo){
    	SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from AdminInfo where adminName=:adminName");
        query.setParameter("adminName",adminInfo.getAdminName());
        List<AdminInfo> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

	public static AdminInfo queryByAdminNameAndAdminPassword(AdminInfo adminInfo){
    	SessionFactoryUtil.create();
    	if(adminInfo.getAdminName()==null||adminInfo.getAdminPassword()==null) return null;
        Query query=SessionFactoryUtil.session.createQuery("from AdminInfo where adminName=:adminName and adminPassword=:adminPassword");
        query.setParameter("adminName", adminInfo.getAdminName());
        query.setParameter("adminPassword", adminInfo.getAdminPassword());
        List<AdminInfo> list=query.list();
        SessionFactoryUtil.close();
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    public static boolean updateAdmin(AdminInfo adminInfo){
	    SessionFactoryUtil.create();
        Query query=SessionFactoryUtil.session.createQuery("from AdminInfo where adminName=:adminName");
        query.setParameter("adminName",adminInfo.getAdminName());
        List<AdminInfo> list=query.list();
        AdminInfo res=list.get(0);
        res.setAdminName(adminInfo.getAdminName());
        res.setAdminPassword(adminInfo.getAdminPassword());
	    SessionFactoryUtil.session.update(res);
	    SessionFactoryUtil.close();
	    return true;
    }

}
