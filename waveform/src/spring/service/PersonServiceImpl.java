package spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import spring.dao.PersonDAO;
import spring.model.Person;
 
// ?? why seperate services, feel liking provide an higher interfface accessed by controller
// flow : controller -> service -> dao, model is for DB entity 


@Service
public class PersonServiceImpl implements PersonService {
     
    private PersonDAO personDAO;
 
    public void setPersonDAO(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }
    
    // Transactional keyword is for Spring transaction protection
    @Override
    @Transactional
    public void addPerson(Person p) {
        this.personDAO.addPerson(p);
    }
 
    @Override
    @Transactional
    public void updatePerson(Person p) {
        this.personDAO.updatePerson(p);
    }
 
    @Override
    @Transactional
    public List<Person> listPersons() {
        return this.personDAO.listPersons();
    }
 
    @Override
    @Transactional
    public Person getPersonById(int id) {
        return this.personDAO.getPersonById(id);
    }
 
    @Override
    @Transactional
    public void removePerson(int id) {
        this.personDAO.removePerson(id);
    }
 
}
