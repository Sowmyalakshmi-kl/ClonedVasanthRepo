package com.ynr.prd.viewer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynr.prd.viewer.model.EntitySetup;
import com.ynr.prd.viewer.repository.EntityRepository;
import com.ynr.prd.viewer.service.EntityService;

@Service("entityService")
public class EntityServiceImpl implements EntityService {

	@Autowired
	EntityRepository entityRepository;

	@Override
	public List<EntitySetup> findAll() {
		return (List<EntitySetup>) entityRepository.findAll();
	}

	@Override
	public EntitySetup findOne(Integer id) {
		return entityRepository.findOne(id);
	}

	@Override
	public void save(EntitySetup entity) {
		entityRepository.save(entity);
	}

	@Override
	public void delete(Integer id) {
		entityRepository.delete(id);
	}

}
