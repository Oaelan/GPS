package org.hj.model;

public class GPSInfoVO {
	
	private String id;
	private double x;
	private double y;
	
	
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
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
	
	@Override
	public String toString() {
		return "GPSInfoVO [id=" + id + ", x=" + x + ", y=" + y + "]";
	}
	
	

}
