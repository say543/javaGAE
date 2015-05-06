package spring.dao;

import java.util.List;

import spring.model.Record;

public interface RecordDAO {
	
	/*public void addRecord(Record p);
    public void updateRecord(Record p);*/
    public List<Record> listRecords();
    /*public Record getRecordById(int id);
    public void removeRecord(int id);*/
    
    public List<Record> queryRecordsByForm(String name, String rsnum);
}
