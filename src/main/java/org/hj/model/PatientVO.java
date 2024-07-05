package org.hj.model;

public class PatientVO {

	private String p_no;
	private String p_name;
	private String p_gender;
	private String p_id;
	private String p_phone;
	private String p_subPhone;
	private String p_room;
	private String s_id;

	public final String getP_no() {
		return p_no;
	}
	public final void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public final String getP_name() {
		return p_name;
	}
	public final void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public final String getP_gender() {
		return p_gender;
	}
	public final void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public final String getP_id() {
		return p_id;
	}
	public final void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public final String getP_phone() {
		return p_phone;
	}
	public final void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public final String getP_subPhone() {
		return p_subPhone;
	}
	public final void setP_subPhone(String p_subPhone) {
		this.p_subPhone = p_subPhone;
	}
	public final String getS_id() {
		return s_id;
	}
	public final void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getP_room() {
		return p_room;
	}
	public void setP_room(String p_room) {
		this.p_room = p_room;
	}
	
	@Override
	public String toString() {
		return "PatientVO [p_no=" + p_no + ", p_name=" + p_name + ", p_gender="
				+ p_gender + ", p_id=" + p_id + ", p_phone=" + p_phone
				+ ", p_subPhone=" + p_subPhone + ", p_room=" + p_room
				+ ", s_id=" + s_id + "]";
	}
	
	

}
