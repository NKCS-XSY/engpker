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
 * Follow generated by hbm2java
 */
@Entity
@Table(name = "follow", catalog = "pker")
public class Follow implements java.io.Serializable {

	private Integer followId;
	private User userByFollowedId;
	private User userByFollowerId;
	private Date createTime;

	public Follow() {
	}

	public Follow(User userByFollowedId, User userByFollowerId) {
		this.userByFollowedId = userByFollowedId;
		this.userByFollowerId = userByFollowerId;
	}

	public Follow(User userByFollowedId, User userByFollowerId, Date createTime) {
		this.userByFollowedId = userByFollowedId;
		this.userByFollowerId = userByFollowerId;
		this.createTime = createTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "follow_id", unique = true, nullable = false)
	public Integer getFollowId() {
		return this.followId;
	}

	public void setFollowId(Integer followId) {
		this.followId = followId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "followed_id", nullable = false)
	public User getUserByFollowedId() {
		return this.userByFollowedId;
	}

	public void setUserByFollowedId(User userByFollowedId) {
		this.userByFollowedId = userByFollowedId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "follower_id", nullable = false)
	public User getUserByFollowerId() {
		return this.userByFollowerId;
	}

	public void setUserByFollowerId(User userByFollowerId) {
		this.userByFollowerId = userByFollowerId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", length = 19)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
