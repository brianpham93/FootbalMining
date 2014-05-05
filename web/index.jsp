<%-- 
    Document   : index
    Created on : May 5, 2014, 3:45:33 AM
    Author     : thang_000
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="weka.core.converters.ConverterUtils.DataSource" %>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Random"%>
<%@page import="weka.classifiers.Evaluation" %>
<%@page import="weka.classifiers.trees.J48" %>
<%@page import="weka.clusterers.SimpleKMeans" %>
<%@page import="weka.core.Instances"%>
<%@page import="weka.core.converters.ArffLoader" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <label>Home Team</label>
        <%
            
            try {
                Connection con = ODBCConnection.ODBCconnection.getConnection();
                Statement st = con.createStatement();
                String queryString;
                queryString = "SELECT Team FROM HomeResults";
                ResultSet rs = st.executeQuery(queryString);
                
                out.println("<select>");
                while (rs.next()) {
                    String team = rs.getString("Team");
                    out.println("<option value =" + team + ">" + team + "</option>");
                }
                out.println("</select>");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
            /*s
             try {
             DataSource source = new DataSource("C:\\Users\\thang_000\\Documents\\NetBeansProjects\\FootbalMining\\web\\data.arff");
             Instances instances = source.getDataSet();
             // setting class attribute if the data format does not provide this information
             // For example, the XRFF format saves the class attribute information as well

             //clustering K-mean
             //            SimpleKMeans kmean = new SimpleKMeans();
             //            String[] options = weka.core.Utils.splitOptions("-N 2 -A \"weka.core.EuclideanDistance -R first-last\" -I 500 -S 10");
             //            kmean.setOptions(options);
             //            kmean.buildClusterer(instances);
             //            // print out clustering result
             //            out.println(kmean.toString());
             instances.setClassIndex(instances.numAttributes() - 1);
             J48 j48 = new J48();
             String[] options = weka.core.Utils.splitOptions("-C 0.25 -M2");
             j48.setOptions(options);
             j48.buildClassifier(instances);
             //10 fold -crossValidation
             Evaluation evaluation = new Evaluation(instances);
             evaluation.crossValidateModel(j48, instances, 10, new Random(1));
             out.print(evaluation.toSummaryString());

             } catch (NullPointerException e) {
             //e.printStackTrace();
             out.print(e.getCause());
             } catch (Exception e) {
             out.print(e.getMessage());
             }*/
        %>
        <label>Away Team</label>
        <%
            try {
                Connection con = ODBCConnection.ODBCconnection.getConnection();
                Statement st = con.createStatement();
                String queryString;
                queryString = "SELECT Team FROM AwayResults";
                ResultSet rs = st.executeQuery(queryString);
                
                out.println("<select>");
                while (rs.next()) {
                    String team = rs.getString("Team");
                    out.println("<option value =" + team + ">" + team + "</option>");
                }
                out.println("</select>");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
        
        <input type ="button" value ="Calculate">
    </body>


</html>
