package entities;

public class Contact {
	private int id;
	private String email;
	private String title;
	private String description;
	private String pic;
	
	public Contact() {
		super();
	}

	public Contact(String email, String title, String description, String pic) {
		super();
		this.email = email;
		this.title = title;
		this.description = description;
		this.pic = pic;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
}
