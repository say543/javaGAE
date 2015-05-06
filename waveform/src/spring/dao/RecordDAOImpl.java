package spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import spring.model.Record;

@Repository
public class RecordDAOImpl implements RecordDAO {

	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Record> listRecords() {
        Session session = this.sessionFactory.getCurrentSession();
        // inside ("from record is to retrive from table record")
        List<Record> recordsList = session.createQuery("from Record").list();
        for(Record r : recordsList){
            logger.info("Record List::"+r);
        }
        return recordsList;
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Record> queryRecordsByForm(String name, String rsnum){
    	
    	//query string 
    	StringBuffer sb = new StringBuffer();
    	if (!name.equals("") ){
    		if (sb.length()  > 0 )
    			sb.append("and ");
    		sb.append("name = '"+name+"' ");
    	}
    	if (!rsnum.equals("")){
    		if (sb.length()  > 0 )
    			sb.append("and ");
    		sb.append("rsnum = '"+rsnum+"' ");
    	}
    	
    	StringBuffer qsb = new StringBuffer();
    	qsb.append("from Record where ");
    	qsb.append(sb);
    	
    	
    	//System.out.println(qsb.toString());
    	
    	Session session = this.sessionFactory.getCurrentSession();
    	/*List<Record> recordsList = session.createQuery(
    			"from Record where name = :name")
    			.setParameter("name", name).list();*/
    	List<Record> recordsList = session.createQuery(
    			qsb.toString()).list();
    	
    	
    	//select record0_.id as id1_0_, record0_.name as name2_0_, record0_.rsnum as rsnum_ from RECORD record0_
    	
    	for(Record r : recordsList){
            logger.info("Record List::"+r);
        }
        return recordsList;
	}
    
    
}
