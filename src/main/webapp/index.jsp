<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.techno.demo.Employee" %>
<html>
<head>
<title>Annotation Web</title>
</head>
<body>

<% 
try{
Configuration configuration=new Configuration();
configuration.configure("hibernate.cfg.xml");
SessionFactory factory=configuration.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
Session sess=factory.openSession();
sess.beginTransaction();
Employee e1=new Employee();
//e1.setId(1);
e1.setFirstName("Deepanshu");
e1.setLastName("Gupta");
sess.save(e1);
sess.getTransaction().commit();
out.println("Successfully Saved");
out.println("<br>+*********************************+");
Query query=sess.createQuery("from Employee");
List<Employee> empList=query.list();
for(Employee emp:empList){
	out.println("<br/>id:\t"+emp.getId()+"\tFirst Name:-\t"+emp.getFirstName()
	+"\tLast Name:"+emp.getLastName()
			);
	
	
}
sess.close();
factory.close();}catch(Exception e){
	out.println(e.getMessage());
}
%>
</body>
</html>