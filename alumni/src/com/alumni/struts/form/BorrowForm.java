/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.alumni.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 04-13-2013
 * 
 * XDoclet definition:
 * @struts.form name="borrowForm"
 */
@SuppressWarnings("serial")
public class BorrowForm extends ActionForm {
	/*
	 * Generated fields
	 */
	/** status property */
	private Integer status;
	/** id property */
	private Integer id;

	/** end_date property */
	private String end_date;

	/** start_date property */
	private String start_date;

	/** name property */
	private String name;

	/** eid property */
	private Integer eid;
	/** eusage property */
	private String eusage;
	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the id.
	 * @return Integer
	 */
	public Integer getId() {
		return id;
	}

	/** 
	 * Set the id.
	 * @param id The id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/** 
	 * Returns the end_date.
	 * @return String
	 */
	public String getEnd_date() {
		return end_date;
	}

	/** 
	 * Set the end_date.
	 * @param end_date The end_date to set
	 */
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	/** 
	 * Returns the start_date.
	 * @return String
	 */
	public String getStart_date() {
		return start_date;
	}

	/** 
	 * Set the start_date.
	 * @param start_date The start_date to set
	 */
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public Integer getEid() {
		return eid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setEusage(String eusage) {
		this.eusage = eusage;
	}

	public String getEusage() {
		return eusage;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStatus() {
		return status;
	}
}