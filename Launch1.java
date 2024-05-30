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
import com.Dao.TxnHistoryDao;
@WebServlet("/signin")
public class Launch1 extends HttpServlet {

	Connection con =ConnectionFactory.getCon();
	AccountDao acDao = new AccountDao();
	TxnHistoryDao txnhistoryDao = new TxnHistoryDao();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("uid");
		String pass = req.getParameter("upass");
		String uphone = req.getParameter("uphone");
		String uemail = req.getParameter("uemail");
		String ucity = req.getParameter("ucity");
		String uahname = req.getParameter("uahname");
		String actype = req.getParameter("actype");
		String atm = req.getParameter("atm");
		HttpSession session = req.getSession();
		txnhistoryDao.createTxnTable(con, id);
		String res = acDao.insert(con, id, pass, uphone, uemail, ucity, uahname, actype, atm);
		if(res.equals("inserted"))
		{
			session.setAttribute("msg", "Account created successfully..");
			resp.sendRedirect("login.jsp");
		}
		else
		{
			session.setAttribute("msg", "Account creation failed");
			resp.sendRedirect("signup.jsp");
		}
	}
}
