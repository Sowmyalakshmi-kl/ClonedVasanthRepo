package com.ynr.prd.viewer.controller;

import java.util.Locale;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ynr.prd.viewer.event.EPubViewerEvent;
import com.ynr.prd.viewer.model.EntitySetup;
import com.ynr.prd.viewer.service.EntityService;
import com.ynr.prd.viewer.utils.EPubViewerUtils;

@Controller
public class EntityController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger(EntityController.class);

	@Autowired
	private ApplicationEventPublisher applicationEventPublisher;

	@Autowired
	EntityService entityService;

	@RequestMapping(value = "/admin/entity", method = RequestMethod.GET)
	public String pagesOfTypes(Locale locale, Model model) {
		// The below two lines is must for entity list page loading and saving the
		// entity bcoz it sets the request scope..

		LOG.info("List of Entity");
		EntitySetup entitySetup = new EntitySetup();

		model.addAttribute("entity", entitySetup);

		model.addAttribute("entityList", entityService.findAll());

		return ENTITY_VIEW;
	}

	@RequestMapping(value = "/admin/entity/retrieve/{id}", method = RequestMethod.GET)
	public String getEntity(@PathVariable Integer id, Model model) {

		LOG.info("Retrieve a Single Entity");

		model.addAttribute("singleEntity", entityService.findOne(id));

		return EDIT_ENTITY_VIEW;
	}

	@RequestMapping(value = "/admin/entity/add", method = RequestMethod.POST)
	public String saveEntity(@Valid EntitySetup entitySetup, Model model) {
		// Save and update are same method -- JPA will understand whether this has to
		// save or update based on entityid PK.
		LOG.info("Entity ID " + entitySetup.getEntityId());

		if (entitySetup.getEntityId() == 0) {

			LOG.info("Save a Single Entity");
			entitySetup.setCreatedBy("Vasanth");

			entitySetup.setCreatedDate(EPubViewerUtils.getCurrentTimestamp());

		} else {
			LOG.info("Update a Single Entity");
			entitySetup.setUpdatedBy("VasanthUpdate");

			entitySetup.setUpdatedDate(EPubViewerUtils.getCurrentTimestamp());
		}

		entityService.save(entitySetup);

		/*** Publishing Event Integration ***/
		EPubViewerEvent userEvent = new EPubViewerEvent(this);
		applicationEventPublisher.publishEvent(userEvent);
		/*** Publishing Event Integration ***/

		model.addAttribute("entity", entitySetup);

		return REDIRECT_ENTITY_VIEW;
	}

	@RequestMapping(value = "/admin/entity/remove", method = RequestMethod.POST)
	public String removeEntity(@RequestParam Integer Id) {

		LOG.info("Delete a Single Entity" + Id);

		entityService.delete(Id);

		return REDIRECT_ENTITY_VIEW;
	}

	@RequestMapping(value = "/admin/entity/edit", method = RequestMethod.POST)
	public String editEntity(@RequestParam Integer Id, @Valid EntitySetup entitySetup) {
	
		LOG.info("Edit/Update a Single Entity" + Id);

		entitySetup.setUpdatedBy("VasanthUpdate");

		entitySetup.setUpdatedDate(EPubViewerUtils.getCurrentTimestamp());

		entityService.save(entitySetup); // Update

		return REDIRECT_ENTITY_VIEW;
	}
}
