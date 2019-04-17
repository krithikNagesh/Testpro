package com.yi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.db.QuestImpl;

/**
 * Servlet implementation class HomServlet
 */
@WebServlet("/HomServlet")
public class HomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		HttpSession session=request.getSession(true);
		PrintWriter out=response.getWriter();
		RequestDispatcher rd=null;
		QuestImpl questImpl=new QuestImpl();
		String reqpage= request.getParameter("process");
		String product= request.getParameter("productLooking");
		String environment=request.getParameter("environment");
		String envQuest= request.getParameter("envQuestionReq");
		String quest=request.getParameter("questionReq");
		String selCateg=request.getParameter("questionType");
		String catType=request.getParameter("catProd");
		
		String delProd_id=request.getParameter("delProd");
		String delEnv_id=request.getParameter("delEnv");
		String delProduct=request.getParameter("Delete Product Question");
		if(product!=null)
	{try{
		//System.out.println("product====================="+product);
		request.setAttribute("product_id", product);
		rd= request.getRequestDispatcher("/Question.jsp");
		rd.forward(request, response);
	}catch (Exception e) {
		System.out.println("Servlet:Problem in Homepage");
		e.printStackTrace();
	}
	}
				
		if(quest!=null)
			{try{
				//System.out.println("question====================="+quest);
				request.setAttribute("question_number", quest);
				rd= request.getRequestDispatcher("/Answer.jsp");
				rd.forward(request, response);
			}
			catch (Exception e) {
				System.out.println("Servlet:Problem in Question page");
				e.printStackTrace();
			}
			}
		
		
		if(environment!=null)
		{try{
			//System.out.println("environment====================="+environment);
			request.setAttribute("environment_id", environment);
			rd= request.getRequestDispatcher("/EnvQuestion.jsp");
			rd.forward(request, response);
		}catch (Exception e) {
			System.out.println("Servlet:Problem in EnvQuestion");
			e.printStackTrace();
		}
		}
		
		if(envQuest!=null)
		{try{
			//.out.println("envQuest====================="+envQuest);
			request.setAttribute("env_question_number", envQuest);
			rd= request.getRequestDispatcher("/EnvAnswer.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			//System.out.println("Servlet:Problem in Environment Question page");
			e.printStackTrace();
		}
		}
		
		/*if(selCateg!=null)
		{try{
			System.out.println("selCateg====================="+selCateg);
			request.setAttribute("category", selCateg);
			rd= request.getRequestDispatcher("/AddAdmin.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			System.out.println("Servlet:Problem in AddAdmin page");
			e.printStackTrace();
		}
		}
		
		if(catType!=null)
		{try{
			System.out.println("selCateg====================="+selCateg);
			request.setAttribute("category", selCateg);
			rd= request.getRequestDispatcher("/AddAdmin.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			System.out.println("Servlet:Problem in Question page");
			e.printStackTrace();
		}
		}*/
		
		if(delProd_id!=null)
		{try{
			//System.out.println("delProd_id====================="+delProd_id);
			request.setAttribute("delProd_id", delProd_id);
			rd= request.getRequestDispatcher("/DeleteAdminP.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			System.out.println("Servlet:Problem in Question page");
			e.printStackTrace();
		}
		}
		
		
		if(delEnv_id!=null)
		{try{
			//System.out.println("delEnv_id====================="+delEnv_id);
			request.setAttribute("delEnv_id", delEnv_id);
			rd= request.getRequestDispatcher("/DeleteAdminE.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			System.out.println("Servlet:Problem in Delete Env page");
			e.printStackTrace();
		}
		}
		
		if(reqpage!=null){
			
			
			if(reqpage.equalsIgnoreCase("Login")){				
				try {
					String userName= (String)request.getParameter("username");
					String userPassword= (String)request.getParameter("userpass");
					
					if(questImpl.validate(userName,userPassword)){  
						rd=request.getRequestDispatcher("Admin.jsp");	
						rd.forward(request, response);	
				    }  
				    else{  
				        out.print("Sorry username or password error"); 
				        
				        rd=request.getRequestDispatcher("InvalidCred.jsp");  
				        rd.forward(request,response);  
				    }  
					
					
				}catch (Exception e) {
					System.out.println("Servlet:Problem in AddAdminP page");
					e.printStackTrace();
				}
			}
			
			if(reqpage.equalsIgnoreCase("Add")){				
				try {
					String id= (String)request.getParameter("catProd");
					String questions= (String)request.getParameter("pQuest");
					String answers= (String)request.getParameter("pAns");
					questImpl.addProductQuestion(id, questions, answers);
					rd=request.getRequestDispatcher("Success.jsp");	
					rd.forward(request, response);	
				}catch (Exception e) {
					System.out.println("Servlet:Problem in AddAdminP page");
					e.printStackTrace();
				}
			}
			
			if(reqpage.equalsIgnoreCase("Add Question")){				
				try {
					String id= (String)request.getParameter("envProd");
					String questions= (String)request.getParameter("eQuest");
					String answers= (String)request.getParameter("eAns");
					questImpl.addEnvironmentQuestion(id, questions, answers);
					rd=request.getRequestDispatcher("Success.jsp");	
					rd.forward(request, response);	
				}catch (Exception e) {
					System.out.println("Servlet:Problem in AddAdminE page");
					e.printStackTrace();
				}
			}
			
			
			
			
			if(reqpage.equalsIgnoreCase("Delete Product Question")){				
				try {	
					
					String questions= (String)request.getParameter("delProdQuest");	
					
					questImpl.deleteProductQuestion(questions);
					rd=request.getRequestDispatcher("Success.jsp");	
					rd.forward(request, response);	
				}catch (Exception e) {
					System.out.println("Servlet:Problem in DeleteP page");
					e.printStackTrace();
				}
			}
			
			if(reqpage.equalsIgnoreCase("Delete Environment Question")){				
				try {	
					
					String questions= (String)request.getParameter("delEnvQuest");	
					
					questImpl.deleteEnvironmentQuestion(questions);
					rd=request.getRequestDispatcher("Success.jsp");	
					rd.forward(request, response);	
				}catch (Exception e) {
					System.out.println("Servlet:Problem in DeleteE page");
					e.printStackTrace();
				}
			}
		}
		
		doGet(request, response);
	}

}
