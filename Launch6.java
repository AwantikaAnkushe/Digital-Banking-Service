package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

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
import com.Entity.TxnHistory;

@WebServlet("/readtxn")
public class Launch6 extends HttpServlet{
	
	Connection con = ConnectionFactory.getCon();
	
	TxnHistoryDao txnDao = new TxnHistoryDao();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("uid");
		
		
		List<TxnHistory> al = txnDao.readTxn(con, id);
		HttpSession session = req.getSession();
		
		
		
			session.setAttribute("check", id);
			session.setAttribute("al", al);
			
			resp.sendRedirect("readtxn.jsp");
		
	}

}
