package com.alumni.struts.dao;

import java.util.List;

import com.alumni.struts.form.Message;

public class MessageServiceImpl implements IMessageService{
	MessageDAO dao= new MessageDAO();
	public boolean delMessage(int id) {
		// TODO Auto-generated method stub
		return dao.delMessage(id);
	}

	public Message findById(int id) {
		return dao.findByID(id);
	}

	public List<Message> listMessage() {
		return dao.listMessage();
	}

	public int saveMessage(Message message) {
		return dao.saveMessage(message);
	}

	public boolean updateMessage(Message message) {
		return dao.updateMessage(message);
		
	}

	public int messageIdMax() {
		return dao.messageIdMax();
	}

}
