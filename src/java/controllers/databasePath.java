package controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author allcr
 */
public class databasePath extends HttpServlet {
    public String getDatabasePath() {
        ServletContext servletContext = getServletContext();
        String contextPath = servletContext.getRealPath("");
        return contextPath;
    }
}
