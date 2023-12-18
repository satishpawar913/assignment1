package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.springmvc.dao.EmployeeDao;
import com.springmvc.model.Employee;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeDao empolyeeDao;

	@RequestMapping("/listofemployee")
	public String crud(Model m) {
		System.out.println("This is crud controller!");
		List<Employee> employees = empolyeeDao.getAllEmp();
		m.addAttribute("employees", employees);
		return "index";
	}

	@RequestMapping("/add-employee")
	public String addEmployee(Model m) {
		m.addAttribute("title", "Add Employee");
		return "empolyee_form";
	}

	@RequestMapping(path = "/handle-employee", method = RequestMethod.POST)
	public RedirectView handleEmpolyee(@ModelAttribute Employee empolyee, HttpServletRequest request) {
		empolyeeDao.saveEmpolyeeData(empolyee);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/listofemployee");
		return redirectView;
	}

	@RequestMapping("/delete/{id}")
	public RedirectView deleteEmpolyee(@PathVariable("id") int id, HttpServletRequest request) {

		this.empolyeeDao.deleteEmpolyee(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/listofemployee");
		return redirectView;
	}

	@RequestMapping("/update/{id}")
	public String updateEmpolyee(@PathVariable("id") int id, Model m) {

		Employee employee = this.empolyeeDao.getEmpolyee(id);
		m.addAttribute("employee", employee);
		return "update_form";

	}

}
