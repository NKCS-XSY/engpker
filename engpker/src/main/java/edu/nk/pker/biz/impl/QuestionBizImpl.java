/**
 * 
 */
package edu.nk.pker.biz.impl;

import java.util.List;

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
	final static QuestionHome questionHome=new QuestionHome();
	public boolean add(Question question) {
		// TODO Auto-generated method stub
		try{
			questionHome.add(question);
			return true;
		}
		catch(RuntimeException re) {
			return false;
		}
		
	}

	public List<Question> getRandomQuestions(int number) {
		// TODO Auto-generated method stub
		
		return questionHome.getRandomQuestions(number);
	}

}
