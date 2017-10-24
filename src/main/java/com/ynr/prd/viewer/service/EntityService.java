package com.ynr.prd.viewer.service;

import java.util.List;
import com.ynr.prd.viewer.model.EntitySetup;

public interface EntityService {

	List<EntitySetup> findAll();

	EntitySetup findOne(Integer id);

	void save(EntitySetup entity);

	void delete(Integer id);

}
