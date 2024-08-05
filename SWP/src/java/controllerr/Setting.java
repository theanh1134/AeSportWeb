/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllerr;

import data.SettingContext;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class Setting extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SettingContext settingDB = new SettingContext();

        if ("logoh".equals(req.getParameter("logo"))) {
            String img = req.getParameter("img");
            settingDB.updateLogo(img, "logoh");
        }
        if ("logof".equals(req.getParameter("logo"))) {
            String img = req.getParameter("img");
            settingDB.updateLogo(img, "logof");
        }

        if ("delete".equals(req.getParameter("type"))) {
            String slide1 = req.getParameter("slide1");
            if (slide1 != null) {
                settingDB.deleteImg("slide1", slide1);
            }
            String slide2 = req.getParameter("slide2");
            if (slide2 != null) {
                settingDB.deleteImg("slide2", slide2);
            }
            String slide3 = req.getParameter("slide3");
            if (slide3 != null) {
                settingDB.deleteImg("slide3", slide3);
            }
            String slide4 = req.getParameter("slide4");
            if (slide4 != null) {
                settingDB.deleteImg("slide4", slide4);
            }
        }
        if ("add".equals(req.getParameter("type"))) {

            if ("slide1".equals(req.getParameter("slide1"))) {

                String img = req.getParameter("img");
                settingDB.addImg("slide1", img);

            }
            if ("slide2".equals(req.getParameter("slide2"))) {

                String img = req.getParameter("img");
                settingDB.addImg("slide2", img);

            }
            if ("slide3".equals(req.getParameter("slide3"))) {

                String img = req.getParameter("img");
                settingDB.addImg("slide3", img);

            }
            if ("slide4".equals(req.getParameter("slide4"))) {

                String img = req.getParameter("img");
                settingDB.addImg("slide4", img);

            }
        }

        resp.sendRedirect("Setting");

        req.getRequestDispatcher("view/HomePage/Setting.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SettingContext settingDB = new SettingContext();
        String logoh = settingDB.getLogo("logoh");
        req.setAttribute("logoh", logoh);
        String logof = settingDB.getLogo("logof");
        req.setAttribute("logof", logof);

        ArrayList<String> slide1 = settingDB.getSilde("slide1");

        req.setAttribute("slide1", slide1);
        ArrayList<String> slide2 = settingDB.getSilde("slide2");
        req.setAttribute("slide2", slide2);
        ArrayList<String> slide3 = settingDB.getSilde("slide3");
        req.setAttribute("slide3", slide3);
        ArrayList<String> slide4 = settingDB.getSilde("slide4");
        req.setAttribute("slide4", slide4);

        req.getRequestDispatcher("view/HomePage/Setting.jsp").forward(req, resp);
    }

}
