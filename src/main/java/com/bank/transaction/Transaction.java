package com.bank.transaction;
import java.sql.Timestamp;

public class Transaction {
	private int transactionId;
	private String accountNumber;
	private int accountId;
	private String transactionType;
	private double amount;
	private double balanceAfter;
	private Timestamp transactionDate;
	private String otherAccountNumber;
	private String customerName;

	public String getCustomerName() {
	    return customerName;
	}

	public void setCustomerName(String customerName) {
	    this.customerName = customerName;
	}

	public String getOtherAccountNumber() {
	    return otherAccountNumber;
	}

	public void setOtherAccountNumber(String otherAccountNumber) {
	    this.otherAccountNumber = otherAccountNumber;
	}
	
	private String fromAccount;
	private String toAccount;

	public String getFromAccount() {
	    return fromAccount;
	}

	public void setFromAccount(String fromAccount) {
	    this.fromAccount = fromAccount;
	}

	public String getToAccount() {
	    return toAccount;
	}

	public void setToAccount(String toAccount) {
	    this.toAccount = toAccount;
	}
	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getBalanceAfter() {
		return balanceAfter;
	}
	public void setBalanceAfter(double balanceAfter) {
		this.balanceAfter = balanceAfter;
	}
	public Timestamp getTransactionDate() {
	    return transactionDate;
	}

	public void setTransactionDate(Timestamp transactionDate) {
	    this.transactionDate = transactionDate;
	}
	
}
