package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.Category;
import entities.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {

			String query = "select * from categories";
			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(query);

			while (res.next()) {
				int id = res.getInt("cId");
				String name = res.getString("cName");
				String desc = res.getString("cDescription");

				Category category = new Category(id, name, desc);

				list.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean posted = false;

		try {

			String query = "Insert into posts(pTitle, pContent, PCode, pLink, pPic, catId, userId) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpCode());
			pstmt.setString(4, post.getpLink());
			pstmt.setString(5, post.getpPic());
			pstmt.setInt(6, post.getCatId());
			pstmt.setInt(7, post.getUserId());

			pstmt.executeUpdate();

			posted = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return posted;
	}

	public List<Post> getAllPost() {

		List<Post> posts = new ArrayList<>();

		try {

			String query = "select * from posts  order by pId desc";
			Statement stmt = con.createStatement();

			ResultSet res = stmt.executeQuery(query);

			while (res.next()) {

				Post post = new Post();
				post.setpId(res.getInt("pId"));
				post.setpTitle(res.getString("pTitle"));
				post.setpContent(res.getString("pContent"));
				post.setpCode(res.getString("pCode"));
				post.setpLink(res.getString("pLink"));
				post.setpPic(res.getString("pPic"));
				post.setpDate(res.getTimestamp("pDate"));
				post.setCatId(res.getInt("catId"));
				post.setUserId(res.getInt("userId"));

				posts.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public List<Post> getPostByCatId(int catId) {
		List<Post> posts = new ArrayList<>();

		try {

			String query = "select * from posts where catId=? order by pId desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, catId);

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {

				Post post = new Post();
				post.setpId(res.getInt("pId"));
				post.setpTitle(res.getString("pTitle"));
				post.setpContent(res.getString("pContent"));
				post.setpCode(res.getString("pCode"));
				post.setpLink(res.getString("pLink"));
				post.setpPic(res.getString("pPic"));
				post.setpDate(res.getTimestamp("pDate"));
				post.setCatId(res.getInt("catId"));
				post.setUserId(res.getInt("userId"));

				posts.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public Post getPostById(int postId) {
		Post post = null;

		try {

			String query = "select * from posts where pId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postId);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {

				post = new Post();

				post.setpId(res.getInt("pId"));
				post.setpTitle(res.getString("pTitle"));
				post.setpContent(res.getString("pContent"));
				post.setpCode(res.getString("pCode"));
				post.setpLink(res.getString("pLink"));
				post.setpPic(res.getString("pPic"));
				post.setpDate(res.getTimestamp("pDate"));
				post.setCatId(res.getInt("catId"));
				post.setUserId(res.getInt("userId"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}

}
