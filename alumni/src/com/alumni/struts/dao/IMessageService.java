package com.alumni.struts.dao;

import java.util.List;

import com.alumni.struts.form.Message;


public interface IMessageService {
	public int messageIdMax();
	Message findById(int id);
	int saveMessage(Message message);
	List<Message> listMessage();
	boolean delMessage(int id);
	boolean updateMessage(Message message);
}
