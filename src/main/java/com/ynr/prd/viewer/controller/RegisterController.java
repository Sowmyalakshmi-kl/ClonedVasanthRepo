package com.ynr.prd.viewer.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.ynr.prd.viewer.model.User;
import com.ynr.prd.viewer.service.EmailService;
import com.ynr.prd.viewer.service.UserService;
import com.ynr.prd.viewer.utils.EmailUtils;


@RestController
public class RegisterController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public ModelAndView registration() {
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		modelAndView.addObject("user", user);
		modelAndView.setViewName(REGISTRATION);
		return modelAndView;
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView();
		User userExists = userService.findUserByEmail(user.getEmail());
		if (userExists != null) {
			bindingResult.rejectValue("email", "error.user",
					"There is already a user registered with the email provided");		}
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName(REGISTRATION);
		} else {
			String actualPassword = user.getPassword();

			userService.saveUser(user);
			modelAndView.addObject("user", new User());

			/** Email Config **/
			String subject = "Registration Confirmation";
			String fromAddr = "vasanthakumar.rajendran@.com"; // Need to change no domain
			String toAddr = user.getEmail();
			String link = "<a href=\"http://localhost:8080/ePubViewer/\">Click Here</a>";
			
			StringBuilder appendBodyText = new StringBuilder();

			appendBodyText.append("Welcome " + user.getName() + " , \n");

			appendBodyText.append("Please find your login details in below, \n");

			appendBodyText.append("Username : " + user.getEmail() + " \n");

			appendBodyText.append("Password : " + actualPassword + "\n");
			
			appendBodyText.append(link);

			emailService.sendEmail(EmailUtils.getEmailConfiguration(appendBodyText.toString(), subject, fromAddr, toAddr));

			modelAndView.addObject("successMessage",
					"User has been registered successfully and confirmation e-mail has been sent to "
							+ user.getEmail());
			modelAndView.setViewName(REGISTRATION);
		}

		return modelAndView;
	}
}
