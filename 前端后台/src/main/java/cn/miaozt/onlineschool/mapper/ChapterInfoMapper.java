package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.ChapterInfo;

import java.util.Date;
import java.util.List;

public interface ChapterInfoMapper {
    List<ChapterInfo> getAll();
    List<ChapterInfo> getById(Long id);
    List<ChapterInfo> getByCourseId(Long courseId);
    List<ChapterInfo> getByCreatedAt(String date);

}
