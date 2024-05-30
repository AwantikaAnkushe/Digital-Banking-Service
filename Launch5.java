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
import com.Entity.Account;

@WebServlet("/withdraw")
public class Launch5 extends HttpServlet{
	
	Connection con = ConnectionFactory.getCon();
	AccountDao acDao= new AccountDao();
	TxnHistoryDao txnDao = new TxnHistoryDao();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("uid");
		String amount = req.getParameter("am");
		
		String res = acDao.withdrawMoney(con, id, amount);
		txnDao.insertTxn(con, id, "withdraw", amount);
		HttpSession session = req.getSession();
		
		Account ac = acDao.readAccount(con, id);
		if(res.equals("updated"))
		{
			session.setAttribute("check", id);
			session.setAttribute("ac", ac);
			session.setAttribute("msg", "Money Withdraw");
			resp.sendRedirect("account.jsp");
		}
		else
		{
			session.setAttribute("msg", "Insufficient balance");
			resp.sendRedirect("login.jsp");
		}
	}

}
