package com.ynr.prd.viewer.controller;

import java.util.Locale;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.ynr.prd.viewer.service.impl.CustomEvents;

@RestController
public class AppointmentController extends BaseController {
	@RequestMapping(value = "/pages/forms/appointment", method = RequestMethod.GET)
	public ModelAndView getAllAppointments(Locale locale, Model model) {
		ModelAndView modelAndView = new ModelAndView();
		
		// The below two lines is must for entity list page loading and saving the entity bcoz it sets the request scope.. 
//		EntitySetup entitySetup = new EntitySetup();
		
		CustomEvents cevents= new CustomEvents();
		cevents.setCustomEventName("First Event in Backend");
		modelAndView.addObject("custom_events", cevents);
		modelAndView.setViewName("/pages/forms/appointment");
		//model.addAttribute("entityList", entityService.findAll());
		return modelAndView;
	}
}
