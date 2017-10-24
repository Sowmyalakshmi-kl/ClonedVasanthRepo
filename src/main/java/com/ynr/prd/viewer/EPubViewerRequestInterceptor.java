package com.ynr.prd.viewer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.ynr.prd.viewer.controller.BaseController;

@Component
public class EPubViewerRequestInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOG = LoggerFactory.getLogger(EPubViewerRequestInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {

		if (StringUtils.isEmpty(BaseController.BASE_URL)) {
			String baseUrl = extractBaseUrl(request);
			BaseController.BASE_URL = baseUrl;
		}

		LOG.info("Interceptor =====> ", BaseController.BASE_URL);
		return true;
	}

	private String extractBaseUrl(HttpServletRequest request) {
		String constructedURL = request.getScheme() + "://" + request.getServerName()
				+ (request.getServerPort() > 0 ? ":" + request.getServerPort() : null) + request.getContextPath();
		LOG.info("Constructed URL ====> " + constructedURL);
		LOG.info("Context Path :: " + request.getContextPath() + " Servlet Path :: " + request.getServletPath()
				+ " URL :: " + request.getRequestURL());
		return constructedURL;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView model)
			throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3)
			throws Exception {

	}
}
