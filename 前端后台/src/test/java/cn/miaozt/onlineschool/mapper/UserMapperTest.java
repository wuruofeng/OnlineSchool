package cn.miaozt.onlineschool.mapper;

import java.util.List;

import cn.miaozt.onlineschool.mapper.UserMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import cn.miaozt.onlineschool.model.User;
import cn.miaozt.onlineschool.enums.UserSexEnum;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserMapperTest {

	@Autowired(required = false)
	private UserMapper userMapper;

	@Test
	public void testInsert() throws Exception {
		userMapper.insert(new User("aa", "a123456","123@qq.com", UserSexEnum.MAN,"1111"));
		userMapper.insert(new User("bb", "b123456", "123@qq.com",UserSexEnum.WOMAN,"1111"));
		userMapper.insert(new User("cc", "b123456", "123@qq.com",UserSexEnum.WOMAN,"111"));

		Assert.assertEquals(3, userMapper.getAll().size());
	}

	@Test
	public void testQuery() throws Exception {
		List<User> users = userMapper.getAll();
		if(users==null || users.size()==0){
			System.out.println("is null");
		}else{
			System.out.println(users.toString());
		}
	}
	
	
	@Test
	public void testUpdate() throws Exception {
		User user = userMapper.getOne(6l);
		System.out.println(user.toString());
		user.setEmail("123@qq.com");
		userMapper.update(user);
		Assert.assertTrue(("123@qq.com".equals(userMapper.getOne(6l).getEmail())));
	}

}