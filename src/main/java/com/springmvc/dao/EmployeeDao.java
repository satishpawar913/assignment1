package com.springmvc.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.springmvc.model.Employee;

@Component
public class EmployeeDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void saveEmpolyeeData(Employee employee) {
		this.hibernateTemplate.saveOrUpdate(employee);

	}

	public List<Employee> getAllEmp() {
		List<Employee> list = this.hibernateTemplate.loadAll(Employee.class);
		return list;
	}

	public Employee getEmpolyee(int id) {
		return this.hibernateTemplate.get(Employee.class, id);
	}

	@Transactional
	public void deleteEmpolyee(int id) {
		Employee employee = this.hibernateTemplate.load(Employee.class, id);
		this.hibernateTemplate.delete(employee);
	}

}
