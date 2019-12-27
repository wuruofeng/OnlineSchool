package org.dao;

import org.util.SessionFactoryUtil;
import org.vo.Tokeninfo;
import org.vo.UserInfo;

public class TokenInfoDAO {

    public static Tokeninfo queryByTokenId(Tokeninfo tokeninfo){
    	SessionFactoryUtil.create();
        tokeninfo=SessionFactoryUtil.session.load(Tokeninfo.class,tokeninfo.getId());
        SessionFactoryUtil.close();
        return tokeninfo;
    }

    public static UserInfo queryUserByTokenId(Tokeninfo tokeninfo){
    	SessionFactoryUtil.create();
        tokeninfo=SessionFactoryUtil.session.load(Tokeninfo.class,tokeninfo.getId());
        SessionFactoryUtil.close();
        if(tokeninfo==null) return null;
        return new UserInfo();
    }

    public static boolean deleteByTokenId(Tokeninfo tokeninfo){
    	SessionFactoryUtil.create();
        if(SessionFactoryUtil.session.load(Tokeninfo.class,tokeninfo.getId())==null) return false;
        SessionFactoryUtil.session.delete(tokeninfo);
        SessionFactoryUtil.close();
        return true;
    }
}
