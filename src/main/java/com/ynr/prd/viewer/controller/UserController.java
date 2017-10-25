package com.ynr.prd.viewer.controller;

import java.util.Date;

import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.ynr.prd.viewer.model.User;
import com.ynr.prd.viewer.service.UserService;

@RestController
public class UserController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public ModelAndView getUser(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		// The below two lines is must for entity list page loading and saving the
		// entity bcoz it sets the request scope..
		LOG.info("List of Users");
		modelAndView.addObject("user", new User());
		model.addAttribute("userList", userService.findAllUsers());
		modelAndView.setViewName(USER_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/user/add", method = RequestMethod.POST)
	public ModelAndView saveUser(@Valid User user) {
		LOG.info("Save a Single User ");
		user.setActive(1);
		user.setCreatedDate(new Date(System.currentTimeMillis()));
		ModelAndView modelAndView = new ModelAndView();
		userService.saveUser(user);
		modelAndView.addObject("user", new User());
		modelAndView.setViewName(REDIRECT_USER_VIEW);
		return modelAndView;
	}

	@RequestMapping(value = "/admin/user/remove", method = RequestMethod.POST)
	public ModelAndView removeUser(@RequestParam Integer Id) {
		LOG.info("Delete a Single User " + Id);
		userService.delete(Id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(REDIRECT_USER_VIEW);
		return modelAndView;
	}

}
