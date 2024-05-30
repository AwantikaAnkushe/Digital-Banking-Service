package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.Entity.TxnHistory;

public class TxnHistoryDao {
	
	
	public void createTxnTable(Connection con, String uid)
	{
		try
		{
			String sql = "create table "+uid+"txn(acno varchar(50), amount varchar(50), tStatus varchar(50), date varchar(50), avialBal varchar(50))";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.execute();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public void insertTxn(Connection con, String uid, String tstatus, String am)
	{
		try
		{
			//reading acno, bal
			String bal="";
			String acno="";
			String sql = "select * from account where userid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				acno=rs.getString("acno");
				bal=rs.getString("bal");
			}
			
			//inserting txn
			String sql1 ="insert into "+uid+"txn values(?,?,?,?,?)";
			
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ps1.setString(1, acno);
			ps1.setString(2, am);
			ps1.setString(3, tstatus);
			ps1.setString(4, LocalDate.now().toString());
			ps1.setString(5, bal);
			
			ps1.executeUpdate();
			
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public List<TxnHistory> readTxn(Connection con, String uid)
	{
		List<TxnHistory> al = new ArrayList<TxnHistory>();
		try
		{
			String sql = "select * from "+uid+"txn";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				TxnHistory txn = new TxnHistory();
				txn.setAcno(rs.getString(1));
				txn.setAmount(rs.getString(2));
				txn.setTstatus(rs.getString(3));
				txn.setDate(rs.getString(4));
				txn.setBal(rs.getString(5));
				
				al.add(txn);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			return al;
		}
	}
	

}
