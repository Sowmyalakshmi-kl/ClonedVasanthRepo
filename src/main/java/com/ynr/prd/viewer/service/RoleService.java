package com.ynr.prd.viewer.service;

import java.util.List;
import com.ynr.prd.viewer.model.Role;

public interface RoleService {

	List<Role> findAll();

	Role findOne(Integer id);

	void delete(Integer id);

	void save(Role role);

}
