package com.psh.moveline.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.vo.MoveLine;
import static com.jjh.common.JDBCTemplate.*;

public class MoveLineDao {
private Properties sql=new Properties();
	
	public MoveLineDao() {
		try {
			String path=MoveLineDao.class
					.getResource("/sql/pshdev_moveline/moveline_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public MoveLine searchMoveLine(Connection conn,int movelinNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MoveLine ml=new MoveLine();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMoveLine"));
			pstmt.setInt(1, movelinNo);
	
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ml=getMoveLine(rs);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return ml;
	}
	
	private MoveLine getMoveLine(ResultSet rs)throws SQLException{
		return MoveLine.builder()
				.movelineNo(rs.getInt("moveline_No"))
				.userId(rs.getString("user_Id"))
				.tripdateFinish(rs.getDate("tripdate_Finish"))
				.tripdateStart(rs.getDate("tripdate_Start"))
				.movelineName(rs.getString("moveline_Name"))
				.openandclosed(rs.getString("open_And_Closed").charAt(0))
				.movelineEnroll(rs.getDate("moveline_Enroll"))
				.build();	
	}
}
