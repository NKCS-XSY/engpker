package edu.nk.pker.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.nk.pker.biz.IPaperBiz;
import edu.nk.pker.biz.impl.PaperBizImpl;
import edu.nk.pker.model.po.Paper;

/**
 * Servlet implementation class AddExamPaperServlet
 * ����Ծ�
 */
@WebServlet("/AddExamPaperServlet")
public class AddExamPaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log = LogFactory.getLog(AddExamPaperServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExamPaperServlet() {
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
		// 获取参数
		String papername= request.getParameter("papername");
		Paper paper=new Paper();
		paper.setName(papername);
		IPaperBiz paperBiz = new PaperBizImpl();
		try {
			if(paperBiz.add(paper)) {
				response.sendRedirect("/engpker/jsp/admin/exampaper-edit.jsp");
			}
			
		}catch(RuntimeException re) {
			
		}
		
	}

}
