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
 * 添加试题
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
		// 步骤1：设置上传文件的参数
		// 1-1：设置服务器接受上传文件的位置（服务器的文件夹）
		String fileUploadPath = this.getServletContext().getRealPath(
				"/resources/images");
		log.info("设置服务器接受客户端上传文件的位置是："
				+ fileUploadPath);
		// 1-2：设置服务器临时缓冲区的位置（临时缓冲的文件夹）
		File fileUploadTempPath = new File(this.getServletContext()
				.getRealPath("/tempDir"));
		if (!fileUploadTempPath.exists()) {
			// 创建一个全新的
			fileUploadTempPath.mkdir();
		}
		log.info("设置服务器接受客户端上传文件的临时位置是："
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
			log.info("初始化服务器接受客户端上传文件的临时位置完毕！");

			// 步骤4：解析客户端表单待上传的数据
			// 4-1:创建一个ServletFileUpload对象完成对二进制表单数据的解析，并实现服务器上传功能
			ServletFileUpload sfu = new ServletFileUpload(factory);
			try {
				// 创建实体类对象
				Question question= new Question();
				
				// 4-2:将解析到的二进制文件封装到FileItem的对象中
				@SuppressWarnings("unchecked")
				List<FileItem> fileItems = sfu.parseRequest(request);
				//测试
				//System.out.println(fileItems.size());
				for (FileItem fileItem : fileItems) {
					// System.out.println(fileItem.toString());
					// 扩展3：判断当前解析的请求数据是否为普通表单数据
					if (fileItem.isFormField()) {
						// 获取客户端表单输入元素的name属性的值
						String name = fileItem.getFieldName().trim();
						// 判断数据为哪个字段数据
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
						System.out.println("文件：>");
						// 4-3:获取上传文件的名称
						String fileName = fileItem.getName().trim();
						// 扩展1：唯一命名
						String fileExtName = fileName.substring(fileName
								.lastIndexOf("."));
						fileName = generateUnqieName() + fileExtName;
						// 扩展2：限制上传文件类型
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
							log.debug("该类型文件不允许上传！");
							return;
						}
						log.info("获取上传文件的名称为: "+ fileName);
						// 4-4:封装上传文件对象并写入到服务器
						File saveFile = new File(fileUploadPath, fileName);
						fileItem.write(saveFile);			
					}
				}
				IQuestionBiz questionBiz=new QuestionBizImpl();
				question.setCreateTime(new Date());
				question.setLastModify(new Date());
				if(questionBiz.add(question)){
					log.debug("试题添加成功");
					RequestDispatcher dispatcher = request
						.getRequestDispatcher("/jsp/questionList.jsp");
				dispatcher.include(request, response);
				}else{
					log.debug("试题添加失败");
				}
				// 调用Biz层将Resource对象存入数据库
//						IResourceBiz resBiz = new ResourceBizImpl();	
//						if (resBiz.add(res)) {
//							// 测试封装对象
//							//获取资源的ID
//						    work.setRid(resBiz.findByPath(res.getPath()).getRid());
//						    HttpSession session = request.getSession(); // 获取session对象
//						    User user =(User)session.getAttribute("user");
//							work.setUid(user.getUid());
//							work.setPublishtime(new Date());
//							// 调用Biz层的方法完成发布功能
//							IWorkBiz workBiz = new WorkBizImpl();
//							// 验证该用户是否已经发布过同一名称的作品
//							if(workBiz.findByObject(user.getUid(), work.getWorkname())!=null){
//								// 该用户已经存在同名作品
//								int msgcode=101;
//								request.setAttribute("msgcode", msgcode);
//								RequestDispatcher dispatcher = request
//										.getRequestDispatcher("jsp/publish.jsp");
//								dispatcher.forward(request, response);
//								System.out.println("发布失败！！！！！");
//							}
//							// 根据返回值结果进行页面跳转
//							if (workBiz.add(work)) {
//								// 作品添加成功，跳转至作品页面
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
//								System.out.println("作品添加失败！！！！！");
//							}
//						} else {
//							//图片上传错误
//							int msgcode=103;
//							request.setAttribute("msgcode", msgcode);
//							RequestDispatcher dispatcher = request
//									.getRequestDispatcher("jsp/publish.jsp");
//							dispatcher.forward(request, response);
//							System.out.println("图片上传错误！！！！！");
//						}

			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			log.info("客户端表单不符合上传要求！");
		}
	}
	// 自定义方法完成上传文件名称的自动生成
	private synchronized String generateUnqieName() {
		return String.valueOf(System.nanoTime());
	}

}
