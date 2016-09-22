package com.alumni.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.*;

public class OnLineCountListener implements ServletContextListener,
		HttpSessionListener, HttpSessionAttributeListener {

	private ServletContext application=null;
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	public void contextInitialized(ServletContextEvent arg0) {
		this.application=arg0.getServletContext();
		this.application.setAttribute("alluser", new ArrayList());

	}

	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	public void sessionDestroyed(HttpSessionEvent arg0) {
		List l=(List)this.application.getAttribute("alluser");
		String value=(String)arg0.getSession().getAttribute("username");
		l.remove(value);
		this.application.setAttribute("alluser", l);

	}

	@SuppressWarnings("unchecked")
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		List l=(List)this.application.getAttribute("alluser");
		l.add(arg0.getValue());
		this.application.setAttribute("alluser", l);
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

}
