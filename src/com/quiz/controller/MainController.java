package com.quiz.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quiz.model.Admin;
import com.quiz.model.Question;
import com.quiz.model.Quiz;
import com.quiz.model.Settings;
import com.quiz.model.Student;
import com.quiz.model.UserLogin;
import com.quiz.model.UserRegister;
import com.quiz.service.QuestionService;
import com.quiz.service.QuizService;
import com.quiz.service.SettingsService;
import com.quiz.service.StudentService;
import com.quiz.service.UserService;

@Controller
public class MainController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	QuestionService questionService;
	@Autowired
	SettingsService settingsService;
	@Autowired
	QuizService quizService;
	@Autowired
	StudentService studentService;
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session; 

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView doStart() {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public String validate(@ModelAttribute("admin") Admin ob, Model md) {
		String uName = ob.getuName();
		String uPass = ob.getuPassword();
		md.addAttribute("uData", ob);
		if ("admin".equals(uName) && "admin".equals(uPass)) {
			session.setAttribute("user",1);
			return ("redirect:/home");
		}
		else {
			md.addAttribute("message", "Invalid Credentials");
			return "login";
		}
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		List<Quiz> quiz = quizService.getDetails();
		model.addAttribute("h", quiz);
		return "home";
	}
	
	String quizName;
	@RequestMapping(value = "/applySettings", method = RequestMethod.POST)
	public String applySettings(@ModelAttribute("insert") Settings obz) {
		settingsService.applySettings(obz);
		quizName = obz.getzName();
		return "chooseFirst"; 
	}

	@RequestMapping("/quizSettings")
	public String quizSettings(Model theModel2) {
		theModel2.addAttribute("insert", new Settings());
		return "quizSettings";
	}
	
	@RequestMapping(value = "/insertQuestion", method = RequestMethod.POST)
	public String insertQuestion(@ModelAttribute("insert") Question obq) {
		questionService.insertQuestion(obq);
		return "chooseFirst"; 
	}

	@RequestMapping("/addQuestion")
	public String addQuestion(Model theModel1) {
		theModel1.addAttribute("insert", new Question());
		return "addQuestion";
	}

	@RequestMapping(value = "/selectQuestions", method = { RequestMethod.POST, RequestMethod.GET})
	public String selectQuestions(Model mdS) {
		List<Question> sel1 = questionService.getCQuestions();
		List<Question> sel2 = questionService.getDSQuestions();
		mdS.addAttribute("C", sel1);
		mdS.addAttribute("DS", sel2);
		return "chooseQuestions";
	}

	List<String> qSet = new ArrayList<String>();
	String qIdSet;
	
	
	@RequestMapping("/finalSet")
	public String finalSet(Model theModel3) {
		List<Question> sel1 = questionService.getCQuestions();
		List<Question> sel2 = questionService.getDSQuestions();
		theModel3.addAttribute("C", sel1);
		theModel3.addAttribute("DS", sel2);
		List<String> selectedQ = Arrays.asList(request.getParameterValues("selectQ"));
		qIdSet = questionService.getQuesId(selectedQ);
		for(int i=0;i<selectedQ.size();i++) {
			qSet.add(selectedQ.get(i));
		}
		theModel3.addAttribute("finall", qSet);
		return "quesSet";
	}
	
	@RequestMapping(value = "/createQuiz", method = RequestMethod.POST)
	public String createQuiz(@ModelAttribute("create") Quiz obquiz) {
		obquiz.setQuizName(quizName);
		obquiz.setUrl("myquiz.quizwhiz/?id="+quizName);
		obquiz.setQues_Set(qIdSet);
		quizService.createQuiz(obquiz);
		qSet.clear();
		return "redirect:/home";
	}

	@RequestMapping("/report")
	public String report(Model model2) {
		List<Student> student = studentService.getData();
		model2.addAttribute("student",student);
		return "report";
	}
	
	@RequestMapping("/cancel")
	public String cancel() {
		return "redirect:/home";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "login";
	}
	
	List<Quiz> tempQuiz= new ArrayList<Quiz>();
	String urlId = "";
	@RequestMapping(value = "/myquiz.quizwhiz/userLog", method = RequestMethod.POST)
	public String userLog(@ModelAttribute("userLogin") UserLogin ul, Model mdu) {
		String un = ul.getUserName();
		String ps = ul.getUserPass();
		List<UserRegister> ob = userService.checkUser();
		int flag = 0;
		for(UserRegister tr : ob) {
			if(un.equals(tr.getUserName()) && ps.equals(tr.getUserPass())) {
				flag = 1;
				break;
			}
		}
		int dur = 0;
		if(flag==0) {
			mdu.addAttribute("message", "Invalid Credentials");
			return "userHome";
		}
		else {
			List<Settings> ls = settingsService.outOf(urlId);
			for(Settings t : ls) {
				dur = t.getzDuration();
				break;
			}
			List<Quiz> exam = quizService.getPartDetails(urlId);
			List<Question> ques = questionService.getQuestions();
			tempQuiz.clear();
			tempQuiz = new ArrayList<Quiz>(exam);
			mdu.addAttribute("exam", exam);
			mdu.addAttribute("ques", ques);
			mdu.addAttribute("dur", dur);
			return "test";
		}
	}
	
	@RequestMapping("/userHome")
	public String userHome() {
		return "userHome";
	}
		
	@RequestMapping(value = "/myquiz.quizwhiz/userReg", method = RequestMethod.POST)
	public String userReg(@ModelAttribute("userRegister") UserRegister ur) {
		userService.insertUser(ur);
		return "userHome"; 
	}
	
	@RequestMapping(value = "/myquiz.quizwhiz/", method = RequestMethod.GET)
	public String test(@RequestParam("id") String id, Model md) {
		urlId = id;
		return "userHome";
	}
	
	@RequestMapping(value = "/myquiz.quizwhiz/testAnswers", method = RequestMethod.POST)
	public String evaluate(@ModelAttribute("answers") Student stu) {
		Enumeration enumeration = request.getParameterNames();
		List<String> en= new ArrayList<String>();
		while(enumeration.hasMoreElements()) {
			en.add((String) enumeration.nextElement());
		}
		List<String> ans = new ArrayList<String>();
		for(String tt : en.subList( 1, en.size() )) {
			ans.add(request.getParameter(tt));
		}
		
		String ansString = "";
		for(String tmp: ans) {
			ansString = ansString.concat(tmp+"#");
		}
		stu.setAnswer(ansString);
		List<Question> allQues = questionService.getQuestions();
		
		String allQ = "";
		for (Quiz t : tempQuiz) {
			allQ = t.getQues_Set();
			break;
		}
		List<String> sepQ = Arrays.asList(allQ.split("#"));
		List<String> sepA = Arrays.asList(ansString.split("#"));
		List<String> tmpAns = new ArrayList<String>();
		
		for (String t : sepQ) {
			for (Question q : allQues) {
				if (q.getqQuestion().equals(t)) {
					tmpAns.add(q.getqCorrect());
				}
			}
		}
		int total = 0;
		for(String cA : sepA) {
			for(String uA : tmpAns) {
				if (cA.equals(uA)) {
					total+=1;
				}
			}
		}
		stu.setScore(total);
		stu.setContest(urlId);
		List<Settings> ls = settingsService.outOf(urlId);
		for(Settings t : ls) {
			stu.setOutoff(t.getzMarks());
			break;
		}
		studentService.evaluate(stu);		
		return "feed";
	}
	
}