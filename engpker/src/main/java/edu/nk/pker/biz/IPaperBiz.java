package edu.nk.pker.biz;

import edu.nk.pker.model.po.Paper;

public interface IPaperBiz {
	abstract public Integer add(final Paper paper);
	abstract public boolean upfate(final Paper paper);
}
