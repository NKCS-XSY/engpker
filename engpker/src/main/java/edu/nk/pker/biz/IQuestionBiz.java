package edu.nk.pker.biz;

import java.util.List;

import edu.nk.pker.model.po.Question;

public interface IQuestionBiz {
	public abstract boolean add(final Question question);
	public abstract List<Question> getRandomQuestions(final int number);
}
