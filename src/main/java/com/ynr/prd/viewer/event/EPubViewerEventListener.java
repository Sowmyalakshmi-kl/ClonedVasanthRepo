package com.ynr.prd.viewer.event;

import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class EPubViewerEventListener {
	
	@Async
	@EventListener
	public void handleUserEvent(EPubViewerEvent ePubViewerEvent) {
		System.err.println("UserEventListener ===>"+ePubViewerEvent);
		
	}
}
