package waveform;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


// for restful
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;













// for service
import spring.model.Person;
import spring.service.PersonService;
import spring.model.Record;
import spring.service.RecordService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

 
/*
 * author: Crunchify.com
 * 
 */

 
@RestController
//@Controller
//@RequestMapping("/welcome")
public class WaveformController {

	// add link to personSerivce link to controller
	private PersonService personService;
	// add link to personSerivce link to controller
	private RecordService recordService;
	
	// autowire
	// http://www.tutorialspoint.com/spring/spring_autowired_annotation.htm
	// no need to add property element to  "id and class definatio"(this is still needed) in beans.xml
	// Qualifier ?? here i do not think qualified is must
	// http://www.tutorialspoint.com/spring/spring_qualifier_annotation.htm
	// many instances having different beans scan be binded to list object, trying to speicify which one should be bind
	/*@Autowired(required=true)
    @Qualifier(value="personService")
    public void setPersonService(PersonService ps, RecordService rs){
        this.personService = ps;
    }*/
	// http://www.mkyong.com/spring/spring-autowiring-qualifier-example/
	// 20150330 change to new method without passing arugment to constructor
	@Autowired(required=true)
    @Qualifier(value="personService")
    public void setPersonService(PersonService ps){
        this.personService = ps;
    }
	@Autowired(required=true)
    @Qualifier(value="recordService")
    public void setRecordService(RecordService rs){
        this.recordService = rs;
    }
	
	
	
 
	//original no argument
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
 
		String message = "<br><div align='center'>"
				+ "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is comming from CrunchifyHelloWorld.java **********<br><br>";
		return new ModelAndView("welcome", "message", message);
	}
	
	// GET get variable
	@RequestMapping(value = {"/welcome/{index1}/{index2}"}, method = RequestMethod.GET)
	public ModelAndView helloWorldWithArgu(@PathVariable("index1") String index1, @PathVariable("index2") String index2 ) {
	 
		String message = "<br><div align='center'>"
				+ "<h3>**********"+index1 + " "+index2  +"</h3>This message is comming GET **********<br><br>";
		return new ModelAndView("welcome", "message", message);
	}
	
	
	
	@RequestMapping("/form")
	public ModelAndView helloWorldForm() {
 
		//String message = "<br><div align='center'>"
		//		+ "<h3>********** Hello World, this is form in controller **********<br><br>";
		String message = "";
		return new ModelAndView("form", "message", message);
	}
	
	/*@RequestMapping("/formAndDisplay")
	public ModelAndView formAndDisplay() {
 
		//String message = "<br><div align='center'>"
		//		+ "<h3>********** Hello World, this is form in controller **********<br><br>";
		String message = "";
		return new ModelAndView("formAndDisplay", "message", message);
	}*/
	
	
	
	
	
	// GET get variable
	// this is the version without question mark
	/*@RequestMapping(value = {"/submit/{index1}/{index2}"}, method = RequestMethod.GET)
	public ModelAndView submitForm(@PathVariable("index1") String index1, @PathVariable("index2") String index2 ) {
 
		String message = "<br><div align='center'>"
				+ "<h3>**********"+index1 + " "+index2  +"</h3>This message is comming GET **********<br><br>";
		return new ModelAndView("submitVerify", "message", message);
	}*/
	
	// GET get variable
	// this is the version without question mark
	@RequestMapping("/formAndDisplay")
	public ModelAndView submitForm(@RequestParam(value = "name", required = false, defaultValue = "") String index1, @RequestParam(value = "rsnum", required = false, defaultValue = "") String index2 ) {
 
		//List<Person> personlist =  this.personService.listPersons();
		
		//StringBuffer sb = new StringBuffer(); 
		
		String message = "<div align='center'>"
				+ "<h3>**********"+index1 + " "+index2  +"</h3>This message is comming GET **********</div>";
		
		// toward to the different page
		//ModelAndView model = new ModelAndView("submitVerify");
		// toward to the same page
		ModelAndView model = new ModelAndView("formAndDisplay");
		
		model.addObject("index1",index1);
		model.addObject("index2",index2);
		
		
		//-----------------------------------
		// SQL connection test flow ok
		//-----------------------------------
		/*
		// JDBC driver name and database URL
	    final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	    final String DB_URL="jdbc:mysql://localhost:3306/sakila";

	      //  Database credentials
	    final String USER = "root";
	    final String PASS = "ve81P491@";

	      // Set response content type
	      //response.setContentType("text/html");
	      //PrintWriter out = response.getWriter();
	      String title = "Database Result";

	      Connection conn = null;
	      Statement stmt = null;
	      try{
	         // Register JDBC driver
	         Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);

	         // Execute SQL query
	         stmt = conn.createStatement();
	         String sql;
	         sql = "select * from person";
	         ResultSet rs = stmt.executeQuery(sql);

	         // Extract data from result set
	         while(rs.next()){
	            //Retrieve by column name
	            int id  = rs.getInt("id");
	            String first = rs.getString("name");
	            
	            System.out.print(id+" ");
	            System.out.println(first);
	            
	         }

	         // Clean-up environment
	         rs.close();
	         stmt.close();
	         conn.close();
	      }catch(SQLException se){
	         //Handle errors for JDBC
	         se.printStackTrace();
	      }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	      }finally{
	         //finally block used to close resources
	         try{
	            if(stmt!=null)
	               stmt.close();
	         }catch(SQLException se2){
	         }// nothing we can do
	         try{
	            if(conn!=null)
	            conn.close();
	         }catch(SQLException se){
	            se.printStackTrace();
	         }//end finally try
	      } //end try
		*/
		
		
		//-----------------------------------
		// HSQL query list perosn done
		//-----------------------------------
		/*
		//model.addObject("person", new Person());
		if (personService != null){
			List<Person> arr = this.personService.listPersons();
			
			//List<String> tarr = new ArrayList<String>();
			for (Person a : arr){
				// has retrived thing inside but model does not get
				//System.out.println(a.getId());
				//System.out.println(a.getName());
				//tarr.add(a.getName());
			}
			model.addObject("listPersons", arr);
			//model.addObject("listPersons", tarr);
		}
		
		return model;
		*/
		//-----------------------------------
		// HSQL query list record done
		//-----------------------------------
		/*if (recordService != null){
			List<Record> arr = this.recordService.listRecords();
			
			//List<String> tarr = new ArrayList<String>();
			for (Record r : arr){
				// has retrived thing inside but model does not get
				System.out.println(r.getId());
				System.out.println(r.getName());
				System.out.println(r.getRsnum());
			}
			model.addObject("listRecords", arr);
		}
		
		return model;*/
		//-----------------------------------
		// HSQL query record by name done
		//-----------------------------------
		
		
		boolean inputEmpty = index1.equals("") && index2.equals(""); 
		if (recordService != null && !inputEmpty){
			List<Record> arr = this.recordService.queryRecordsByForm(index1, index2);
			
			//List<String> tarr = new ArrayList<String>();
			for (Record r : arr){
				// has retrived thing inside but model does not get
				System.out.println(r.getId());
				System.out.println(r.getName());
				System.out.println(r.getRsnum());
			}
			model.addObject("listRecords", arr);
		}
		
		return model;
		
		
		
		
		//return new ModelAndView("submitVerify", "message", message);
	}	
	
	
	
	
	//@RequestMapping(value = {"/welcome{index1}/{index2}/"}, method = RequestMethod.GET)
	
	// mapping only can be the method ?? do not know why
	/*@RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
	public ModelAndView helloWorld() {
 
		String message = "<br><div align='center'>"
				+ "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is comming from CrunchifyHelloWorld.java **********<br><br>";
		return new ModelAndView("welcome", "message", message);
	}*/
	
	
	
	
	
}
