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
        <meta charset="UTF-8">
        <title>Super Project</title>
        <meta name="description" content="Predict football result">
        <meta name="keywords" content="keyword1, keyword2, keyword3">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="container">
            <div id="header"> <img src="images/logo.jpg" alt="" id="logo">
                <h1 id="logo-text">Predict football results : Premiere League</h1>
            </div>
            <div id="nav">
                <ul>
                    <li><a href="#" onClick = "window.location = 'index.html'">Home</a></li>
                    <li><a href="#aboutUs">About&nbsp;us</a></li>
                    <li><a href="#email">Email</a></li>
                    <li><a href="#" onClick = "window.location = 'resources.html'">Resources</a></li>
                    <li style="border-right: medium none;"><a href="#" onClick = "window.location = 'links.html'">Links</a></li>
                </ul>
            </div>
            <div id="site-content">
                <div id="col-left">
                    <h1 class="h-text-1">Predict the score</h1>
                    <p class="text-1">
                    <form method="POST">
                        <label>Home Team</label>
                        <%

                            try {
                                Connection con = ODBCConnection.ODBCconnection.getConnection();
                                Statement st = con.createStatement();
                                String queryString;
                                queryString = "SELECT Team FROM HomeResults";
                                ResultSet rs = st.executeQuery(queryString);

                                out.println("<select name ='hometeam'>");
                                while (rs.next()) {
                                    String team = rs.getString("Team");
                                    out.println("<option value ='" + team + "'>" + team + "</option>");
                                }
                                out.println("</select>");
                            } catch (Exception e) {
                                out.print(e.getMessage());
                            }


                        %>
                        <label>Away Team</label>

                        <%
                            try {
                                Connection con = ODBCConnection.ODBCconnection.getConnection();
                                Statement st = con.createStatement();
                                String queryString;
                                queryString = "SELECT Team FROM AwayResults";
                                ResultSet rs = st.executeQuery(queryString);

                                out.println("<select name='awayteam'>");
                                while (rs.next()) {
                                    String team = rs.getString("Team");
                                    out.println("<option value ='" + team + "'>" + team + "</option>");
                                }
                                out.println("</select>");
                            } catch (Exception e) {
                                out.print(e.getMessage());
                            }
                        %>
                        <br>
                        <label for="season">Season</label>
                        <select id ="season" name ="season">
                            <option value ="Spring">Spring</option>
                            <option value ="Summer">Summer</option>
                            <option value ="Autumn">Autumn</option>
                            <option value ="Winter">Winter</option>
                        </select>
                        <label for="stadium">Stadium</label>
                        <select id ="stadium" name ="stadium">
                            <option value="H">Home</option>
                            <option value ="A">Away</option>
                        </select>
                        <br>
                        <input type ="submit" value ="Calculate">
                    </form>
                    <%
                        String homeTeam = request.getParameter("hometeam");
                        String awayTeam = request.getParameter("awayteam");
                        String date = request.getParameter("season");
                        String place = request.getParameter("stadium");
                        String result = "unknown";

                        
                        if(homeTeam.equalsIgnoreCase("Swansea") && awayTeam.equalsIgnoreCase("Arsenal")){
                            result ="lose";
                        }

                        out.println(homeTeam);
                        out.println(awayTeam);
                        out.println(date);
                        out.println(place);
                        out.print(result);


                    %>



                    </p>

                    <p class="border-1">&nbsp;</p>
                    <h2 id="aboutUs" class="h-text-2">About us</h2>
                    <p class="text-1">We are a wonderful team of foreigner students from France and Vietnam.</p>
                    <p class="text-1">Our names are An, Margaux, Thang and Matthew but we prefer to call us Dream Team.</p>
                </div>
                <div id="col-right">
                    <div style="padding: 30px 10px 10px;">
                        <h2 class="h-text-2">Latest News</h2>
                        <p class="text-2">West Brom		3-3 	Tottenham</p>
                        <p class="text-2">Sunderland		0-1 	Everton</p>
                        <p class="text-2">Stoke City		1-0 	Newcastle</p>
                        <p class="text-2">Southampton		0-1 	Cardiff City</p>
                        <p class="text-2">Fulham		1-0 	Norwich</p>
                        <p class="text-2">Crystal Palace	1-0 	Aston Villa</p>
                        <p class="text-2">Liverpool		3-2 	Manchester City</p>
                        <p class="text-2">Swansea City		0-1 	Chelsea</p>
                        <p class="text-2">Arsenal		3-1 	West Ham</p>
                        <p class="text-2">Manchester United		3-1 	Hull City</p>
                    </div>
                    <div>&nbsp;</div>
                    <div style="padding: 5px 10px;">
                        <h2 id="email" class="h-text-2">Contact Info</h2>
                    </div>
                    <div
                        style="padding: 5px 10px 15px; background: rgb(216, 214, 215) none repeat scroll 0%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial;">
                        <p class="text-2"> meowwwwwwww<br>
                            <br>
                            E.mail: superproject@cat<br>
                            <br>
                            Fax: cat.cat.cat.cat<br>
                            <br>
                            Phone: meow.meow/<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            000.000.0000 </p>
                    </div>
                </div>
            </div>
            <div id="footer">
                <!--DO NOT Remove The Footer Links-->
                <!--Designed by--><a href="http://www.htmltemplates.net">
                    <img src="images/footnote.gif" class="copyright" alt="html templates"></a>

                <ul class="footer-nav">
                    <li><a href="#" onClick = "window.location = 'index.html'">Home</a></li>
                    <li><a href="#aboutUs">About us</a></li>
                    <li><a href="#email">Email</a></li>
                    <li><a href="#" onClick = "window.location = 'resources.html'">Resources</a></li>
                    <li><a href="#" onClick = "window.location = 'links.html'">Links</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
