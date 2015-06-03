package com.et.edusoho.admin.user.bean;

public class User {

	private String id;// 用户ID

	private String username; // 用户账号

	private String password; // 用户登录的密码

	private String name; // 用户姓名

	private String signature; // 个性签名

	private String introduction; // 自我介绍

	private String sex; // 用户性别

	private String role; // 用户角色

	private String[] roles;

	private String email; // 用户的email

	private String avatar; // 用户头像

	private String locked; // 用户是否被锁

	private String createTime; // 用户创建的时间

	private String promoted; // 该用户是否被推荐

	private String promotedTime;// 该用户是否被推荐时间

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String[] getRoles() {
		return roles;
	}

	public void setRoles(String[] roles) {
		this.roles = roles;
	}

	public String getPromoted() {
		return promoted;
	}

	public void setPromoted(String promoted) {
		this.promoted = promoted;
	}

	public String getPromotedTime() {
		return promotedTime;
	}

	public void setPromotedTime(String promotedTime) {
		this.promotedTime = promotedTime;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}
