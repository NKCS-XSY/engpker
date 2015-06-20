package edu.nk.pker.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.nk.pker.biz.IUserBiz;
import edu.nk.pker.biz.impl.UserBizImpl;
import edu.nk.pker.model.dao.UserHome;
import edu.nk.pker.model.po.User;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Servlet implementation class Login
 */
//@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log = LogFactory.getLog(UserHome.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		// ��ȡ�ͻ��˴��������
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		// �����¼��֤
		// ��ȡȫ��Application������û������б�
		@SuppressWarnings("unchecked")
		List<String> usersOnLineList = (List<String>) this.getServletContext().getAttribute("usersOnLineList");
		if(usersOnLineList == null){
			usersOnLineList = new ArrayList<String>();
		}
		
		log.info("username:"+username+", password:"+password);
		
		// �жϵ�ǰ��¼�û��Ƿ�����ڸ������б���
		boolean singleLoginFlag;
		if(usersOnLineList.contains(username)){
			singleLoginFlag = true;
		}else{
			singleLoginFlag = false;			
		}
		
		if(!singleLoginFlag){
			// ����Biz��ʵ�����ݿ���֤
			IUserBiz userBiz = new UserBizImpl();
			User user = userBiz.isLogin(username, password);
			// ��Ӧ�ͻ���		
			int msgcode = (user == null ? 101 : 102);
			String url = "";
			switch (msgcode) {
			case 101:
				log.info("username:"+username+", password:"+password+" ��¼ʧ��");
				url = "/engpker/jsp/login.jsp";
				request.setAttribute("msgcode", msgcode);
				break;
			case 102:
				log.info("username:"+username+", password:"+password+" ��¼�ɹ�");
				url = "/engpker/jsp/profile.jsp";
				HttpSession session = request.getSession(); // ��ȡsession����
				// ����¼���û���ӵ������б���
				usersOnLineList.add(user.getUsername());
				// ˢ�������û��б�
				this.getServletContext().setAttribute("usersOnLineList", usersOnLineList);
				session.setAttribute("user", user);
				break;
			default:
				break;
			}
			response.sendRedirect(url);
			//RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			//dispatcher.forward(request, response);
		}else{
			int msgcode = 103;
			request.setAttribute("msgcode", msgcode);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
