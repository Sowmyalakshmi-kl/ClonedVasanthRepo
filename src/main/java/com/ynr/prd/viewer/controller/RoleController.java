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
import com.ynr.prd.viewer.model.Role;
import com.ynr.prd.viewer.service.RoleService;

@RestController
public class RoleController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger(EntityController.class);

	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/admin/role", method = RequestMethod.GET)
	public ModelAndView pagesOfTypes(Locale locale, Model model) {
		
		LOG.info("Role List ===> ");
		ModelAndView modelAndView = new ModelAndView();
		// The below two lines is must for entity list page loading and saving the
		// entity bcoz it sets the request scope..
		Role role = new Role();
		modelAndView.addObject("role", role);
		model.addAttribute("roleList", roleService.findAll());
		modelAndView.setViewName(ROLE_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/role/retrieve/{id}", method = RequestMethod.GET)
	public ModelAndView getEntity(@PathVariable Integer id, Model model) {
		ModelAndView modelAndView = new ModelAndView();
		model.addAttribute("singleRole", roleService.findOne(id));
		modelAndView.setViewName(ROLE_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/role/add", method = RequestMethod.POST)
	public ModelAndView saveEntity(@Valid Role role) {
		// Save and update are same method -- JPA will understand whether this has to
		// save or update based on roleid PK.
		ModelAndView modelAndView = new ModelAndView();
		System.err.println("Add Roles "+role.getRole());
		role.setActive(1);
		role.setCreatedBy("Vasanth");
		role.setCreatedDate(new Date(System.currentTimeMillis()));
		roleService.save(role);
		modelAndView.addObject("role", role);
		modelAndView.setViewName(REDIRECT_ROLE_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/role/remove", method = RequestMethod.POST)
	public ModelAndView removeEntity(@RequestParam Integer Id) {
		roleService.delete(Id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(REDIRECT_ROLE_VIEW);
		return modelAndView;
	}
}
