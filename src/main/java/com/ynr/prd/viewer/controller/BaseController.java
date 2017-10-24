package com.ynr.prd.viewer.controller;

public abstract class BaseController {

	public static String BASE_URL = "";

	/** Login Starts **/
	static final String LOGIN = "login";
	static final String REGISTRATION = "registration";
	static final String ADMIN_HOME = "admin/home";
	/** Login Ends **/

	/** Dashboard Starts **/
	static final String DASHBOARD_INDEX = "dashboard/index";
	/** Dashboard Ends **/

	/** Admin User Rights Starts **/
	static final String ENTITY_VIEW = "/admin/entity";
	static final String REDIRECT_ENTITY_VIEW = "redirect:/admin/entity";

	static final String ROLE_VIEW = "/admin/role";
	static final String REDIRECT_ROLE_VIEW = "redirect:/admin/role";
	/** Admin Rights Ends **/

	/** App User Rights Starts **/
	/** App User Rights Ends **/

	/** Demo User Rights Starts **/
	/** Demo User Rights Ends **/

}
