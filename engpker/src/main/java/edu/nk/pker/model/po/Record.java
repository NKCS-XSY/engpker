package edu.nk.pker.model.po;

// Generated 2015-5-20 10:08:13 by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Record generated by hbm2java
 */
@Entity
@Table(name = "record", catalog = "pker")
public class Record implements java.io.Serializable {

	private Integer recordId;
	private Choice choice;
	private Paper paper;
	private Question question;
	private User user;
	private Boolean mark;
	private int duration;
	private String remark;

	public Record() {
	}

	public Record(Question question, User user, int duration) {
		this.question = question;
		this.user = user;
		this.duration = duration;
	}

	public Record(Choice choice, Paper paper, Question question, User user,
			Boolean mark, int duration, String remark) {
		this.choice = choice;
		this.paper = paper;
		this.question = question;
		this.user = user;
		this.mark = mark;
		this.duration = duration;
		this.remark = remark;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "record_id", unique = true, nullable = false)
	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_answer_id")
	public Choice getChoice() {
		return this.choice;
	}

	public void setChoice(Choice choice) {
		this.choice = choice;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "paper_id")
	public Paper getPaper() {
		return this.paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "question_id", nullable = false)
	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "mark")
	public Boolean getMark() {
		return this.mark;
	}

	public void setMark(Boolean mark) {
		this.mark = mark;
	}

	@Column(name = "duration", nullable = false)
	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "remark", length = 100)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}