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

import java.util.List;
import java.util.Arrays;

/**
 * Servlet implementation class AddQuestionsServlet
 * �������
 */
@WebServlet("/AddQuestionsServlet")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		System.out.println("[PublishServlet] ���÷��������ܿͻ����ϴ��ļ���λ���ǣ�"
				+ fileUploadPath);
		// 1-2�����÷�������ʱ��������λ�ã���ʱ������ļ��У�
		File fileUploadTempPath = new File(this.getServletContext()
				.getRealPath("/tempDir"));
		if (!fileUploadTempPath.exists()) {
			// ����һ��ȫ�µ�
			fileUploadTempPath.mkdir();
		}
		System.out.println("[PublishServlet] ���÷��������ܿͻ����ϴ��ļ�����ʱλ���ǣ�"
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
			System.out.println("[PublishServlet] ��ʼ�����������ܿͻ����ϴ��ļ�����ʱλ����ϣ�");

			// ����4�������ͻ��˱����ϴ�������
			// 4-1:����һ��ServletFileUpload������ɶԶ����Ʊ����ݵĽ�������ʵ�ַ������ϴ�����
			ServletFileUpload sfu = new ServletFileUpload(factory);
			try {
				// ����ʵ�������
				
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
							System.out.println("[PublishServlet] �������ļ��������ϴ���");
							return;
						}
						System.out.println("[PublishServlet] ��ȡ�ϴ��ļ�������Ϊ: "
								+ fileName);
						// 4-4:��װ�ϴ��ļ�����д�뵽������
						File saveFile = new File(fileUploadPath, fileName);
						fileItem.write(saveFile);			
					}
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
			System.out.println("�ͻ��˱��������ϴ�Ҫ��");
		}
	}
	// �Զ��巽������ϴ��ļ����Ƶ��Զ�����
	private synchronized String generateUnqieName() {
		return String.valueOf(System.nanoTime());
	}

}
