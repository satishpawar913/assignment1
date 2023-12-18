package com.springmvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.model.User;
import com.springmvc.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	private UserService userService;
	private Object logoutMessage;

	@RequestMapping("/signup")
	public String index(HttpSession session) {
		System.out.println("Creating Home");
		return "signup";
	}

	@RequestMapping("/")
	public String login() {
		System.out.println("this is home url");
		return "login";
	}

	@RequestMapping(path = "/processform", method = RequestMethod.POST)
	public String createUser(@ModelAttribute("user") User user, HttpSession session) {
		// Check if the email is already registered
		if (userService.isEmailAlreadyRegistered(user.getEmail())) {
			session.setAttribute("message", "Email is already registered, Please enter another email!");
			return "redirect:/signup";
		}
		// Proceed with user creation
		this.userService.createUser(user);
		return "login";
	}

	@RequestMapping(path = "/userlogin", method = RequestMethod.POST)
	public String loginpage(@RequestParam("email") String em, @RequestParam("password") String pwd,
			HttpSession session) {
		System.out.println("Hello login");

		User user1 = this.userService.showLogin(em, pwd);
		System.out.println(user1);

		if (user1 != null) {
			session.setAttribute("loginuser", user1);
			return "redirect:/listofemployee";
		} else {
			session.setAttribute("message", "Invalid email or password");
			return "redirect:/login";
		}

	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginuser");
		session.setAttribute("message", "logout successfully");
		session.setAttribute("message", logoutMessage);

		// Set a response header to instruct the browser not to cache the page
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		// Set an additional header to help with browser compatibility
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0); // Proxies.
		response.setHeader("Cache-Control", "no-store");

		// Use JavaScript to disable the back button
		String disableBackButtonScript = "<script>window.history.forward();</script>";
		response.getWriter().write(disableBackButtonScript);
		return "login";
	}

}
