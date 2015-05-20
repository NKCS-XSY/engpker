package edu.nk.pker.model.po;

// Generated 2015-5-20 10:08:13 by Hibernate Tools 4.3.1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CompetitionUser generated by hbm2java
 */
@Entity
@Table(name = "competition_user", catalog = "pker")
public class CompetitionUser implements java.io.Serializable {

	private Integer cuid;
	private Competition competition;
	private User user;
	private Date createTime;
	private Date startTime;
	private Date submitTime;
	private String answerSheet;
	private int duration;
	private Integer rightQuestions;
	private Integer wrongQuestions;
	private Integer noanswerQuestions;
	private Double pointGet;

	public CompetitionUser() {
	}

	public CompetitionUser(Competition competition, User user, Date createTime,
			Date startTime, Date submitTime, int duration) {
		this.competition = competition;
		this.user = user;
		this.createTime = createTime;
		this.startTime = startTime;
		this.submitTime = submitTime;
		this.duration = duration;
	}

	public CompetitionUser(Competition competition, User user, Date createTime,
			Date startTime, Date submitTime, String answerSheet, int duration,
			Integer rightQuestions, Integer wrongQuestions,
			Integer noanswerQuestions, Double pointGet) {
		this.competition = competition;
		this.user = user;
		this.createTime = createTime;
		this.startTime = startTime;
		this.submitTime = submitTime;
		this.answerSheet = answerSheet;
		this.duration = duration;
		this.rightQuestions = rightQuestions;
		this.wrongQuestions = wrongQuestions;
		this.noanswerQuestions = noanswerQuestions;
		this.pointGet = pointGet;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "cuid", unique = true, nullable = false)
	public Integer getCuid() {
		return this.cuid;
	}

	public void setCuid(Integer cuid) {
		this.cuid = cuid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "competition_id", nullable = false)
	public Competition getCompetition() {
		return this.competition;
	}

	public void setCompetition(Competition competition) {
		this.competition = competition;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", nullable = false, length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_time", nullable = false, length = 19)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "submit_time", nullable = false, length = 19)
	public Date getSubmitTime() {
		return this.submitTime;
	}

	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}

	@Column(name = "answer_sheet", length = 16777215)
	public String getAnswerSheet() {
		return this.answerSheet;
	}

	public void setAnswerSheet(String answerSheet) {
		this.answerSheet = answerSheet;
	}

	@Column(name = "duration", nullable = false)
	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "right_questions")
	public Integer getRightQuestions() {
		return this.rightQuestions;
	}

	public void setRightQuestions(Integer rightQuestions) {
		this.rightQuestions = rightQuestions;
	}

	@Column(name = "wrong_questions")
	public Integer getWrongQuestions() {
		return this.wrongQuestions;
	}

	public void setWrongQuestions(Integer wrongQuestions) {
		this.wrongQuestions = wrongQuestions;
	}

	@Column(name = "noanswer_questions")
	public Integer getNoanswerQuestions() {
		return this.noanswerQuestions;
	}

	public void setNoanswerQuestions(Integer noanswerQuestions) {
		this.noanswerQuestions = noanswerQuestions;
	}

	@Column(name = "point_get", precision = 22, scale = 0)
	public Double getPointGet() {
		return this.pointGet;
	}

	public void setPointGet(Double pointGet) {
		this.pointGet = pointGet;
	}

}
