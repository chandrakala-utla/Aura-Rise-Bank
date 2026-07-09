package com.bank.beneficiary;

import java.sql.Timestamp;

public class Beneficiary {

    private int beneficiaryId;
    private int userId;
    private String beneficiaryName;
    private String beneficiaryAccountNumber;
    private Timestamp createdAt;

    public Beneficiary() {
    }

    public int getBeneficiaryId() {
        return beneficiaryId;
    }

    public void setBeneficiaryId(int beneficiaryId) {
        this.beneficiaryId = beneficiaryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBeneficiaryName() {
        return beneficiaryName;
    }

    public void setBeneficiaryName(String beneficiaryName) {
        this.beneficiaryName = beneficiaryName;
    }

    public String getBeneficiaryAccountNumber() {
        return beneficiaryAccountNumber;
    }

    public void setBeneficiaryAccountNumber(
            String beneficiaryAccountNumber) {
        this.beneficiaryAccountNumber =
                beneficiaryAccountNumber;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}