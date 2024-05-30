package com.Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConnectionFactory.ConnectionFactory;
import com.Dao.AccountDao;
import com.Entity.Account;

@WebServlet("/login")
public class Launch2 extends HttpServlet{
	
	Connection con = ConnectionFactory.getCon();
	AccountDao acDao= new AccountDao();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("uid");
		String pass = req.getParameter("upass");
		
		String res = acDao.login(con, id, pass);
		HttpSession session = req.getSession();
		
		Account ac = acDao.readAccount(con, id);
		if(res.equals("exists"))
		{
			session.setAttribute("check", id);
			session.setAttribute("ac", ac);
			resp.sendRedirect("account.jsp");
		}
		else
		{
			session.setAttribute("msg", "invalid id or password");
			resp.sendRedirect("login.jsp");
		}
	}

}
