package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.CourseInfo;

import java.util.List;

public interface CourseInfoMapper {
    List<CourseInfo> getAll();
    List<CourseInfo> getByType(String type);
    List<CourseInfo> getBybigType(String bigType);
    List<CourseInfo> getLastTen();
    CourseInfo getById(Long id);
    List<CourseInfo> getByAuthorID(Long authorId);
    void insert(CourseInfo courseInfo);
}
