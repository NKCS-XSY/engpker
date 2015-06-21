/**
 * 
 */
package edu.nk.pker.biz.impl;

import edu.nk.pker.biz.IQuestionBiz;
import edu.nk.pker.model.dao.QuestionHome;
import edu.nk.pker.model.po.Question;

/**
 * @author gy
 *
 */
public class QuestionBizImpl implements IQuestionBiz {

	/* (non-Javadoc)
	 * @see edu.nk.pker.biz.IQuestionBiz#add(edu.nk.pker.model.po.Question)
	 */
	public boolean add(Question question) {
		// TODO Auto-generated method stub
		QuestionHome questionHome=new QuestionHome();
		try{
			questionHome.add(question);
			return true;
		}
		catch(RuntimeException re) {
			return false;
		}
		
	}

}
