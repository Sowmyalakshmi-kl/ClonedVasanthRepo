package com.ynr.prd.viewer.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RestController
public class FileUploadController extends BaseController {

	@Value("${file.upload.location}")
	private String UPLOAD_FOLDER;

	@RequestMapping(value = "/fileUpload/upload", method = RequestMethod.POST)
	public ModelAndView fileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView();
		if (file.isEmpty()) {
			modelAndView.addObject("FileName", "No Files selected ");
			modelAndView.addObject("message",
					"<font color=\"RED\"> Please select atleast one file and try again</font>");
			modelAndView.setViewName("/fileUpload/status");
			return modelAndView;
		}

		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(UPLOAD_FOLDER + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}

		modelAndView.addObject("FileName", file.getOriginalFilename());
		modelAndView.addObject("message", "<font color=\\\"Green\\\"> File Uploaded sucessfully</font>");
		modelAndView.setViewName("/fileUpload/status");
		return modelAndView;
	}

	@RequestMapping(value = "/fileUpload/upload", method = RequestMethod.GET)
	public ModelAndView fileUpload() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/fileUpload/upload");
		return modelAndView;
	}
}
