package edu.nk.pker.model.po;

// Generated 2015-5-20 10:08:13 by Hibernate Tools 4.3.1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Tag generated by hbm2java
 */
@Entity
@Table(name = "tag", catalog = "pker")
public class Tag implements java.io.Serializable {

	private Integer tagId;
	private String tagName;
	private Date createTime;
	private int creator;
	private boolean isPrivate;
	private String memo;
	private Set<QuestionTag> questionTags = new HashSet<QuestionTag>(0);

	public Tag() {
	}

	public Tag(String tagName, Date createTime, int creator, boolean isPrivate) {
		this.tagName = tagName;
		this.createTime = createTime;
		this.creator = creator;
		this.isPrivate = isPrivate;
	}

	public Tag(String tagName, Date createTime, int creator, boolean isPrivate,
			String memo, Set<QuestionTag> questionTags) {
		this.tagName = tagName;
		this.createTime = createTime;
		this.creator = creator;
		this.isPrivate = isPrivate;
		this.memo = memo;
		this.questionTags = questionTags;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "tag_id", unique = true, nullable = false)
	public Integer getTagId() {
		return this.tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	@Column(name = "tag_name", nullable = false, length = 100)
	public String getTagName() {
		return this.tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", nullable = false, length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "creator", nullable = false)
	public int getCreator() {
		return this.creator;
	}

	public void setCreator(int creator) {
		this.creator = creator;
	}

	@Column(name = "is_private", nullable = false)
	public boolean isIsPrivate() {
		return this.isPrivate;
	}

	public void setIsPrivate(boolean isPrivate) {
		this.isPrivate = isPrivate;
	}

	@Column(name = "memo", length = 500)
	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tag")
	public Set<QuestionTag> getQuestionTags() {
		return this.questionTags;
	}

	public void setQuestionTags(Set<QuestionTag> questionTags) {
		this.questionTags = questionTags;
	}

}