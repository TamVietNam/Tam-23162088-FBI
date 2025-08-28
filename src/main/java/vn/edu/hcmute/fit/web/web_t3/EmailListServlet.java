package vn.edu.hcmute.fit.web.web_t3;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/emailList") // <-- Mapping URL cho servlet
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Users user = new Users();
        user.setFirstName(req.getParameter("firstName"));
        user.setLastName(req.getParameter("lastName"));
        user.setEmail(req.getParameter("email"));
        user.setDob(req.getParameter("dob"));
        user.setHearAbout(req.getParameter("hearAbout"));
        user.setReceiveCds("yes".equalsIgnoreCase(req.getParameter("receiveCds")));
        user.setReceiveEmails("yes".equalsIgnoreCase(req.getParameter("receiveEmails")));
        user.setContactBy(req.getParameter("contactBy"));

        // ví dụ check đơn giản
        if (user.getEmail() == null || user.getEmail().isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/index.html");
            return;
        }

        req.setAttribute("user", user);
        RequestDispatcher rd = req.getRequestDispatcher("/thanks.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
