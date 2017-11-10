package com.ynr.prd.viewer.event;

import org.springframework.context.ApplicationEvent;


public class EPubViewerEvent extends ApplicationEvent{

	 /**
	 * 
	 */
	private static final long serialVersionUID = -5441457607572039079L;

	    /**
	     * Create a new ApplicationEvent.
	     *
	     * @param source the object on which the event initially occurred (never {@code null})
	     */
	    public EPubViewerEvent(Object source) {
	        super(source);
	    }
}
