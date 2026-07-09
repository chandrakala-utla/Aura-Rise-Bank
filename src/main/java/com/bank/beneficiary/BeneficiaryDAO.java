package com.bank.beneficiary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bank.util.DBConnection;

public class BeneficiaryDAO {

    // Add Beneficiary
    public boolean addBeneficiary(
            Beneficiary beneficiary) {

        boolean status = false;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "INSERT INTO beneficiaries "
                    + "(user_id, beneficiary_name, "
                    + "beneficiary_account_number) "
                    + "VALUES (?, ?, ?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1,
                    beneficiary.getUserId());

            ps.setString(2,
                    beneficiary.getBeneficiaryName());

            ps.setString(3,
                    beneficiary.getBeneficiaryAccountNumber());

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // View Beneficiaries
    public List<Beneficiary> getBeneficiariesByUserId(int userId) {

        List<Beneficiary> beneficiaries =
                new ArrayList<>();

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM beneficiaries WHERE user_id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                Beneficiary beneficiary =
                        new Beneficiary();

                beneficiary.setBeneficiaryId(
                        rs.getInt("beneficiary_id"));

                beneficiary.setUserId(
                        rs.getInt("user_id"));

                beneficiary.setBeneficiaryName(
                        rs.getString("beneficiary_name"));

                beneficiary.setBeneficiaryAccountNumber(
                        rs.getString("beneficiary_account_number"));

                beneficiaries.add(
                        beneficiary);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return beneficiaries;
    }

    // Check Duplicate Beneficiary
    public boolean isBeneficiaryExists(
            int userId,
            String accountNumber) {

        boolean exists = false;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM beneficiaries "
                    + "WHERE user_id=? "
                    + "AND beneficiary_account_number=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, userId);

            ps.setString(2,
                    accountNumber);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {
                exists = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
    public int getTotalBeneficiariesByUserId(int userId) {

        int total = 0;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT COUNT(*) FROM beneficiaries WHERE user_id=?";

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
    public boolean deleteBeneficiary(int beneficiaryId) {

        boolean status = false;

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "DELETE FROM beneficiaries WHERE beneficiary_id=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, beneficiaryId);

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}