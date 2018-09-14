<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 


	String driver ="com.mysql.jdbc.Driver";
	/*String url ="jdbc:oracle:thin:@192.168.0.206:1"*/
	String url = "jdbc:mysql://192.168.0.206:3306/testdb";
	String username="scott";
	String password="tiger";
	ResultSet rs= null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	Connection conn = null;
	
	//2. 드라이버 로딩
	try {
		Class.forName(driver);
		conn= DriverManager.getConnection(url, username, password);
		}
		//3.connection
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	 catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	//4.sql문
	sb.append(" select * from dept ");
	//5.문장 객체
	try {
		pstmt =  conn.prepareStatement(sb.toString());
		rs =  pstmt.executeQuery();
		while(rs.next()) {
			int deptno = rs.getInt("deptno");
			String dname  = rs.getString ("dname");
			String loc  = rs.getString ("loc");
			out.println("<h3>"+deptno+":"+dname+":"+loc+"</h3>");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(pstmt!=null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	//6. 실제 실행
	
%>

</body>
</html>