package com.ynr.prd.viewer.service.impl;

public class CustomEvents {

	/**
	 * @return the customEventId
	 */
	public int getCustomEventId() {
		return customEventId;
	}
	/**
	 * @return the customEventName
	 */
	public String getCustomEventName() {
		return customEventName;
	}
	/**
	 * @param customEventId the customEventId to set
	 */
	public void setCustomEventId(int customEventId) {
		this.customEventId = customEventId;
	}
	/**
	 * @param customEventName the customEventName to set
	 */
	public void setCustomEventName(String customEventName) {
		this.customEventName = customEventName;
	}
	private int customEventId;
	private String customEventName;
	
}
