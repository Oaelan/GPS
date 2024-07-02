package org.hj.model;

public class PatientGPSVO {

	private String p_no;
	private String p_name;
	private String p_gender;
	private String p_phone;
	private String p_subPhone;
	
	
	@Override
	public String toString() {
		return "PatientGPSVO [p_no=" + p_no + ", p_name=" + p_name + ", p_gender=" + p_gender + ", p_phone=" + p_phone
				+ ", p_subPhone=" + p_subPhone + ", p_room=" + p_room + ", x=" + x + ", y=" + y + "]";
	}
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
	public final String getP_room() {
		return p_room;
	}
	public final void setP_room(String p_room) {
		this.p_room = p_room;
	}
	public final double getX() {
		return x;
	}
	public final void setX(double x) {
		this.x = x;
	}
	public final double getY() {
		return y;
	}
	public final void setY(double y) {
		this.y = y;
	}
	private String p_room;
	private double x;
	private double y;	
	
}
