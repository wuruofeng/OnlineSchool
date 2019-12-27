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

import java.util.*;

@RestController
@RequestMapping(value="/course")
public class CourseController {

    @Autowired(required = false)
    private CourseInfoMapper courseMapper;
    @Autowired(required = false)
    private UserCourseRelationshipMapper userCourseRelationshipMapper;
    @Autowired(required = false)
    private UserMapper userMapper;
    @RequestMapping(value="/user_id={userId}", method= RequestMethod.GET)
    @ApiOperation(value="根据用户id获取课程相关信息", notes="根据用户id获取课程相关信息")
    public List<CourseResult> getCourseList(@PathVariable Long userId) {
        // 处理"/users/"的GET请求，用来获取用户列表
        // 还可以通过@RequestParam从页面中传递参数来进行查询条件或者翻页信息的传递
        //System.out.println(userId);
        List<CourseResult> courseResults=new ArrayList<CourseResult>();
        List<CourseInfo> courseInfos = courseMapper.getAll();
        for (CourseInfo item: courseInfos){
            UserCourseRelationship userCourseRelationship = userCourseRelationshipMapper.getByCourseIdAndUserId(item.getId(),userId);
            CourseResult courseResult=new CourseResult(item,userCourseRelationship, UserIsNull.NOTNULL, UserIsLearning.LEARNING);
            if(userCourseRelationship==null){
                courseResult.setUserIsLearning(UserIsLearning.UNLEARNING);
            }
            courseResults.add(courseResult);
        }
        return courseResults;
    }


    @RequestMapping(value="/user_id={userId}&big_type/{bigType}", method=RequestMethod.GET)
    @ApiOperation(value="根据大分类获取课程", notes="根据大分类获取课程")
    public List<CourseResult> getCourseListByBigType(@PathVariable Long userId, @PathVariable String bigType) {
        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
        // url中的id可通过@PathVariable绑定到函数的参数中
        List<CourseResult> courseResults=new ArrayList<CourseResult>();
        List<CourseInfo> courseInfos=courseMapper.getBybigType(bigType);
        for (CourseInfo item: courseInfos){
            UserCourseRelationship userCourseRelationship = userCourseRelationshipMapper.getByCourseIdAndUserId(item.getId(),userId);
            //判断用户是否存在
            User user=userMapper.getOne(userId);
            CourseResult courseResult=new CourseResult(item,userCourseRelationship, UserIsNull.NOTNULL, UserIsLearning.LEARNING);
            if(userCourseRelationship==null){
                courseResult.setUserIsLearning(UserIsLearning.UNLEARNING);
            }
            if(user==null){
                courseResult.setUserIsNull(UserIsNull.NULL);
            }
            courseResults.add(courseResult);
        }
        return courseResults;
    }

    @RequestMapping(value="/author_id={authorId}", method=RequestMethod.GET)
    @ApiOperation(value="根据作者获取课程", notes="根据作者获取课程")
    public List<CourseInfo> getCourseListByAuthorID(@PathVariable Long authorId) {
        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
        // url中的id可通过@PathVariable绑定到函数的参数中
        List<CourseInfo> courseInfos=courseMapper.getByAuthorID(authorId);
        return courseInfos;
    }
    @RequestMapping(value="/type={type}", method=RequestMethod.GET)
    @ApiOperation(value="根据小分类获取课程", notes="根据小分类获取课程")
    public List<CourseInfo> getCourseListByType(@PathVariable String type) {
        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
        // url中的id可通过@PathVariable绑定到函数的参数中
        List<CourseInfo> courseInfos=courseMapper.getByType(type);
        return courseInfos;
    }

    @RequestMapping(value="/id={id}", method=RequestMethod.GET)
    @ApiOperation(value="根据id获取课程", notes="根据id获取课程")
    public CourseInfo getCourseListByID(@PathVariable Long id) {
        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
        // url中的id可通过@PathVariable绑定到函数的参数中
        CourseInfo courseInfo=courseMapper.getById(id);
        return courseInfo;
    }
//    @RequestMapping(value="/{start}/{end}", method=RequestMethod.GET)
//    @ApiOperation(value="/{开始时间}/{结束时间}", notes="获取从start到end的课程")
//    public List<CourseInfo> get(@PathVariable String start,@PathVariable String end) {
//        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
//        // url中的id可通过@PathVariable绑定到函数的参数中
//        List<CourseInfo> courseInfos = null;
//        return courseInfos;
//    }


}
