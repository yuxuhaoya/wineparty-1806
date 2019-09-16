package com.buba.wineparty1806.controller;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.User;
import com.buba.wineparty1806.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @RequestMapping("/findlogin")
    @ResponseBody
    public User findlogin(String usercode, String password, HttpSession session){
        User user = loginService.findlogin(usercode,password);
        if(user!=null){
            session.setAttribute("user",user);
        }
        return user;
    }

    @RequestMapping("/tuichu")
    public String tuichu(HttpSession session) {
        session.removeAttribute("user");//删除session中的用户
        session.invalidate();//注销
        return "redirect:/jsps/login.jsp";

    }

    @RequestMapping("/finduser")
    @ResponseBody
    public List<User> finduser(Integer areaId){
        List<User> list =loginService.finduser(areaId);
        return list;
    }

    @RequestMapping("/adduser")
    @ResponseBody
    public int adduser(User user){
        int i =loginService.adduser(user);
        return i ;
    }

    @RequestMapping("/addarea")
    @ResponseBody
    public int addarea(Area area){
        int i =loginService.addarea(area);
        return i;
    }
}
