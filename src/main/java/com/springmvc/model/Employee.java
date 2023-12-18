package com.springmvc.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "employee_data")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@NotBlank(message = "Employee name is required")
	private String name;
	@NotBlank(message = "Employee city is required")
	private String city;
	@Size(max = 10, message = "Employee Number must be at most 10 characters")
	@Pattern(regexp = "\\d*", message = "Employee Number must contain only digits")
	private String number;
	@Size(max = 6, message = "Employee Number must be at most 10 characters")
	@Pattern(regexp = "\\d*", message = "Employee Number must contain only digits")
	private String pincode;

	@DecimalMax(value = "99999999.99", message = "Salary must be less than or equal to 99,999,999.99")
	private double salary;

	private String gender;

	private String date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Employee(int id, String name, String city, String number, String pincode, double salary, String gender,
			String date) {
		super();
		this.id = id;
		this.name = name;
		this.city = city;
		this.number = number;
		this.pincode = pincode;
		this.salary = salary;
		this.gender = gender;
		this.date = date;
	}

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", city=" + city + ", number=" + number + ", pincode="
				+ pincode + ", salary=" + salary + ", gender=" + gender + ", date=" + date + "]";
	}

}
