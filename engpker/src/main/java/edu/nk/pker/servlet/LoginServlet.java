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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.nk.pker.biz.IUserBiz;
import edu.nk.pker.biz.impl.UserBizImpl;
import edu.nk.pker.model.po.User;

/**
 * Servlet implementation class Login
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log = LogFactory.getLog(LoginServlet.class);
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
		// 获取客户端传入的数据
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		// 单点登录验证
		// 获取全局Application级别的用户在线列表
		@SuppressWarnings("unchecked")
		List<String> usersOnLineList = (List<String>) this.getServletContext().getAttribute("usersOnLineList");
		if(usersOnLineList == null){
			usersOnLineList = new ArrayList<String>();
		}
		
		log.info("username:"+username+", password:"+password);
		
		// 判断当前登录用户是否存在于该在线列表中
		boolean singleLoginFlag;
		if(usersOnLineList.contains(username)){
			singleLoginFlag = true;
		}else{
			singleLoginFlag = false;			
		}
		
		if(!singleLoginFlag){
			// 调用Biz层实现数据库验证
			IUserBiz userBiz = new UserBizImpl();
			User user = userBiz.isLogin(username, password);
			// 响应客户端		
			int msgcode = (user == null ? 101 : 102);
			String url = "";
			switch (msgcode) {
			case 101:
				log.info("username:"+username+", password:"+password+" 登录失败");
				url = "/engpker/jsp/login.jsp";
				request.setAttribute("msgcode", msgcode);
				break;
			case 102:
				log.info("username:"+username+", password:"+password+" 登录成功");
				url = "/engpker/jsp/profile.jsp";
				HttpSession session = request.getSession(); // 获取session对象
				// 将登录的用户添加到在线列表中
				usersOnLineList.add(user.getUsername());
				// 刷新在线用户列表
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
