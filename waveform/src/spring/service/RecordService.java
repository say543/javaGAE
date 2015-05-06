package spring.service;

import java.util.List;

import spring.model.Record;

public interface RecordService {
	
	public List<Record> listRecords();
	
	public List<Record> queryRecordsByForm(String name, String rsnum);
	
}
