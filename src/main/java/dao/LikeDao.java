package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.Like;

public class LikeDao {
	private Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(Like like) {
		boolean inserted = false;

		try {

			String query = "insert into likes(pId, uId) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, like.getpId());
			pstmt.setInt(2, like.getuId());

			pstmt.executeUpdate();

			inserted = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return inserted;
	}

	public int noOfLikes(int pId) {
		int likes = 0;

		try {

			String query = "select count(*) as likes from likes where pId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);

//			likes = pstmt.executeUpdate();

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				likes = res.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return likes;
	}

	public boolean isLiked(int pId, int uId) {

		boolean liked = false;

		try {

			String query = "select * from likes where pId=? and uId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				liked = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return liked;
	}

	public boolean disLike(int pId, int uId) {

		boolean liked = false;

		try {

			String query = "delete from likes where pId=? and uId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			pstmt.executeUpdate();

			liked = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return liked;
	}
}
