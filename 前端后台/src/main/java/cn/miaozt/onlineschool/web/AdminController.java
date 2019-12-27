package cn.miaozt.onlineschool.web;

import java.util.*;
import java.util.List;
import java.util.Map;

import cn.miaozt.onlineschool.mapper.AdminMapper;
import cn.miaozt.onlineschool.model.Admin;
import cn.miaozt.onlineschool.model.Result;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;

@RestController
@RequestMapping(value="/admin")
public class AdminController {
    static Map<Long, Admin> admins = Collections.synchronizedMap(new HashMap<Long, Admin>());
    private static Cookie cookie;
    @Autowired(required = false)
    private AdminMapper adminMapper;
    @RequestMapping(value="/", method=RequestMethod.GET)
    @ApiOperation(value="获取所有管理员", notes="获取所有管理员")
    public List<Admin> getAllAdmin() {
        return adminMapper.getAllAdmin();
    }

    @RequestMapping(value="/id={id}", method=RequestMethod.GET)
    @ApiOperation(value="根据ID获取管理员", notes="根据ID获取管理员")
    public List<Admin> getByAdminId(@PathVariable Long id) {
        return adminMapper.getByAdminId(id);
    }

    @RequestMapping(value="/username={username}", method=RequestMethod.GET)
    @ApiOperation(value="根据用户名获取管理员", notes="根据用户名获取管理员")
    public List<Admin> getByUsername(@PathVariable String username) {
        return adminMapper.getByUsername(username);
    }

    @RequestMapping(value="/username={username}&password={password}", method=RequestMethod.POST)
    @ApiOperation(value="根据管理员用户名更改密码", notes="根据管理员用户名更改密码")
    public Result updatePasswordByAdminName(@PathVariable String username,@PathVariable String password){
        Admin admin=new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        adminMapper.updatePasswordByAdminName(admin);
        Result result=new Result();
        result.setMsg("update success");
        return result;
    }

    @RequestMapping(value="/id={id}&password={password}", method=RequestMethod.POST)
    @ApiOperation(value="根据管理员ID更改密码", notes="根据管理员ID更改密码")
    public Result updatePasswordByAdminId(@PathVariable Long id,@PathVariable String password){
        Admin admin=new Admin();
        admin.setId(id);
        admin.setPassword(password);
        adminMapper.updatePasswordByAdminId(admin);
        Result result=new Result();
        result.setMsg("update success");
        return result;
    }

    @RequestMapping(value="/username={username}&password={password}", method=RequestMethod.PUT)
    @ApiOperation(value="插入管理员", notes="插入管理员")
    public Result insertAdmin(@PathVariable String username,@PathVariable String password){
        List<Admin> adminList=getByUsername(username);
        if(adminList!=null&&adminList.size()>0) {
            Result result=new Result();
            result.setMsg("insert failed");
            return result;
        }
        Admin admin=new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        adminMapper.insertAdmin(admin);
        Result result=new Result();
        result.setMsg("insert success");
        return result;
    }

    @RequestMapping(value="/username={username}", method=RequestMethod.DELETE)
    @ApiOperation(value="根据用户名删除管理员", notes="根据用户名删除管理员")
    public Result deleteByAdminName(@PathVariable String username){
        adminMapper.deleteByAdminName(username);
        Result result=new Result();
        result.setMsg("delete success");
        return result;
    }

    @RequestMapping(value="/id={id}", method=RequestMethod.DELETE)
    @ApiOperation(value="根据ID删除管理员", notes="根据ID删除管理员")
    public Result deleteByAdminId(@PathVariable Long id){
        adminMapper.deleteByAdminId(id);
        Result result=new Result();
        result.setMsg("delete success");
        return result;
    }
}