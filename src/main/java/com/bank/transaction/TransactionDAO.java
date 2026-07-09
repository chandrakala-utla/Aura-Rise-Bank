package com.bank.transaction;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bank.util.DBConnection;

public class TransactionDAO {
	public boolean addTransaction(Transaction transaction) {

	    boolean status = false;

	    try {

	        Connection conn = DBConnection.getConnection();

	        String sql =
	        "INSERT INTO transactions(account_id, transaction_type, amount, balance_after, from_account, to_account) VALUES(?,?,?,?,?,?)";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, transaction.getAccountId());
	        ps.setString(2, transaction.getTransactionType());
	        ps.setDouble(3, transaction.getAmount());
	        ps.setDouble(4, transaction.getBalanceAfter());
	        ps.setString(5, transaction.getFromAccount());
	        ps.setString(6, transaction.getToAccount());

	        status = ps.executeUpdate() > 0;

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public int getTotalTransactionsByUserId(int userId) {

	    int total = 0;

	    try {

	        Connection conn =
	                DBConnection.getConnection();

	        String sql =
	        """
	        SELECT COUNT(*)
	        FROM transactions t
	        JOIN accounts a
	        ON t.account_id = a.account_id
	        WHERE a.user_id = ?
	        """;

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ps.setInt(1, userId);

	        ResultSet rs =
	                ps.executeQuery();

	        if(rs.next()) {
	            total = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return total;
	}
	public List<Transaction> getTransactionsByAccountId(
	        int accountId) {

	    List<Transaction> list =
	            new ArrayList<>();

	    try {

	        Connection conn =
	                DBConnection.getConnection();

	        String sql =
	                "SELECT * FROM transactions "
	              + "WHERE account_id=? "
	              + "ORDER BY transaction_date DESC";

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ps.setInt(1, accountId);

	        ResultSet rs =
	                ps.executeQuery();

	        while(rs.next()) {

	            Transaction t =
	                    new Transaction();

	            t.setTransactionId(
	                    rs.getInt("transaction_id"));

	            t.setAccountId(
	                    rs.getInt("account_id"));

	            t.setTransactionType(
	                    rs.getString("transaction_type"));

	            t.setAmount(
	                    rs.getDouble("amount"));

	            t.setBalanceAfter(
	                    rs.getDouble("balance_after"));

	            t.setTransactionDate(
	                    rs.getTimestamp("transaction_date"));
	            t.setFromAccount(
	                    rs.getString("from_account"));

	            t.setToAccount(
	                    rs.getString("to_account"));

	            list.add(t);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public List<Transaction> getTransactionsByType(
	        int accountId,
	        String type) {

	    List<Transaction> list =
	            new ArrayList<>();

	    try {

	        Connection conn =
	                DBConnection.getConnection();

	        String sql =
	                "SELECT * FROM transactions "
	              + "WHERE account_id=? "
	              + "AND transaction_type=? "
	              + "ORDER BY transaction_date DESC";

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ps.setInt(1, accountId);
	        ps.setString(2, type);

	        ResultSet rs =
	                ps.executeQuery();

	        while(rs.next()) {

	            Transaction t =
	                    new Transaction();

	            t.setTransactionId(
	                    rs.getInt("transaction_id"));

	            t.setAccountId(
	                    rs.getInt("account_id"));

	            t.setTransactionType(
	                    rs.getString("transaction_type"));

	            t.setAmount(
	                    rs.getDouble("amount"));

	            t.setBalanceAfter(
	                    rs.getDouble("balance_after"));

	            t.setTransactionDate(
	                    rs.getTimestamp("transaction_date"));
	            t.setFromAccount(
	                    rs.getString("from_account"));

	            t.setToAccount(
	                    rs.getString("to_account"));

	            list.add(t);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public List<Transaction> getAllTransactionsByUserId(int userId) {

	    List<Transaction> list = new ArrayList<>();

	    try {

	        Connection conn = DBConnection.getConnection();

	        String sql =
	        "SELECT t.*, a.account_number " +
	        "FROM transactions t " +
	        "JOIN accounts a ON t.account_id = a.account_id " +
	        "WHERE a.user_id = ? " +
	        "ORDER BY t.transaction_date DESC";

	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, userId);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Transaction transaction = new Transaction();

	            transaction.setTransactionId(
	                    rs.getInt("transaction_id"));

	            transaction.setAccountId(
	                    rs.getInt("account_id"));

	            transaction.setAccountNumber(
	                    rs.getString("account_number"));

	            transaction.setTransactionType(
	                    rs.getString("transaction_type"));

	            transaction.setAmount(
	                    rs.getDouble("amount"));

	            transaction.setBalanceAfter(
	                    rs.getDouble("balance_after"));

	            transaction.setTransactionDate(
	                    rs.getTimestamp("transaction_date"));
	            transaction.setFromAccount(
	                    rs.getString("from_account"));

	            transaction.setToAccount(
	                    rs.getString("to_account"));

	            list.add(transaction);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	public int getTotalTransactions() {

	    int total = 0;

	    try {

	        Connection conn = DBConnection.getConnection();

	        String sql = "SELECT COUNT(*) FROM transactions";

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {

	            total = rs.getInt(1);

	        }

	    }
	    catch(Exception e) {

	        e.printStackTrace();

	    }

	    return total;

	}
	public List<Transaction> getAllTransactions() {

	    List<Transaction> list = new ArrayList<>();

	    String sql =
	    "SELECT t.*, a.account_number " +
	    "FROM transactions t " +
	    "JOIN accounts a ON t.account_id = a.account_id " +
	    "ORDER BY t.transaction_date DESC";

	    try(
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	    ){

	        while(rs.next()){

	            Transaction t = new Transaction();

	            t.setTransactionId(rs.getInt("transaction_id"));
	            t.setAccountId(rs.getInt("account_id"));
	            t.setAccountNumber(rs.getString("account_number"));
	            t.setTransactionType(rs.getString("transaction_type"));
	            t.setAmount(rs.getDouble("amount"));
	            t.setBalanceAfter(rs.getDouble("balance_after"));
	            t.setTransactionDate(rs.getTimestamp("transaction_date"));
	            t.setFromAccount(
	                    rs.getString("from_account"));

	            t.setToAccount(
	                    rs.getString("to_account"));

	            list.add(t);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}
	public List<Transaction> searchTransactions(String keyword){

	    List<Transaction> list = new ArrayList<>();

	    String sql =
	    "SELECT t.*, a.account_number " +
	    "FROM transactions t " +
	    "JOIN accounts a ON t.account_id = a.account_id " +
	    "WHERE CAST(t.transaction_id AS TEXT) ILIKE ? " +
	    "OR a.account_number ILIKE ? " +
	    "OR t.transaction_type ILIKE ? " +
	    "ORDER BY t.transaction_date DESC";

	    try(
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql);
	    ){

	        String search = "%" + keyword + "%";

	        ps.setString(1, search);
	        ps.setString(2, search);
	        ps.setString(3, search);

	        ResultSet rs = ps.executeQuery();

	        while(rs.next()){

	            Transaction t = new Transaction();

	            t.setTransactionId(rs.getInt("transaction_id"));
	            t.setAccountId(rs.getInt("account_id"));
	            t.setAccountNumber(rs.getString("account_number"));
	            t.setTransactionType(rs.getString("transaction_type"));
	            t.setAmount(rs.getDouble("amount"));
	            t.setBalanceAfter(rs.getDouble("balance_after"));
	            t.setTransactionDate(rs.getTimestamp("transaction_date"));
	            t.setFromAccount(
	                    rs.getString("from_account"));

	            t.setToAccount(
	                    rs.getString("to_account"));

	            list.add(t);
	        }

	    }catch(Exception e){
	        e.printStackTrace();
	    }

	    return list;
	}
	public double getTotalDeposits(){

	    double total = 0;

	    try{

	        Connection con = DBConnection.getConnection();

	        String sql =
	        "SELECT COALESCE(SUM(amount),0) " +
	        "FROM transactions " +
	        "WHERE transaction_type='DEPOSIT'";

	        PreparedStatement ps =
	        con.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            total = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return total;

	}
	public double getTotalWithdrawals(){

	    double total = 0;

	    try{

	        Connection con = DBConnection.getConnection();

	        String sql =
	        "SELECT COALESCE(SUM(amount),0) " +
	        "FROM transactions " +
	        "WHERE transaction_type='WITHDRAW'";

	        PreparedStatement ps =
	        con.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            total = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return total;

	}
	public double getTotalTransfers(){

	    double total = 0;

	    try{

	        Connection con = DBConnection.getConnection();

	        String sql =
	        "SELECT COALESCE(SUM(amount),0) " +
	        "FROM transactions " +
	        "WHERE transaction_type='TRANSFER_OUT'";

	        PreparedStatement ps =
	        con.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            total = rs.getDouble(1);

	        }

	    }catch(Exception e){

	        e.printStackTrace();

	    }

	    return total;

	}
	public List<Transaction> getLatestActivities() {

	    List<Transaction> list = new ArrayList<>();

	    String sql =
	            "SELECT t.*, " +
	            "a.account_number, " +
	            "u.full_name " +
	            "FROM transactions t " +
	            "JOIN accounts a ON t.account_id = a.account_id " +
	            "JOIN users u ON a.user_id = u.user_id " +
	            "ORDER BY t.transaction_date DESC " +
	            "LIMIT 5";

	    try (

	        Connection conn = DBConnection.getConnection();

	        PreparedStatement ps =
	                conn.prepareStatement(sql);

	        ResultSet rs =
	                ps.executeQuery();

	    ){

	        while(rs.next()){

	            Transaction t =
	                    new Transaction();

	            t.setTransactionId(
	                    rs.getInt("transaction_id"));

	            t.setTransactionType(
	                    rs.getString("transaction_type"));

	            t.setAmount(
	                    rs.getDouble("amount"));

	            t.setTransactionDate(
	                    rs.getTimestamp("transaction_date"));

	            t.setCustomerName(
	                    rs.getString("full_name"));

	            t.setAccountNumber(
	                    rs.getString("account_number"));

	            list.add(t);
	        }

	    }
	    catch(Exception e){

	        e.printStackTrace();

	    }

	    return list;
	}
}
