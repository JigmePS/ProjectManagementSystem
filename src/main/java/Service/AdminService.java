package Service;

import DBConnection.DBConnection;
import Model.Um;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    public void insertUser(Um user){
        String query = "insert into user(email, fname, password)" + "values(?,?,?)"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try{
            preparedStatements.setString(1, user.getEmail());
            preparedStatements.setString(2, user.getFullName());
            preparedStatements.setString(3, user.getPassword());

            preparedStatements.execute();

        }
        catch(
                SQLException e){
            e.printStackTrace();
        }
    }


    // Delete User
    public void deleteUser(int id){
        String query = "delete from user where uid = ?";
        PreparedStatement ps = new DBConnection().getStatement(query);

        try{
            ps.setInt(1,id);
            ps.execute();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(int id, Um user) throws SQLException{

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

    public Um getUser(String email, String password){

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

    public void insertProject(Um project){
        String query = "insert into project(name,uid)" + "values(?,?)"; // same as database

        PreparedStatement preparedStatements = new DBConnection().getStatement(query);  // execute parametrized query

        try{
            preparedStatements.setString(1, project.getPname());
            preparedStatements.setInt(2, project.getId());

            preparedStatements.execute();

        }
        catch(
                SQLException e){
            e.printStackTrace();
        }
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

//    public List<Um> getProjectList() {
//        System.out.println("getProjectList");
//        List<Um> projectList = new ArrayList<>();
//        String query = "select * from project";
//        System.out.println(query);
//        PreparedStatement pstm = new DBConnection().getStatement(query);
//        try {
//
//            ResultSet rs = pstm.executeQuery();
//            while (rs.next()) {
//                Um user = new Um();
//
//                user.setPid(rs.getInt("id"));
//                user.setPname(rs.getString("name"));
//                user.setId(rs.getInt("uid"));
//                user.setPstatus(rs.getInt("status"));
//
//                projectList.add(user);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return projectList;
//    }

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

}
