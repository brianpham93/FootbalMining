<%-- 
    Document   : testRapidMiner
    Created on : May 7, 2014, 3:03:21 PM
    Author     : thang_000
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.rapidminer.tools.XMLException"%>
<%@page import="com.rapidminer.example.ExampleSet"%>
<%@page import="com.rapidminer.operator.IOObject"%>
<%@page import="com.rapidminer.operator.IOContainer"%>
<%@page import="com.rapidminer.repository.IOObjectEntry"%>
<%@page import="com.rapidminer.repository.ProcessEntry"%>
<%@page import="com.rapidminer.repository.RepositoryLocation"%>
<%@page import="com.rapidminer.operator.OperatorException"%>
<%@page import="com.rapidminer.operator.OperatorCreationException"%>
<%@page import="com.rapidminer.operator.learner.bayes.NaiveBayes"%>
<%@page import="com.rapidminer.operator.io.ModelWriter"%>
<%@page import="com.rapidminer.tools.OperatorService"%>
<%@page import="com.rapidminer.operator.io.RepositorySource"%>
<%@page import="com.rapidminer.operator.Operator"%>
<%@page import="com.rapidminer.RapidMiner.ExecutionMode"%>
<%@page import="com.rapidminer.Process" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.rapidminer.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            try {
                // this initializes RapidMiner with your repositories available
                RapidMiner.setExecutionMode(ExecutionMode.COMMAND_LINE);
                RapidMiner.init();

// loads the process from the repository
                RepositoryLocation pLoc = new RepositoryLocation("//Local Repository/FootballMining/Data1Process");
                ProcessEntry pEntry = (ProcessEntry) pLoc.locateEntry();
                String processXML = pEntry.retrieveXML();
                Process myProcess = new Process(processXML);

// if need be, you can give the process IOObjects as parameter (this would be the case if you used the process input ports)
                RepositoryLocation loc = new RepositoryLocation("//Local Repository/FootballMining/Data1");
                IOObjectEntry entry = (IOObjectEntry) loc.locateEntry();
                IOObject myIOObject = entry.retrieveData(null);

// execute the process and get the resulting objects
                IOContainer ioInput = new IOContainer(new IOObject[]{myIOObject});
// just use myProcess.run() if you don't use the input ports for your process
                IOContainer ioResult = myProcess.run(ioInput);

// use the result(s) as needed, for example if your process just returns one ExampleSet, use this:
                if (ioResult.getElementAt(0) instanceof ExampleSet) {
                    ExampleSet resultSet = (ExampleSet) ioResult.getElementAt(0);
                    out.println(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
    </body>
</html>
