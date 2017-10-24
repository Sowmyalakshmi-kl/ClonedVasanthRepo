package com.ynr.prd.viewer.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ynr.prd.viewer.model.Role;
import com.ynr.prd.viewer.repository.RoleRepository;
import com.ynr.prd.viewer.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{


	@Autowired
	RoleRepository roleRepository;

	
	@Override
	public List<Role> findAll() {
		return (List<Role>) roleRepository.findAll();

	}

	@Override
	public Role findOne(Integer id) {
		return roleRepository.findOne(id);

	}

	@Override
	public void delete(Integer id) {
		roleRepository.delete(id);
		
	}

	@Override
	public void save(Role role) {
		
		roleRepository.save(role);
		
	}

}
