package org.test;

import org.action.*;
import org.dao.AdminInfoDAO;
import org.dao.CourseDAO;
import org.dao.TermDAO;
import org.dao.UserInfoDAO;
import org.vo.*;

import java.util.List;

public class test extends Action {
    public static void main(String []args){
		AdminInfo adminInfo=new AdminInfo();
		adminInfo.setAdminName("cjmhk");
		adminInfo.setAdminPassword("12345678");
		adminInfo= AdminInfoDAO.queryByAdminNameAndAdminPassword(adminInfo);
		if(adminInfo!=null) System.out.println("yes");
		else System.out.println("no");
    }
}
