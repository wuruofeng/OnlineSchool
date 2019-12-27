package cn.miaozt.onlineschool.web;

import cn.miaozt.onlineschool.mapper.*;
import cn.miaozt.onlineschool.model.*;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.swing.*;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value="/commentInfo")
public class CommentInfoController {

    @Autowired(required = false)
    private CommentInfoMapper commentInfoMapper;

    @RequestMapping(value="/post_user_id={postUserId}", method= RequestMethod.GET)
    @ApiOperation(value="根据用户ID查找评论", notes="根据用户ID查找评论")
    public List<CommentInfo> getCommentByPostUserId(@PathVariable Long postUserId) {
        return commentInfoMapper.getCommentByPostUserId(postUserId);
    }

    @RequestMapping(value="/id={id}", method= RequestMethod.GET)
    @ApiOperation(value="根据评论ID查评论", notes="根据评论ID查评论")
    public List<CommentInfo> getCommentByCommentId(@PathVariable Long id) {
        return commentInfoMapper.getCommentByCommentId(id);
    }

    @RequestMapping(value="/chapter_id={chapterId}", method= RequestMethod.GET)
    @ApiOperation(value="根据章节ID查评论", notes="根据章节ID查评论")
    public List<CommentInfo> getCommentByChapterId(@PathVariable Long chapterId) {
        return commentInfoMapper.getCommentByChapterId(chapterId);
    }

    @RequestMapping(value="/id={id}", method= RequestMethod.DELETE)
    @ApiOperation(value="根据评论ID删除评论", notes="根据评论ID删除评论")
    public Result deleteCommentByCommentId(@PathVariable Long id) {
        commentInfoMapper.deleteCommentByCommentId(id);
        Result result=new Result();
        result.setMsg("delete success");
        return result;
    }

    @RequestMapping(value="/id={id}&content={content}", method= RequestMethod.POST)
    @ApiOperation(value="更改评论", notes="更改评论")
    public Result updateCommentByChapterId(@PathVariable Long id,@PathVariable String content) {
        CommentInfo commentInfo=new CommentInfo();
        commentInfo.setId(id);
        commentInfo.setContent(content);
        commentInfoMapper.updateCommentByChapterId(commentInfo);
        Result result=new Result();
        result.setMsg("update success");
        return result;
    }

    @RequestMapping(value="/post_user_id={postUserId}&content={content}&chapter_id={chapterId}&type={type}&parent_id={parentId}", method= RequestMethod.POST)
    @ApiOperation(value="插入评论", notes="插入评论")
    public Result insCommentInfo(@PathVariable Long postUserId,
                                @PathVariable String content,
                                @PathVariable Long chapterId,
                                @PathVariable String type,
                                @PathVariable Long parentId) {
        CommentInfo commentInfo=new CommentInfo();
        commentInfo.setPostUserId(postUserId);
        commentInfo.setContent(content);
        commentInfo.setChapterId(chapterId);
        commentInfo.setType(type);
        commentInfo.setPostTime(new Date());
        commentInfo.setParentId(parentId);
        commentInfoMapper.insComment(commentInfo);
        Result result=new Result();
        result.setMsg("add success");
        return result;
    }

}
