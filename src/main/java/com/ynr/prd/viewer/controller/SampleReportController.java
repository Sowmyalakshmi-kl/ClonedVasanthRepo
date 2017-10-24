package com.ynr.prd.viewer.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ynr.prd.viewer.model.User;
import com.ynr.prd.viewer.reportView.UserExcelView;
import com.ynr.prd.viewer.reportView.UserPDFView;
import com.ynr.prd.viewer.service.UserService;

@RestController
public class SampleReportController extends BaseController {

	// Excel,CSV,PDF,XML,Text,JSON etc.,

	@Autowired
	UserService userService;

	@Autowired
	UserExcelView userExcelView;

	@RequestMapping(value = "/pdfreport", method = RequestMethod.GET, produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> usersPDFReport() throws IOException {

		List<User> user = (List<User>) userService.findAllUsers();

		ByteArrayInputStream bis = UserPDFView.generateReport(user);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename=usersreport.pdf");

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/excelreport", method = RequestMethod.GET)
	public ModelAndView usersExcelReport() throws Exception {
		List<User> user = (List<User>) userService.findAllUsers();
		Map<String, Object> model = new HashMap<>();
		model.put("users", user);
		return new ModelAndView("UserListExcel", "users", user);
	}
}
