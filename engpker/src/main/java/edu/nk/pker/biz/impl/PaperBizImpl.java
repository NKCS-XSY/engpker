/**
 * 
 */
package edu.nk.pker.biz.impl;

import edu.nk.pker.biz.IPaperBiz;
import edu.nk.pker.model.dao.PaperHome;
import edu.nk.pker.model.po.Paper;

/**
 * @author gy
 *
 */
public class PaperBizImpl implements IPaperBiz {

	final static PaperHome paperHome=new PaperHome();
	/* (non-Javadoc)
	 * @see edu.nk.pker.biz.IPaperBiz#add(edu.nk.pker.model.po.Paper)
	 */
	public boolean add(Paper paper) {
		// TODO Auto-generated method stub
		try {
			paperHome.add(paper);
			return true;
		}catch(RuntimeException re) {
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see edu.nk.pker.biz.IPaperBiz#upfate(edu.nk.pker.model.po.Paper)
	 */
	public boolean upfate(Paper paper) {
		// TODO Auto-generated method stub
		return false;
	}

}
