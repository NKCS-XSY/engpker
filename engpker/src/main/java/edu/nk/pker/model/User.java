package edu.nk.pker.model;

// Generated 2015-5-19 4:25:34 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user", catalog = "pker")
public class User implements java.io.Serializable {

	private Integer userId;
	private String username;
	private String truename;
	private String password;
	private String email;
	private String phone;
	private String gender;
	private Date birthday;
	private Boolean enabled;
	private Boolean state;
	private Date addDate;
	private Date registertime;
	private Integer integral;
	private Integer level;
	private Integer addby;
	private Date lastLoginTime;
	private Date loginTime;

	public User() {
	}

	public User(String username, String password, Date addDate,
			Date registertime) {
		this.username = username;
		this.password = password;
		this.addDate = addDate;
		this.registertime = registertime;
	}

	public User(String username, String truename, String password,
			String email, String phone, String gender, Date birthday,
			Boolean enabled, Boolean state, Date addDate, Date registertime,
			Integer integral, Integer level, Integer addby, Date lastLoginTime,
			Date loginTime) {
		this.username = username;
		this.truename = truename;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.birthday = birthday;
		this.enabled = enabled;
		this.state = state;
		this.addDate = addDate;
		this.registertime = registertime;
		this.integral = integral;
		this.level = level;
		this.addby = addby;
		this.lastLoginTime = lastLoginTime;
		this.loginTime = loginTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_id", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "username", nullable = false, length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "truename", length = 50)
	public String getTruename() {
		return this.truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	@Column(name = "password", nullable = false, length = 30)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "gender", length = 2)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "birthday", length = 0)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Column(name = "state")
	public Boolean getState() {
		return this.state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "add_date", nullable = false, length = 0)
	public Date getAddDate() {
		return this.addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "registertime", nullable = false, length = 0)
	public Date getRegistertime() {
		return this.registertime;
	}

	public void setRegistertime(Date registertime) {
		this.registertime = registertime;
	}

	@Column(name = "integral")
	public Integer getIntegral() {
		return this.integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	@Column(name = "level")
	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	@Column(name = "addby")
	public Integer getAddby() {
		return this.addby;
	}

	public void setAddby(Integer addby) {
		this.addby = addby;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_login_time", length = 0)
	public Date getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "login_time", length = 0)
	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

}
