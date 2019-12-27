package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.Token;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TokenMapper {
    void addToken(Token token);
    void updataToken(Token token);
    Token findByUserId(int userid);
}
