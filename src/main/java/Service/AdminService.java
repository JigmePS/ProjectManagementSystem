package Service;

import DBConnection.DBConnection;
import Model.Um;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    public List<Um> getUList() {
        List<Um> userList = new ArrayList<>();
        String query = "select * from user where admin!=1";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));

                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public List<Um> getSearchUser(String sresult) {
        System.out.println("SearchUser");
        List<Um> userList = new ArrayList<>();
        String query = "select * from user where fname LIKE ? and admin!=1";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setString(1, "%" + sresult + "%");

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));

                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public List<Um> getUserDetail(int uid) {
        System.out.println("getUserDetail");
        List<Um> userList = new ArrayList<>();
        String query = "select * from user where uid=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, uid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));

                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;

    }

    public void editUser(Um user) {
        String query = "update user set fname=?,email=?" +
                "where uid=?"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, user.getFullName());
            preparedStatements.setString(2, user.getEmail());
            preparedStatements.setString(3, user.getPassword());            preparedStatements.setInt(3, user.getId());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Um> getPList() {
        List<Um> projectList = new ArrayList<>();
        String query = "SELECT project.id, project.name, project.status, user.fname FROM user JOIN project ON project.uid = user.uid";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setPid(rs.getInt("id"));
                user.setPname(rs.getString("name"));
                user.setPstatus(rs.getString("status"));
                user.setFullName(rs.getString("fname"));

                projectList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projectList;
    }

    public List<Um> getSearchProject(String sresult) {
        System.out.println("SearchProject");
        List<Um> projectList = new ArrayList<>();
        String query = "SELECT project.id, project.name, project.status, user.fname FROM user JOIN project ON project.uid = user.uid where name LIKE ?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setString(1, "%" + sresult + "%");

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setPid(rs.getInt("id"));
                user.setPname(rs.getString("name"));
                user.setPstatus(rs.getString("status"));
                user.setFullName(rs.getString("fname"));

                projectList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projectList;
    }

    public List<Um> getProjectDetail(int pid) {
        System.out.println("getProjectDetail");
        List<Um> projectList = new ArrayList<>();
        String query = "select * from project where id=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, pid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setPid(rs.getInt("id"));
                user.setPname(rs.getString("name"));
                user.setId(rs.getInt("uid"));
                user.setPstatus(rs.getString("status"));

                projectList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projectList;

    }

    public void editProject(Um project) {
        String query = "update project set name=?,status=?" +
                "where id=?"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, project.getPname());
            preparedStatements.setString(2, project.getPstatus());
            preparedStatements.setInt(3, project.getPid());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProject(int id) {
        String query = "delete from project where id = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try {
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProjectTasks(int pid) {
        String query = "delete from task where pid = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try {
            ps.setInt(1, pid);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Um> getTList(int pid) {
        List<Um> taskList = new ArrayList<>();
        String query = "select * from task where pid = ? ORDER BY date ASC";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, pid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setTid(rs.getInt("tid"));
                user.setTdate(rs.getString("date"));
                user.setTname(rs.getString("tname"));
                user.setTaskMember(rs.getString("member"));
                user.setDeliverable(rs.getString("deliverable"));
                user.setImge(rs.getString("image"));
                user.setPid(rs.getInt("pid"));

                taskList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return taskList;
    }

    public List<Um> getTaskDetail(int tid) {
        System.out.println("getTaskDetail");
        List<Um> taskList = new ArrayList<>();
        String query = "select * from task where tid=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, tid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setTid(rs.getInt("tid"));
                user.setTdate(rs.getString("date"));
                user.setTname(rs.getString("tname"));
                user.setTaskMember(rs.getString("member"));
                user.setDeliverable(rs.getString("deliverable"));
                user.setImge(rs.getString("image"));
                user.setPid(rs.getInt("pid"));

                taskList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return taskList;

    }

    public void editTask(Um task) {
        String query = "update task set date=?,tname=?,member=?,deliverable=?,image=?" +
                "where tid=?"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, task.getTdate());
            preparedStatements.setString(2, task.getTname());
            preparedStatements.setString(3, task.getTaskMember());
            preparedStatements.setString(4, task.getDeliverable());
            preparedStatements.setString(5, task.getImge());
            preparedStatements.setInt(6, task.getTid());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTask(int tid) {
        String query = "delete from task where tid = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try {
            ps.setInt(1, tid);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
