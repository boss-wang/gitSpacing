package cn.dtw.web.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.dtw.entity.Leavemessage;
import cn.dtw.service.LeaveMessageService;
import cn.dtw.service.impl.LeaveMessageServiceImpl;

@WebServlet("/leavamassage.do")
public class LeaveMessageServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private LeaveMessageService lms = new LeaveMessageServiceImpl();
	
	public void addLeaveMessage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("name");
		String phoneNum = req.getParameter("phoneNum");
		String message = req.getParameter("message");
		Leavemessage lm = new Leavemessage();
		lm.setName(name);
		lm.setPhoneNum(phoneNum);
		lm.setMessage(message);
		int rs = lms.addMessage(lm);
		resp.getWriter().print(rs);
	}
	//删除留言
	protected void delLeaveMessage(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String messid=req.getParameter("messid");
		Leavemessage message = new Leavemessage();
		message.setId(Integer.parseInt(messid));
		int back= lms.delMessageByid(message);
		resp.getWriter().print(back);
	}
}
