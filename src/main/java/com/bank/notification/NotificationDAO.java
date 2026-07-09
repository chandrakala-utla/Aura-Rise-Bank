package com.bank.notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bank.util.DBConnection;

public class NotificationDAO {

    // ==========================
    // Save Notification
    // ==========================
    public boolean addNotification(Notification notification) {

        String sql =
                "INSERT INTO notifications(user_id,title,message) VALUES(?,?,?)";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {

            ps.setInt(1, notification.getUserId());
            ps.setString(2, notification.getTitle());
            ps.setString(3, notification.getMessage());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }

    // ==========================
    // Get Notifications
    // ==========================
    public List<Notification> getNotificationsByUserId(int userId) {

        List<Notification> list = new ArrayList<>();

        String sql =
                "SELECT * FROM notifications " +
                "WHERE user_id=? " +
                "ORDER BY created_at DESC";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Notification notification = new Notification();

                    notification.setNotificationId(
                            rs.getInt("notification_id"));

                    notification.setUserId(
                            rs.getInt("user_id"));

                    notification.setTitle(
                            rs.getString("title"));

                    notification.setMessage(
                            rs.getString("message"));

                    notification.setStatus(
                            rs.getString("status"));

                    notification.setCreatedAt(
                            rs.getTimestamp("created_at"));

                    list.add(notification);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // ==========================
    // Unread Count
    // ==========================
    public int getUnreadCount(int userId) {

        String sql =
                "SELECT COUNT(*) FROM notifications " +
                "WHERE user_id=? AND status='UNREAD'";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // ==========================
    // Mark All Read
    // ==========================
    public void markAllAsRead(int userId) {

        String sql =
                "UPDATE notifications " +
                "SET status='READ' " +
                "WHERE user_id=?";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {

            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}