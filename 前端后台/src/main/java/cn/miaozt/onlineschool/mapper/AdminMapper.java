package cn.miaozt.onlineschool.mapper;

import cn.miaozt.onlineschool.model.Admin;

import java.util.List;

public interface AdminMapper {

	List<Admin> getAllAdmin();
	List<Admin> getByAdminId(Long id);
	List<Admin> getByUsername(String username);
	void updatePasswordByAdminName(Admin admin);
	void updatePasswordByAdminId(Admin admin);
	void insertAdmin(Admin admin);
	void deleteByAdminName(String username);
	void deleteByAdminId(Long id);

}