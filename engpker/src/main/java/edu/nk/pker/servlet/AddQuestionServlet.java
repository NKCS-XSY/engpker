package edu.nk.pker.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.nk.pker.biz.IQuestionBiz;
import edu.nk.pker.biz.impl.QuestionBizImpl;
import edu.nk.pker.model.po.Category;
import edu.nk.pker.model.po.Question;
import edu.nk.pker.model.po.QuestionType;

import java.util.Date;
import java.util.List;
import java.util.Arrays;

/**
 * Servlet implementation class AddQuestionsServlet
 * �������
 */
@WebServlet("/AddQuestionsServlet")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Log log=LogFactory.getLog(AddQuestionServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionServlet() {
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
		// ����1�������ϴ��ļ��Ĳ���
		// 1-1�����÷����������ϴ��ļ���λ�ã����������ļ��У�
		String fileUploadPath = this.getServletContext().getRealPath(
				"/resources/images");
		log.info("���÷��������ܿͻ����ϴ��ļ���λ���ǣ�"
				+ fileUploadPath);
		// 1-2�����÷�������ʱ��������λ�ã���ʱ������ļ��У�
		File fileUploadTempPath = new File(this.getServletContext()
				.getRealPath("/tempDir"));
		if (!fileUploadTempPath.exists()) {
			// ����һ��ȫ�µ�
			fileUploadTempPath.mkdir();
		}
		log.info("���÷��������ܿͻ����ϴ��ļ�����ʱλ���ǣ�"
				+ fileUploadTempPath.getPath());

		// ����2���жϱ��Ƿ�����ϴ�Ҫ��
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			// ����3�������ļ��ϴ�����������
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 3-1:�������������������λ�õİ�
			factory.setRepository(fileUploadTempPath);
			// 3-2�����û���������Ĵ�С��4*1024 �ֽڣ�
			factory.setSizeThreshold(4 * 1024);
			log.info("��ʼ�����������ܿͻ����ϴ��ļ�����ʱλ����ϣ�");

			// ����4�������ͻ��˱����ϴ�������
			// 4-1:����һ��ServletFileUpload������ɶԶ����Ʊ����ݵĽ�������ʵ�ַ������ϴ�����
			ServletFileUpload sfu = new ServletFileUpload(factory);
			try {
				// ����ʵ�������
				Question question= new Question();
				
				// 4-2:���������Ķ������ļ���װ��FileItem�Ķ�����
				@SuppressWarnings("unchecked")
				List<FileItem> fileItems = sfu.parseRequest(request);
				//����
				//System.out.println(fileItems.size());
				for (FileItem fileItem : fileItems) {
					// System.out.println(fileItem.toString());
					// ��չ3���жϵ�ǰ���������������Ƿ�Ϊ��ͨ������
					if (fileItem.isFormField()) {
						// ��ȡ�ͻ��˱�����Ԫ�ص�name���Ե�ֵ
						String name = fileItem.getFieldName().trim();
						// �ж�����Ϊ�ĸ��ֶ�����
						if ("name".equalsIgnoreCase(name)) {
							String value = fileItem.getString();
							value = new String(value.getBytes("iso8859-1"),
									"UTF-8");
							question.setName(value);
							log.info("Question.name: "+value);
							
						}
						 else if ("category".equalsIgnoreCase(name)) {
								String value = fileItem.getString();
								value = new String(value.getBytes("iso8859-1"),
										"UTF-8");
								Category category=new Category();
								category.setId(Integer.parseInt(value));
								question.setCategory(category);
								log.info("Question.Category:  " + value);
							} else if ("type".equalsIgnoreCase(name)) {
								String value = fileItem.getString();
								value = new String(value.getBytes("iso8859-1"),
										"UTF-8");
								QuestionType questionType =new QuestionType();
								questionType.setId(Integer.parseInt(value));
								question.setQuestionType(questionType);
							    log.info("Question.QuestionType:  " + value);
							}else if("content".equalsIgnoreCase(name)) {
								String value = fileItem.getString();
								value = new String(value.getBytes("iso8859-1"),
										"UTF-8");
								question.setContent(value);
							    log.info("Question.Content:  " + value);
							}else if("answer".equalsIgnoreCase(name)) {
								String value = fileItem.getString();
								value = new String(value.getBytes("iso8859-1"),
										"UTF-8");
								question.setAnalysis(value);
							    log.info("Question.AnswerId:  " + value);
							}
					} else {
						System.out.println("�ļ���>");
						// 4-3:��ȡ�ϴ��ļ�������
						String fileName = fileItem.getName().trim();
						// ��չ1��Ψһ����
						String fileExtName = fileName.substring(fileName
								.lastIndexOf("."));
						fileName = generateUnqieName() + fileExtName;
						// ��չ2�������ϴ��ļ�����
						String[] allowedTypes = new String[] { ".jpg", ".jpeg",
								".png", ".bmp" };
						Arrays.sort(allowedTypes);
						int searchIndex = Arrays.binarySearch(allowedTypes,
								fileExtName);
						if (searchIndex < 0) {
							int msgcode = 100;
							request.setAttribute("msgcode", msgcode);
							RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/publish.jsp");
							dispatcher.forward(request, response);
							log.debug("�������ļ��������ϴ���");
							return;
						}
						log.info("��ȡ�ϴ��ļ�������Ϊ: "+ fileName);
						// 4-4:��װ�ϴ��ļ�����д�뵽������
						File saveFile = new File(fileUploadPath, fileName);
						fileItem.write(saveFile);			
					}
				}
				IQuestionBiz questionBiz=new QuestionBizImpl();
				question.setCreateTime(new Date());
				question.setLastModify(new Date());
				if(questionBiz.add(question)){
					log.debug("������ӳɹ�");
					RequestDispatcher dispatcher = request
						.getRequestDispatcher("/jsp/questionList.jsp");
				dispatcher.include(request, response);
				}else{
					log.debug("�������ʧ��");
				}
				// ����Biz�㽫Resource����������ݿ�
//						IResourceBiz resBiz = new ResourceBizImpl();	
//						if (resBiz.add(res)) {
//							// ���Է�װ����
//							//��ȡ��Դ��ID
//						    work.setRid(resBiz.findByPath(res.getPath()).getRid());
//						    HttpSession session = request.getSession(); // ��ȡsession����
//						    User user =(User)session.getAttribute("user");
//							work.setUid(user.getUid());
//							work.setPublishtime(new Date());
//							// ����Biz��ķ�����ɷ�������
//							IWorkBiz workBiz = new WorkBizImpl();
//							// ��֤���û��Ƿ��Ѿ�������ͬһ���Ƶ���Ʒ
//							if(workBiz.findByObject(user.getUid(), work.getWorkname())!=null){
//								// ���û��Ѿ�����ͬ����Ʒ
//								int msgcode=101;
//								request.setAttribute("msgcode", msgcode);
//								RequestDispatcher dispatcher = request
//										.getRequestDispatcher("jsp/publish.jsp");
//								dispatcher.forward(request, response);
//								System.out.println("����ʧ�ܣ���������");
//							}
//							// ���ݷ���ֵ�������ҳ����ת
//							if (workBiz.add(work)) {
//								// ��Ʒ��ӳɹ�����ת����Ʒҳ��
//								int wid=workBiz.findByObject(user.getUid(), work.getWorkname()).getWid();
//							    //request.setAttribute("wid",wid );
//							    
////								RequestDispatcher dispatcher = request
////										.getRequestDispatcher("jsp/work.jsp?wid="+wid);
////								dispatcher.forward(request, response);
//								response.setContentType("text/html;charset=UTF-8");
//								response.sendRedirect("jsp/work.jsp?wid="+wid);
//							} else {
//								//
//								int msgcode=102;
//								request.setAttribute("msgcode", msgcode);
//								RequestDispatcher dispatcher = request
//										.getRequestDispatcher("jsp/publish.jsp");
//								dispatcher.forward(request, response);
//								System.out.println("��Ʒ���ʧ�ܣ���������");
//							}
//						} else {
//							//ͼƬ�ϴ�����
//							int msgcode=103;
//							request.setAttribute("msgcode", msgcode);
//							RequestDispatcher dispatcher = request
//									.getRequestDispatcher("jsp/publish.jsp");
//							dispatcher.forward(request, response);
//							System.out.println("ͼƬ�ϴ����󣡣�������");
//						}

			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			log.info("�ͻ��˱��������ϴ�Ҫ��");
		}
	}
	// �Զ��巽������ϴ��ļ����Ƶ��Զ�����
	private synchronized String generateUnqieName() {
		return String.valueOf(System.nanoTime());
	}

}
