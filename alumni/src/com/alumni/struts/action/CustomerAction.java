/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.alumni.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.alumni.core.ChStr;
import com.alumni.struts.dao.CustomerDAO;
import com.alumni.struts.form.CustomerForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-08-2013
 * 
 * XDoclet definition:
 * @struts.action path="/customer" name="customerForm" scope="request" validate="true"
 */
public class CustomerAction extends Action {
	private CustomerDAO customerDAO = null;
    private ChStr chStr=new ChStr();
    public CustomerAction() {
        this.customerDAO = new CustomerDAO();
    }	
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
        System.out.println("action:" + action);
        if (action == null || "".equals(action)) {
        	request.setAttribute("error","error");
            return mapping.findForward("error");
        }else if ("customerQuery".equals(action)) {
            return customerQuery(mapping, form, request,response);
		}else if("customerAdd".equals(action)){
			 return customerAdd(mapping, form, request,response);
		}else if("customerDel".equals(action)){
			return customerDel(mapping, form, request,response);
		} else if("customerModifyQ".equals(action)){
                return customerQueryModify(mapping, form, request,response);
        }else if("customerModify".equals(action)){
            return customerModify(mapping, form, request,response);
        }
			request.setAttribute("error", "error");
			return mapping.findForward("error");
	}
	@SuppressWarnings("static-access")
	private ActionForward customerModify(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		CustomerForm customerForm=(CustomerForm) form;
        //�˴���Ҫ��������ת��
        customerForm.setName(chStr.toChinese(customerForm.getName()));
        customerForm.setEmail(chStr.toChinese(customerForm.getEmail()));
        customerForm.setMobileTel(chStr.toChinese(customerForm.getMobileTel()));
        int ret=customerDAO.update(customerForm);
        if(ret==0){
            request.setAttribute("error","error");
            return mapping.findForward("error");
        }else{
            return mapping.findForward("customerModify");
        }
	}
	//�޸Ŀͻ���Ϣ�Ĳ�ѯ
	private ActionForward customerQueryModify(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		request.setAttribute("customerQuery",customerDAO.query(Integer.parseInt(request.getParameter("id"))));
        return mapping.findForward("customerQueryModify");
	}
	private ActionForward customerDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CustomerForm customerForm = (CustomerForm) form;
        customerForm.setID(Integer.parseInt(request.getParameter("id")));
        int ret = customerDAO.delete(customerForm);
        if (ret == 0) {
            request.setAttribute("error","error");
            return mapping.findForward("error");
        } else {
            return mapping.findForward("customerDel");
        }
	}
	@SuppressWarnings("static-access")
	private ActionForward customerAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CustomerForm customerForm = (CustomerForm) form;
        customerForm.setName(chStr.toChinese(customerForm.getName()));
        customerForm.setEmail(chStr.toChinese(customerForm.getEmail()));
        customerForm.setMobileTel(chStr.toChinese(customerForm.getMobileTel()));
        int ret = customerDAO.insert(customerForm);
        System.out.println("ret:"+ret);
        if (ret == 1) {
            return mapping.findForward("customerAdd");
        } else if(ret==2){
            request.setAttribute("error","error");
            return mapping.findForward("error");
        }else {
            request.setAttribute("error","error");
            return mapping.findForward("error");
        }
	}
	private ActionForward customerQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("customerQuery", customerDAO.query(0));
        return mapping.findForward("customerQuery");
	}
}