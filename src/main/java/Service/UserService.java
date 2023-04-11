package Service;

import DBConnection.DBConnection;
import Model.Um;

import java.sql.*;
import java.util.*;

public class UserService {

    public void insertUser(Um user) {
        String query = "insert into user(email, fname, password)" + "values(?,?,?)"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, user.getEmail());
            preparedStatements.setString(2, user.getFullName());
            preparedStatements.setString(3, user.getPassword());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }


    // Delete User
    public void deleteUser(int id) {
        String query = "delete from user where uid = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try {
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(int id, Um user) throws SQLException {

        String query = "update user set email=?,fname=?,password=?," +
                "where uid=?";
        PreparedStatement pstm = new DBConnection().getStatement(query);
        pstm.setString(1, user.getEmail());
        pstm.setString(2, user.getFullName());
        pstm.setString(3, user.getPassword());
//        pstm.setString(4, student.getRole());
        pstm.setInt(5, id);

        pstm.execute();
    }

    public Um getUser(String email, String password) {

        Um user = null;
        String query = "SELECT * FROM user WHERE email=? AND password=?";
        PreparedStatement ps = new DBConnection().getStatement(query);
        try {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new Um();
                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));
                user.setAdmin(rs.getBoolean("admin"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }


    public List<Um> getUserList() {
        List<Um> userList = new ArrayList<>();
        String query = "select * from user";
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

    public List<Um> getYourProjectList(int uid) {
        System.out.println("getProjectList");
        List<Um> projectList = new ArrayList<>();
        String query = "select * from project where uid=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, uid);

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

    public void insertProject(Um project) {
        String query = "insert into project(name,uid,status)" + "values(?,?,'public')"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, project.getPname());
            preparedStatements.setInt(2, project.getId());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Um> getTaskList(int pid) {
        System.out.println("getTaskList");
        List<Um> taskList = new ArrayList<>();
        String query = "select * from task where pid=? ORDER BY date ASC";
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

    public void insertTask(Um task) {
        String query = "insert into task(date,tname,member,deliverable,image,pid)" + "values(?,?,?,?,?,?)"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, task.getTdate());
            preparedStatements.setString(2, task.getTname());
            preparedStatements.setString(3, task.getTaskMember());
            preparedStatements.setString(4, task.getDeliverable());
            preparedStatements.setString(5, task.getImge());
            preparedStatements.setInt(6, task.getPid());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Um> getTask(int tid) {
        System.out.println("getTaskList");
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
        String query = "update task set date=?,tname=?,member=?,deliverable=?,image=?," +
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

//    public Um MembersProcess(int pid){
//
//        Um user = null;
//        String query = "select uid from project where id!=?";
//        PreparedStatement ps = new DBConnection().getStatement(query);
//        try {
//            ps.setInt(1, pid);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                user = new Um();
//                user.setId(rs.getInt("uid"));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return user;
//    }

    public List<Um> getMembers(int pid) {
        System.out.println("getMemberList");
        List<Um> memberList = new ArrayList<>();
        String query = "select * from user where pid!=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, pid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));
                user.setPid(rs.getInt("pid"));
                user.setAdmin(rs.getBoolean("admin"));

                memberList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberList;
    }

    public List<Um> getSearchMembers(int pid, String sresult) {
        System.out.println("getProjectList");
        List<Um> memberList = new ArrayList<>();
        String query = "select * from user where fname LIKE ? and pid!=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setString(1, "%" + sresult + "%");
            pstm.setInt(2, pid);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Um user = new Um();

                user.setId(rs.getInt("uid"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fname"));
                user.setPassword(rs.getString("password"));
                user.setPid(rs.getInt("pid"));
                user.setAdmin(rs.getBoolean("admin"));

                memberList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return memberList;
    }

    public List<Um> getProjectDetail(int pid) {
        System.out.println("getProjectDetail");
        List<Um> projectList = new ArrayList<>();
        String query = "select * from project where pid=?";
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

    public void editProject(Um pdetail) {
        String query = "update project set name=?,status=?" +
                "where pid=?"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try {
            preparedStatements.setString(1, pdetail.getPname());
            preparedStatements.setString(2, pdetail.getPstatus());
            preparedStatements.setInt(3, pdetail.getPid());

            preparedStatements.execute();

        } catch (
                SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProject(int pid) {
        String query = "delete from project where pid = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try {
            ps.setInt(1, pid);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Um> getNotProjectList(int uid) {
        System.out.println("getProjectList");
        List<Um> projectList = new ArrayList<>();
        String query = "select * from project where uid!=?";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setInt(1, uid);

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

    public List<Um> getSearchProjectList(int uid, String sresult) {
        System.out.println("getProjectList");
        List<Um> projectList = new ArrayList<>();
        String query = "select * from project where name LIKE ? and uid!=? and status='public'";
        System.out.println(query);
        PreparedStatement pstm = new DBConnection().getStatement(query);
        try {
            pstm.setString(1, "%" + sresult + "%");
            pstm.setInt(2, uid);

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

}
