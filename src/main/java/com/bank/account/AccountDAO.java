package com.bank.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bank.util.DBConnection;

public class AccountDAO {

    // Generate Account Number
    public String generateAccountNumber() {

        String accountNumber = "10000001";

        try {
            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT account_number FROM accounts ORDER BY account_id DESC LIMIT 1";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                long lastNumber =
                    Long.parseLong(rs.getString("account_number"));

                accountNumber =
                    String.valueOf(lastNumber + 1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return accountNumber;
    }

    // Create Account
    public boolean createAccount(Account account) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "INSERT INTO accounts " +
                "(user_id, account_number, account_type, balance, status) " +
                "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, account.getUserId());
            ps.setString(2, account.getAccountNumber());
            ps.setString(3, account.getAccountType());
            ps.setDouble(4, account.getBalance());
            ps.setString(5, account.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public List<Account> getAccountsByUserId(int userId) {

        List<Account> accounts = new ArrayList<>();

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                "SELECT * FROM accounts WHERE user_id=? ORDER BY account_id";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Account account = new Account();

                account.setAccountId(
                        rs.getInt("account_id"));

                account.setUserId(
                        rs.getInt("user_id"));

                account.setAccountNumber(
                        rs.getString("account_number"));

                account.setAccountType(
                        rs.getString("account_type"));

                account.setBalance(
                        rs.getDouble("balance"));

                account.setStatus(
                        rs.getString("status"));
                account.setCreatedAt(
                        rs.getTimestamp("created_at").toString());
                account.setClosureRequest(
                        rs.getString("closure_request"));

                accounts.add(account);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return accounts;
    }
    public Account getAccountByNumber(String accountNumber) {

        Account account = null;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT a.*, u.full_name " +
            "FROM accounts a " +
            "JOIN users u ON a.user_id = u.user_id " +
            "WHERE a.account_number = ?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, accountNumber);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                account = new Account();

                account.setAccountId(
                        rs.getInt("account_id"));

                account.setUserId(
                        rs.getInt("user_id"));

                account.setAccountNumber(
                        rs.getString("account_number"));

                account.setAccountType(
                        rs.getString("account_type"));

                account.setBalance(
                        rs.getDouble("balance"));

                account.setStatus(
                        rs.getString("status"));

                account.setCreatedAt(
                        rs.getTimestamp("created_at").toString());

                account.setClosureRequest(
                        rs.getString("closure_request"));

                // ⭐ Customer Name
                account.setCustomerName(
                        rs.getString("full_name"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return account;
    }
    public boolean updateBalance(int accountId,
            double newBalance) {

boolean status = false;

try {

Connection conn = DBConnection.getConnection();

String sql =
"UPDATE accounts SET balance=? WHERE account_id=?";

PreparedStatement ps =
conn.prepareStatement(sql);

ps.setDouble(1, newBalance);
ps.setInt(2, accountId);

int rows = ps.executeUpdate();

if(rows > 0) {
status = true;
}

} catch(Exception e) {
e.printStackTrace();
}

return status;
}
    public int getTotalAccountsByUserId(int userId) {

        int total = 0;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM accounts WHERE user_id=?";

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
    public double getTotalBalanceByUserId(int userId) {

        double totalBalance = 0;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COALESCE(SUM(balance),0) FROM accounts WHERE user_id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {
                totalBalance = rs.getDouble(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return totalBalance;
    }
    public boolean requestClosure(String accountNumber) {

        boolean status = false;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
            "UPDATE accounts SET closure_request='PENDING' WHERE account_number=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, accountNumber);

            status =
                    ps.executeUpdate() > 0;

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return status;

    }
    public boolean isAccountActive(String accountNumber) {

        boolean active = false;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
                    "SELECT status FROM accounts WHERE account_number=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, accountNumber);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                active =
                    "ACTIVE".equals(rs.getString("status"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return active;
    }
    public int getTotalAccounts() {

        int total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "SELECT COUNT(*) FROM accounts";

            PreparedStatement ps = conn.prepareStatement(sql);

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
    public int getActiveAccounts() {

        int total = 0;

        try {

            Connection conn = DBConnection.getConnection();

            String sql =
            "SELECT COUNT(*) FROM accounts WHERE status='ACTIVE'";

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
   
   
  
    public List<Account> getAllAccounts() {

        List<Account> accounts = new ArrayList<>();

        String sql =
        "SELECT a.*, u.full_name " +
        "FROM accounts a " +
        "JOIN users u ON a.user_id = u.user_id " +
        "ORDER BY a.account_id";

        try(
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        ){

            while(rs.next()){

                Account account = new Account();

                account.setAccountId(rs.getInt("account_id"));
                account.setUserId(rs.getInt("user_id"));
                account.setAccountNumber(rs.getString("account_number"));
                account.setAccountType(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setStatus(rs.getString("status"));

                // Customer Name
                account.setCustomerName(rs.getString("full_name"));

                accounts.add(account);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return accounts;
    }
    public List<Account> searchAccounts(String keyword){

        List<Account> accounts = new ArrayList<>();

        String sql =
        "SELECT a.*, u.full_name " +
        "FROM accounts a " +
        "JOIN users u ON a.user_id=u.user_id " +
        "WHERE CAST(a.account_number AS TEXT) ILIKE ? " +
        "OR u.full_name ILIKE ? " +
        "OR a.account_type ILIKE ? " +
        "ORDER BY a.account_id";

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

                Account account = new Account();

                account.setAccountId(rs.getInt("account_id"));
                account.setUserId(rs.getInt("user_id"));
                account.setAccountNumber(rs.getString("account_number"));
                account.setAccountType(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setStatus(rs.getString("status"));

                account.setCustomerName(rs.getString("full_name"));

                accounts.add(account);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return accounts;
    }
    public List<Account> getClosureRequests(){

        List<Account> list = new ArrayList<>();

        String sql =
        "SELECT a.*,u.full_name " +
        "FROM accounts a " +
        "JOIN users u ON a.user_id=u.user_id " +
        "WHERE a.closure_request='PENDING' " +
        "ORDER BY a.account_id DESC";

        try(
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
        ){

            while(rs.next()){

                Account a=new Account();

                a.setAccountId(rs.getInt("account_id"));
                a.setAccountNumber(rs.getString("account_number"));
                a.setCustomerName(rs.getString("full_name"));
                a.setAccountType(rs.getString("account_type"));
                a.setBalance(rs.getDouble("balance"));
                a.setStatus(rs.getString("status"));
                a.setClosureRequest(rs.getString("closure_request"));

                list.add(a);

            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;

    }
    public boolean approveClosure(int accountId){

        boolean status=false;

        String sql=
        "UPDATE accounts SET status='CLOSED',closure_request='APPROVED' WHERE account_id=?";

        try(
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
        ){

            ps.setInt(1,accountId);

            status=ps.executeUpdate()>0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public boolean rejectClosure(int accountId){

        boolean status=false;

        String sql=
        "UPDATE accounts SET closure_request='REJECTED' WHERE account_id=?";

        try(
            Connection con=DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(sql);
        ){

            ps.setInt(1,accountId);

            status=ps.executeUpdate()>0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return status;
    }
    public int getClosedAccounts(){

        int total = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT COUNT(*) FROM accounts WHERE status='CLOSED'";

            PreparedStatement ps =
            con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                total = rs.getInt(1);

            }

        }catch(Exception e){

            e.printStackTrace();

        }

        return total;

    }
    public double getTotalBankBalance(){

        double total = 0;

        try{

            Connection con = DBConnection.getConnection();

            String sql =
            "SELECT COALESCE(SUM(balance),0) FROM accounts";

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
    public List<Account> getAllClosureRequests() {

        List<Account> list = new ArrayList<>();

        String sql =
        "SELECT a.*, u.full_name " +
        "FROM accounts a " +
        "JOIN users u ON a.user_id = u.user_id " +
        "WHERE a.closure_request <> 'NONE' " +
        "ORDER BY a.account_id DESC";

        try(
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
        ){

            while(rs.next()){

                Account account = new Account();

                account.setAccountId(rs.getInt("account_id"));
                account.setAccountNumber(rs.getString("account_number"));
                account.setCustomerName(rs.getString("full_name"));
                account.setStatus(rs.getString("status"));
                account.setClosureRequest(rs.getString("closure_request"));

                list.add(account);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    
}