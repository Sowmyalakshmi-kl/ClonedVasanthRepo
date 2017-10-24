package com.ynr.prd.viewer.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ynr.prd.viewer.model.EntitySetup;


@Repository("entityRepository")
public interface EntityRepository extends CrudRepository<EntitySetup,Integer>{

}
