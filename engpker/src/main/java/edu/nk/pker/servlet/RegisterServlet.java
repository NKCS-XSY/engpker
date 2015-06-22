package edu.nk.pker.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import edu.nk.pker.biz.IUserBiz;
import edu.nk.pker.biz.impl.UserBizImpl;
import edu.nk.pker.model.po.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileUploadPath = this.getServletContext().getRealPath(
				"/upload/file");
		System.out.println("[SingleFileUploadServlet] ���÷��������ܿͻ����ϴ��ļ���λ���ǣ�"
				+ fileUploadPath);
		// 1-2�����÷�������ʱ��������λ�ã���ʱ������ļ��У�
		File fileUploadTempPath = new File(this.getServletContext()
				.getRealPath("/tempDir"));
		if (!fileUploadTempPath.exists()) {
			// ����һ��ȫ�µ�
			fileUploadTempPath.mkdir();
		}
		System.out.println("[SingleFileUploadServlet] ���÷��������ܿͻ����ϴ��ļ�����ʱλ���ǣ�"
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
					System.out
							.println("[SingleFileUploadServlet] ��ʼ�����������ܿͻ����ϴ��ļ�����ʱλ����ϣ�");

					// ����4�������ͻ��˱����ϴ�������
					// 4-1:����һ��ServletFileUpload������ɶԶ����Ʊ����ݵĽ�������ʵ�ַ������ϴ�����
					ServletFileUpload sfu = new ServletFileUpload(factory);

					try {
						// ����ر�ע���� ��ѭ������������֮ǰ����ʵ�������
						User user = new User();
						String user_pwd1="";
						String year="";
						String month="";
						String day="";
						
						
						

						// 4-2:���������Ķ������ļ���װ��FileItem�Ķ�����
						@SuppressWarnings("unchecked")
						List<FileItem> fileItems = sfu.parseRequest(request);
						for (FileItem fileItem : fileItems) {
							// ��չ3���жϵ�ǰ���������������Ƿ�Ϊ��ͨ������
							if (fileItem.isFormField()) {
								// ��ȡ�ͻ��˱�����Ԫ�ص�name���Ե�ֵ
								String name = fileItem.getFieldName().trim();
								// �ж�����Ϊ�ĸ��ֶ�����
								if ("username".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user.setUsername(value);
									System.out.println("����-ע���˺ţ�> " + value);
								}
								if ("password".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user.setPassword(value);;
									System.out.println("����-ע�����룺> " + value);
								}
								if ("user_pwd1".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user_pwd1=value;
									System.out.println("����-�û����룺> " + value);
								}
							
								
								
								
								
								
								
							} else {
								// 4-3:��ȡ�ϴ��ļ�������
								/*String fileName = fileItem.getName().trim();
								// ��չ1��Ψһ����
								String fileExtName = fileName.substring(fileName
										.lastIndexOf("."));
								fileName = generateUnqieName() + fileExtName;

								// ����ر�ע���� �����λ��Ϊͷ�����Ը�ֵ
								user.setHead_photo(fileName);

								// ��չ2�������ϴ��ļ�����
								String[] allowedTypes = new String[] { ".jpg", ".jpeg",
										".png", ".bmp" };
								Arrays.sort(allowedTypes);
								int searchIndex = Arrays.binarySearch(allowedTypes,
										fileExtName);
								if (searchIndex < 0) {
									System.out
											.println("[SingleFileUploadServlet] �������ļ��������ϴ���");
									return;
								}

								System.out
										.println("[SingleFileUploadServlet] ��ȡ�ϴ��ļ�������Ϊ: "
												+ fileName);
								// 4-4:��װ�ϴ��ļ�����д�뵽������
								File saveFile = new File(fileUploadPath, fileName);
								fileItem.write(saveFile);
								System.out.println("[SingleFileUploadServlet] �ϴ��ļ��ɹ���");
							}*/
						}
						// ����Biz��ķ������ע�Ṧ��
						IUserBiz userinfoBiz=new UserBizImpl();
						user.setRegistertime(new Date());
						boolean flag1 =  userinfoBiz.add(user);
						System.out.println(flag1);
						
						boolean flag2 = false;
						if(user.getPassword().equals(user_pwd1))
							flag2=true;
						System.out.println(flag2);
						//boolean flag3=userdynamicinfoBiz.add(userdynamicinfo);
						//System.out.println(flag3);
						boolean flag=flag1&&flag2;
						// ���ݷ���ֵ�������ҳ����ת
						if (flag) {
							// ��ת����¼ҳ��
							request.setAttribute("username", user.getUsername());
							RequestDispatcher dispatcher = request
									.getRequestDispatcher("login.jsp");
							dispatcher.forward(request, response);
						} else {
							System.out.println("ע��ʧ�ܣ���������");
						}
					}
						

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


