package entities;

public class Like {
	private int lId;
	private int pId;
	private int uId;
	
	public Like() {
		super();
	}
	
	public Like(int pId, int uId) {
		super();
		this.pId = pId;
		this.uId = uId;
	}

	public int getlId() {
		return lId;
	}

	public void setlId(int lId) {
		this.lId = lId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}
}
