package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.*;

public interface UserCourseRelationshipMapper {
    UserCourseRelationship getByCourseIdAndUserId(Long courseId,Long userId);
    UserCourseRelationship getByUserId(Long userId);

}
