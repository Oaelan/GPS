package org.hj.model;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String s_team;
	private boolean acceptNurse;

	public final String getId() {
		return id;
	}

	public final void setId(String id) {
		this.id = id;
	}

	public final String getPw() {
		return pw;
	}

	public final void setPw(String pw) {
		this.pw = pw;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final String getPhone() {
		return phone;
	}

	public final void setPhone(String phone) {
		this.phone = phone;
	}

	public final String getS_team() {
		return s_team;
	}

	public final void setS_team(String s_team) {
		this.s_team = s_team;
	}

	public final boolean isAcceptNurse() {
		return acceptNurse;
	}

	public final void setAcceptNurse(boolean acceptNurse) {
		this.acceptNurse = acceptNurse;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", s_team=" + s_team
				+ ", acceptNurse=" + acceptNurse + "]";
	}

	

}
