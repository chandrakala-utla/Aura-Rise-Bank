package com.bank.account;

public class AccountTest {

    public static void main(String[] args) {

        AccountDAO dao = new AccountDAO();

        Account account = new Account();

        // Existing user_id from users table
        account.setUserId(1);

        // Auto-generated account number
        account.setAccountNumber(
                dao.generateAccountNumber());

        account.setAccountType("SAVINGS");

        account.setBalance(1000.00);

        account.setStatus("ACTIVE");

        boolean result = dao.createAccount(account);

        if(result) {
            System.out.println("Account Created Successfully!");
            System.out.println("Account Number : "
                    + account.getAccountNumber());
        } else {
            System.out.println("Account Creation Failed!");
        }
    }
}