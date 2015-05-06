package spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.model.Record;
import spring.dao.RecordDAO;


public class RecordServiceImpl implements RecordService {
	private RecordDAO recordDAO;
	 
	public void setRecordDAO(RecordDAO recordDAO) {
        this.recordDAO = recordDAO;
    }
	
	@Override
    @Transactional
    public List<Record> listRecords() {
        return this.recordDAO.listRecords();
    }
	
	
	@Override
    @Transactional
	public List<Record> queryRecordsByForm(String name, String rsnum){
		return this.recordDAO.queryRecordsByForm(name, rsnum);
	}
	
}
