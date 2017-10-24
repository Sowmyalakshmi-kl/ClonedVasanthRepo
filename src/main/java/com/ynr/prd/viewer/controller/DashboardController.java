package com.ynr.prd.viewer.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class DashboardController extends BaseController {

	private static final Logger LOG = LoggerFactory.getLogger(DashboardController.class);

	@RequestMapping("/index")
	public String index() {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName(DASHBOARD_INDEX);
		return DASHBOARD_INDEX;
	}

	// Added to test 500 page
	@RequestMapping(path = "/tigger-error", produces = MediaType.APPLICATION_JSON_VALUE)
	public void error500() throws Exception {
		throw new Exception();
	}
	

	@RequestMapping(value = "/pages/{page}", method = RequestMethod.GET)
	public ModelAndView pages(Locale locale, Model model, @PathVariable(value = "page") String page) {
		LOG.info("Welcome page! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		ModelAndView modelAndView = new ModelAndView();
		model.addAttribute("serverTime", formattedDate);
		modelAndView.setViewName("pages/" + page);
		return modelAndView;
	}
}
