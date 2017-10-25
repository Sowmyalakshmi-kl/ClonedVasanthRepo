package com.ynr.prd.viewer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.ynr.prd.viewer.model.Role;

@Repository("roleRepository")
public interface RoleRepository extends CrudRepository<Role, Integer> {

	Role findByRole(String roleName);
	
	
}