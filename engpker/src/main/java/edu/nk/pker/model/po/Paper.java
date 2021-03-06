package edu.nk.pker.model.po;

// Generated 2015-5-20 10:08:13 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Paper generated by hbm2java
 */
@Entity
@Table(name = "paper", catalog = "pker")
public class Paper implements java.io.Serializable {

	private Integer paperId;
	private User user;
	private String name;
	private int duration;
	private Integer quantity;
	private Integer categoryId;
	private String type;
	private Boolean isVisible;
	private Boolean isSubjective;
	private boolean status;
	private String summary;
	private Set<Record> records = new HashSet<Record>(0);
	private Set<Competition> competitions = new HashSet<Competition>(0);

	public Paper() {
	}

	public Paper(int duration, boolean status) {
		this.duration = duration;
		this.status = status;
	}

	public Paper(User user, String name, int duration, Integer quantity,
			Integer categoryId, String type, Boolean isVisible,
			Boolean isSubjective, boolean status, String summary,
			Set<Record> records, Set<Competition> competitions) {
		this.user = user;
		this.name = name;
		this.duration = duration;
		this.quantity = quantity;
		this.categoryId = categoryId;
		this.type = type;
		this.isVisible = isVisible;
		this.isSubjective = isSubjective;
		this.status = status;
		this.summary = summary;
		this.records = records;
		this.competitions = competitions;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "paper_id", unique = true, nullable = false)
	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "creator")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "duration", nullable = false)
	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Column(name = "quantity")
	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Column(name = "category_id")
	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "type", length = 50)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "is_visible")
	public Boolean getIsVisible() {
		return this.isVisible;
	}

	public void setIsVisible(Boolean isVisible) {
		this.isVisible = isVisible;
	}

	@Column(name = "is_subjective")
	public Boolean getIsSubjective() {
		return this.isSubjective;
	}

	public void setIsSubjective(Boolean isSubjective) {
		this.isSubjective = isSubjective;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "summary", length = 65535)
	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "paper")
	public Set<Record> getRecords() {
		return this.records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "paper")
	public Set<Competition> getCompetitions() {
		return this.competitions;
	}

	public void setCompetitions(Set<Competition> competitions) {
		this.competitions = competitions;
	}

}
