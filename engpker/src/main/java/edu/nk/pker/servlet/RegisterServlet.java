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
		System.out.println("[SingleFileUploadServlet] 设置服务器接受客户端上传文件的位置是："
				+ fileUploadPath);
		// 1-2：设置服务器临时缓冲区的位置（临时缓冲的文件夹）
		File fileUploadTempPath = new File(this.getServletContext()
				.getRealPath("/tempDir"));
		if (!fileUploadTempPath.exists()) {
			// 创建一个全新的
			fileUploadTempPath.mkdir();
		}
		System.out.println("[SingleFileUploadServlet] 设置服务器接受客户端上传文件的临时位置是："
				+ fileUploadTempPath.getPath());

		// 步骤2：判断表单是否符合上传要求
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				if (isMultipart) {
					// 步骤3：设置文件上传缓冲区对象
					DiskFileItemFactory factory = new DiskFileItemFactory();
					// 3-1:缓冲区对象与磁盘物理位置的绑定
					factory.setRepository(fileUploadTempPath);
					// 3-2：设置缓冲区对象的大小（4*1024 字节）
					factory.setSizeThreshold(4 * 1024);
					System.out
							.println("[SingleFileUploadServlet] 初始化服务器接受客户端上传文件的临时位置完毕！");

					// 步骤4：解析客户端表单待上传的数据
					// 4-1:创建一个ServletFileUpload对象完成对二进制表单数据的解析，并实现服务器上传功能
					ServletFileUpload sfu = new ServletFileUpload(factory);

					try {
						// ★★特别注意★★ 在循环遍历表单数据之前创建实体类对象
						User user = new User();
						String user_pwd1="";
						String year="";
						String month="";
						String day="";
						
						
						

						// 4-2:将解析到的二进制文件封装到FileItem的对象中
						@SuppressWarnings("unchecked")
						List<FileItem> fileItems = sfu.parseRequest(request);
						for (FileItem fileItem : fileItems) {
							// 扩展3：判断当前解析的请求数据是否为普通表单数据
							if (fileItem.isFormField()) {
								// 获取客户端表单输入元素的name属性的值
								String name = fileItem.getFieldName().trim();
								// 判断数据为哪个字段数据
								if ("username".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user.setUsername(value);
									System.out.println("测试-注册账号：> " + value);
								}
								if ("password".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user.setPassword(value);;
									System.out.println("测试-注册密码：> " + value);
								}
								if ("user_pwd1".equalsIgnoreCase(name)) {
									String value = fileItem.getString();
									value = new String(value.getBytes("iso8859-1"),
											"UTF-8");
									user_pwd1=value;
									System.out.println("测试-用户密码：> " + value);
								}
							
								
								
								
								
								
								
							} else {
								// 4-3:获取上传文件的名称
								/*String fileName = fileItem.getName().trim();
								// 扩展1：唯一命名
								String fileExtName = fileName.substring(fileName
										.lastIndexOf("."));
								fileName = generateUnqieName() + fileExtName;

								// ★★特别注意★★ 在这个位置为头像属性赋值
								user.setHead_photo(fileName);

								// 扩展2：限制上传文件类型
								String[] allowedTypes = new String[] { ".jpg", ".jpeg",
										".png", ".bmp" };
								Arrays.sort(allowedTypes);
								int searchIndex = Arrays.binarySearch(allowedTypes,
										fileExtName);
								if (searchIndex < 0) {
									System.out
											.println("[SingleFileUploadServlet] 该类型文件不允许上传！");
									return;
								}

								System.out
										.println("[SingleFileUploadServlet] 获取上传文件的名称为: "
												+ fileName);
								// 4-4:封装上传文件对象并写入到服务器
								File saveFile = new File(fileUploadPath, fileName);
								fileItem.write(saveFile);
								System.out.println("[SingleFileUploadServlet] 上传文件成功！");
							}*/
						}
						// 调用Biz层的方法完成注册功能
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
						// 根据返回值结果进行页面跳转
						if (flag) {
							// 跳转至登录页面
							request.setAttribute("username", user.getUsername());
							RequestDispatcher dispatcher = request
									.getRequestDispatcher("login.jsp");
							dispatcher.forward(request, response);
						} else {
							System.out.println("注册失败！！！！！");
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
				System.out.println("客户端表单不符合上传要求！");
			}
		}

		// 自定义方法完成上传文件名称的自动生成
		private synchronized String generateUnqieName() {
			return String.valueOf(System.nanoTime());
				
		}
}


