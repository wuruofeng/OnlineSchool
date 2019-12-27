package cn.miaozt.onlineschool.web;

import java.util.*;
import java.util.List;
import java.util.Map;

import cn.miaozt.onlineschool.enums.UserSexEnum;
import cn.miaozt.onlineschool.mapper.UserMapper;
import cn.miaozt.onlineschool.model.Result;
import cn.miaozt.onlineschool.model.Token;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import cn.miaozt.onlineschool.model.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value="/users")
public class UserController {
    static Map<Long, User> users = Collections.synchronizedMap(new HashMap<Long, User>());
    private static Cookie cookie;
	@Autowired(required = false)
	private UserMapper userMapper;
    @RequestMapping(value="/", method=RequestMethod.GET)
    @ApiOperation(value="获取所有用户", notes="获取所有用户")
    public List<User> getUserList() {
        // 处理"/users/"的GET请求，用来获取用户列表
        // 还可以通过@RequestParam从页面中传递参数来进行查询条件或者翻页信息的传递
        List<User> r = userMapper.getAll();
        return r;
    }

    @RequestMapping(value="/username={username}&password={password}&email={email}&sex={sex}&tel={tel}", method=RequestMethod.POST)
    @ApiOperation(value="创建用户", notes="创建用户")
    public Result postUser(@PathVariable String username,
                           @PathVariable String password,
                           @PathVariable String email,
                           @PathVariable UserSexEnum sex,
                           @PathVariable String tel) {
        // 处理"/users/"的POST请求，用来创建User
        // 除了@ModelAttribute绑定参数之外，还可以通过@RequestParam从页面中传递参数
        //users.put(user.getId(), user);
        Result result=new Result();
        User user=new User(username,password,email,sex,tel);
        User user2=userMapper.getOneByUserName(username);
        if(user2!=null){
            result.setMsg("username is exist");
            return result;
        }else{
            User user3=new User();
            user3.setUserName(user.getUserName()); user3.setPassWord(user.getPassWord()); user3.setEmail(user.getEmail()); user3.setSex(user.getSex());
            userMapper.insert(user);
            result.setMsg("add success");
            return result;
        }
    }

    @RequestMapping(value="/id={id}", method=RequestMethod.GET)
    @ApiOperation(value="获取用户信息", notes="获取单个用户")
    public User getUser(@PathVariable Long id) {
        // 处理"/users/{id}"的GET请求，用来获取url中id值的User信息
        // url中的id可通过@PathVariable绑定到函数的参数中
        User user=userMapper.getOne(id);
        System.out.println(user.toString());
        return user;
    }

    @RequestMapping(value="/id={id}&username={username}&password={password}&email={email}&sex={sex}&tel={tel}", method=RequestMethod.PUT)
    @ApiOperation(value="更新用户信息", notes="更新单个用户")
    public Result putUser(@PathVariable Long id,
                          @PathVariable String username,
                          @PathVariable String password,
                          @PathVariable String email,
                          @PathVariable UserSexEnum sex,
                          @PathVariable String tel) {
        // 处理"/users/{id}"的PUT请求，用来更新User信息
        //User user1 = users.get(id);
        Result result=new Result();
        User user1=userMapper.getOne(id);
        if(user1==null){
           return  result;
        }
        else {
            user1.setId(id);
            user1.setUserName(username);
            user1.setEmail(password);
            user1.setPassWord(email);
            user1.setSex(sex);
            user1.setTel(tel);
            userMapper.update(user1);
            users.put(id, user1);
            result.setMsg("success");
            return result;
        }
    }

    @RequestMapping(value="/id={id}", method=RequestMethod.DELETE)
    @ApiOperation(value="删除用户", notes="单个用户")
    public Result deleteUser(@PathVariable Long id) {
        // 处理"/users/{id}"的DELETE请求，用来删除User
        Result result=new Result();
        userMapper.delete(id);
        users.remove(id);
        result.setMsg("success");
        return result;
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ApiOperation(value = "登录接口，成功后获取cookies信息",httpMethod = "POST")
    public Result login(HttpServletResponse response,
                        HttpServletRequest request,
//                        @RequestParam(value = "username",required = false) String userName,
//                        @RequestParam(value = "password",required = false) String passWord
                            @RequestBody(required = false) User user){
        User user2=userMapper.login(user.getUserName(),user.getPassWord());
        System.out.println(user.toString());
        Result result =new Result();
        if(user2!=null){
            cookie = new Cookie("login","true");  //对比入参数据
            response.addCookie(cookie);
            request.getSession().setAttribute("user",user2);
            result.setMsg("success");
            Token token=new Token(user2);

            result.setToken(token.getToken());
            return result;
        }
        result.setMsg("failed");
        return result;

    }
    //String username,String password,String email,String sex
    @RequestMapping(value ="/register",method = RequestMethod.POST)
    @ApiOperation(value = "注册接口，成功后获取cookies信息",httpMethod = "POST")
    public Result regist(String username, String password, String email, UserSexEnum sex){
        User user2=userMapper.getOneByUserName(username);
        Result result=new Result();
        if(user2!=null){

            result.setMsg("username is exist");
            return  result;
        }else{
            User user=new User();
            user.setUserName(username); user.setPassWord(password); user.setEmail(email); user.setSex(sex);
            userMapper.insert(user);
            result.setMsg("success");
            return  result;
        }
    }
}