package com.ray.jstl.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
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

        //response.getWriter().print("The file uploaded successfully");
        response.getWriter().print(getServletContext().getInitParameter("uploadPath") + fileName);
    }
}
