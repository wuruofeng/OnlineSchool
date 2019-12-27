package cn.miaozt.onlineschool.web;

import cn.miaozt.onlineschool.enums.UserIsLearning;
import cn.miaozt.onlineschool.enums.UserIsNull;
import cn.miaozt.onlineschool.mapper.*;
import cn.miaozt.onlineschool.model.*;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.*;

@RestController
@RequestMapping(value="/chapter")
public class ChapterController {

    @Autowired(required = false)
    private ChapterInfoMapper chapterMapper;
    /*@RequestMapping(value="/user_id={userId}", method= RequestMethod.GET)
    @ApiOperation(value="获取所有章节+课程+联系", notes="获取所有章节+课程+联系")
    public List<ChapterFullResult> getChapterList(@PathVariable Long userId) {
        List<ChapterFullResult> ChapterFullResult=new ArrayList<ChapterFullResult>();
        List<ChapterInfo> chapterInfos = chapterMapper.getAll();
        for (ChapterInfo item: chapterInfos){
            CourseInfo courseInfo=courseMapper.getById(item.getCourseId());
            UserCourseRelationship userCourseRelationship = userCourseRelationshipMapper.getByCourseIdAndUserId(courseInfo.getId(),userId);
            ChapterFullResult chapterFullResult=new ChapterFullResult(item,courseInfo,userCourseRelationship, UserIsNull.NOTNULL, UserIsLearning.LEARNING);
            if(userCourseRelationship==null){
                chapterFullResult.setUserIsLearning(UserIsLearning.UNLEARNING);
            }
            ChapterFullResult.add(chapterFullResult);
        }
        return ChapterFullResult;
    }*/

    /*
       通过courseId来查询章节信息 返回一个list
    * */
    @RequestMapping(value="/course_id={courseId}", method= RequestMethod.GET)
    @ApiOperation(value="根据课程ID获取章节", notes="根据课程ID获取章节")
    public List<ChapterInfo> getChapterInfoByCourseIdList(@PathVariable Long courseId) {
        return chapterMapper.getByCourseId(courseId);
    }

    /*
        获取更新年月日 需获得created_at
     */
    @Autowired(required = false)
    @RequestMapping(value="/created_at={created_at}", method= RequestMethod.GET)
    @ApiOperation(value="yyy-mm-dd转年月日", notes="yyy-mm-dd转年月日")
    public Create_at getCreatedAtInfo(@PathVariable String created_at) {
        Create_at create_at =new Create_at(created_at);
        return create_at;
    }

    @RequestMapping(value="/id={id}", method= RequestMethod.GET)
    @ApiOperation(value="根据ID获取章节", notes="根据ID获取章节")
    public List<ChapterInfo> getById(@PathVariable Long id) {
        return chapterMapper.getById(id);
    }

    @RequestMapping(value="/year={year}&month={month}&day={day}", method= RequestMethod.GET)
    @ApiOperation(value="根据创建时间获取章节", notes="根据创建时间获取章节")
    public List<ChapterInfo> getByCreatedAt(@PathVariable String year,@PathVariable String month,@PathVariable String day) {
        return chapterMapper.getByCreatedAt(year+"-"+month+"-"+day);
    }
}
