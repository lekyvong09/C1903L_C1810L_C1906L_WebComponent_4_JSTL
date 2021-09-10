package com.ray.jstl.servlets;

import com.ray.jstl.models.City;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "FileUploadServlet", value = "/fileuploadservlet")
@MultipartConfig(
        fileSizeThreshold = 1024*1024*1,    // 1MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class FileUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        for (Part part: request.getParts()) {
            part.write(getServletContext().getInitParameter("uploadPath") + fileName);
        }

        HttpSession s = request.getSession();
        City tempCity = (City) s.getAttribute("theCity");
        tempCity.setImageUrl(fileName);

        s.setAttribute("theCity", tempCity);

       // response.getWriter().print(getServletContext().getInitParameter("uploadPath") + fileName);
        response.sendRedirect(getServletContext().getInitParameter("hostURL")
                + getServletContext().getContextPath() + "/Protected/updateCity.jsp");
    }
}
