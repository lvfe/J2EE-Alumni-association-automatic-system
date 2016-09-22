/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.alumni.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.alumni.struts.dao.ReverseDAO;
import com.alumni.struts.form.ReverseForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-14-2013
 * 
 * XDoclet definition:
 * @struts.action path="/reverse" name="reverseForm" input="/form/reverse.jsp" scope="request" validate="true"
 */
public class ReverseAction extends Action {
	/*
	 * Generated Methods
	 */
	
	private ReverseDAO replyDao;
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
		String action=request.getParameter("action");
		if("addReply".equals(action)){
			return addReply(mapping,form,request,response);
		}else if("delReply".equals(action)){
			return delReply(mapping,form,request,response);
		}else if("queryReply".equals(action)){
		return queryReply(mapping,form,request,response);
		}else return mapping.findForward("error");
	}

	private ActionForward delReply(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt((String) request.getAttribute("id"));
		boolean flag=false;
		flag=replyDao.delReply(id);
		if(flag)
		return mapping.findForward("delReply");
		else {
			request.setAttribute("error", "ɾ��ʧ�ܣ�");
			return mapping.findForward("error");
		}
	}

	public ReverseAction() {
		super();
		this.replyDao = new ReverseDAO();
	}

	private ActionForward addReply(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ReverseForm reply=(ReverseForm)form;
		int mid=Integer.parseInt(request.getParameter("mid").trim());
		int pid=Integer.parseInt(request.getParameter("pid").trim());
		reply.setMid(mid);
		reply.setPid(pid);
		System.out.print(reply.getMid());
		boolean flag=false;
		flag=replyDao.addReply(reply);
		if(flag) {
			HttpSession session = request.getSession();
			session.setAttribute("mid", String.valueOf(mid));
			return mapping.findForward("addReply");
		}
		else {
			request.setAttribute("error","添加失败" );
			return mapping.findForward("error");
		}
	}
	@SuppressWarnings("unused")
	private ActionForward queryReply(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("wqe");
		HttpSession session = request.getSession();
		String str=(String) session.getAttribute("mid");
		System.out.println(str);
		int messageid=Integer.parseInt(str);
		request.setAttribute("MessageId",str);
		System.out.println(messageid+"3333333");
		request.setAttribute("queryReply", replyDao.queryReplyMessage(messageid));
		if(messageid!=0) return mapping.findForward("queryReply");
		else {
			request.setAttribute("error","回复失败" );
			return mapping.findForward("error");
		}
	}
}