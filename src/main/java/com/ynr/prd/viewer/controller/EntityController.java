package com.ynr.prd.viewer.controller;

import java.util.Date;
import java.util.Locale;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.ynr.prd.viewer.model.EntitySetup;
import com.ynr.prd.viewer.service.EntityService;

@RestController
public class EntityController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger(EntityController.class);

	@Autowired
	EntityService entityService;

	@RequestMapping(value = "/admin/entity", method = RequestMethod.GET)
	public ModelAndView pagesOfTypes(Locale locale, Model model) {
		ModelAndView modelAndView = new ModelAndView();
		// The below two lines is must for entity list page loading and saving the
		// entity bcoz it sets the request scope..
		LOG.info("List of Entity");
		EntitySetup entitySetup = new EntitySetup();
		modelAndView.addObject("entity", entitySetup);
		model.addAttribute("entityList", entityService.findAll());
		modelAndView.setViewName(ENTITY_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/entity/retrieve/{id}", method = RequestMethod.GET)
	public ModelAndView getEntity(@PathVariable Integer id, Model model) {
		LOG.info("Retrieve a Single Entity");
		ModelAndView modelAndView = new ModelAndView();
		model.addAttribute("singleEntity", entityService.findOne(id));
		modelAndView.setViewName("/admin/editEntity");
		return modelAndView;
	}

	@RequestMapping(value = "/admin/entity/add", method = RequestMethod.POST)
	public ModelAndView saveEntity(@Valid EntitySetup entitySetup) {
		// Save and update are same method -- JPA will understand whether this has to
		// save or update based on entityid PK.
		if (entitySetup.getEntityId() != 0) {

			entitySetup.setActive(1);
			entitySetup.setUpdatedBy("Vasanth");
			entitySetup.setUpdatedDate(new Date(System.currentTimeMillis()));
		} else {
			entitySetup.setActive(1);
			entitySetup.setCreatedBy("Vasanth");
			entitySetup.setCreatedDate(new Date(System.currentTimeMillis()));
		}
		LOG.info("Save a Single Entity");
		ModelAndView modelAndView = new ModelAndView();
		entityService.save(entitySetup);
		modelAndView.addObject("entity", entitySetup);
		modelAndView.setViewName(REDIRECT_ENTITY_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/entity/remove", method = RequestMethod.POST)
	public ModelAndView removeEntity(@RequestParam Integer Id) {
		LOG.info("Delete a Single Entity" + Id);
		entityService.delete(Id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(REDIRECT_ENTITY_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/entity/edit", method = RequestMethod.POST)
	public ModelAndView editEntity(@RequestParam Integer Id) {
		LOG.info("Edit/Update a Single Entity" + Id);
		EntitySetup entitySetup = new EntitySetup();
		entitySetup = entityService.findOne(Id);
		entitySetup.setCreatedBy("Saved123");
		entityService.save(entitySetup); // Update
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(REDIRECT_ENTITY_VIEW);
		return modelAndView;
	}
}
