package cn.dtw.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Distinguish  extends HttpFilter {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6884283375635494551L;

	@Override
	public void destroy() {
		System.out.println("filter destory");

	}

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		System.out.println(111111);
		Object obj= req.getSession().getAttribute("user");
		if(obj==null) {
			System.out.println(222222);
			req.getRequestDispatcher("index.html").forward(req, resp);
			System.out.println(333333);
		}
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("filter init");

	}

}
