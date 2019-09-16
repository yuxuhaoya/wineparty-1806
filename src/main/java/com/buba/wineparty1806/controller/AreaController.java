package com.buba.wineparty1806.controller;

import com.buba.wineparty1806.pojo.Area;
import com.buba.wineparty1806.pojo.Shandong;
import com.buba.wineparty1806.pojo.Tp;
import com.buba.wineparty1806.pojo.User;
import com.buba.wineparty1806.service.AreaService;
import com.buba.wineparty1806.util.TemplateExcelUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/area")
public class AreaController {
    @Value("${User.path}")
    private String path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");


    @Autowired
    private AreaService areaService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Area> findAll(){
        List<Area> list = areaService.findAll();

        return list;
    }

    @RequestMapping("/addshandong")
    @ResponseBody
    public int addshandong(HttpSession session, Shandong shandong){
        User user =(User) session.getAttribute("user");
        shandong.setAreaId(user.getAreaId());
        shandong.setStype(user.getUtype());
        shandong.setUserId(user.getId());
        int i = areaService.addshandong(shandong);
        return i;
    }

    @RequestMapping("/findshandong")
    @ResponseBody
    public List<Shandong> findshandong(HttpSession session){
        User user =(User) session.getAttribute("user");
        if(user.getLevel()==4){
            List<Shandong> list = areaService.findshandong();
            return list;
        }
        if(user.getLevel()==1){
            List<Shandong> list = areaService.findshandongshi();
            return list;
        }

        return null;
    }

    @RequestMapping("/findsd")
    @ResponseBody
    public Shandong findsd(HttpSession session, Integer id){
        Shandong  list = areaService.findsd(id);
        session.setAttribute("list",list);
        return list;
    }

    @RequestMapping("/updshandong")
    @ResponseBody
    public int updshandong(HttpSession session ,Shandong shandong){
        Shandong shandong1 =(Shandong) session.getAttribute("list");
        shandong.setId(shandong1.getId());
        shandong.setAudit(1);
        int i = areaService.updshandong(shandong);
        return i;
    }

    @RequestMapping("/addphoto")
    @ResponseBody
    public Map<String, Object> uplheadphoto(MultipartFile storeImg, HttpSession session) {
        //如果不存在就新建文件
        File tp = new File(path);
        if (tp.isDirectory()) {
            tp.mkdirs();
        }
        Map<String, Object> map = new HashMap<>();
        Shandong shandong = (Shandong) session.getAttribute("list");
        if (shandong != null) {
            Tp secGallery = new Tp();
            //获取session中的用户名字与当前时间拼接
            String fileName = shandong.getId() + "_" + sdf.format(new Date());
            //将拼接的名字set到图片名称中
            secGallery.setName(fileName);
            //session中的id
            secGallery.setItemId(shandong.getId());

            String target = path + File.separator + "goodsMain" + File.separator + fileName + ".jpg";
            File temp = new File(target);
            try {
                //保存文件
                storeImg.transferTo(temp);
            } catch (IOException e) {
                map.put("status", false);
                e.printStackTrace();
            }
            int i = areaService.updCard(secGallery);
            if (i > 0) {
                map.put("status", true);
                map.put("Image", fileName);
            } else {
                map.put("status", false);
            }
        } else {
            map.put("status", false);
        }
        return map;
    }

    @RequestMapping("/updatearea")
    @ResponseBody
    public int updatearea(Integer id,String name){
        int i =areaService.updatearea(id,name);
        return i;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(Integer[] id){
        int i = areaService.delete(id);
        return i;
    }

    @RequestMapping("/daochu")
    @ResponseBody
    public List<Shandong> daochu(HttpSession session, Integer limit,Integer offset){

        String temp = "shandong.xlsx";
        temp = session.getServletContext().getRealPath("/Temp")+File.separator+temp;

        String target = "D:"+File.separator+"temp"+File.separator+System.currentTimeMillis()+".xlsx";

        //session获取当前用户值
        User user = (User) session.getAttribute("user");

        List<Shandong> list = null;
        //if判断

            PageInfo<Shandong> p=areaService.dpdaochu(limit,offset);
             list=p.getList();



        String [] params = new String[2];
        params[0]=user.getUsername();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        params[1] = sdf.format(new Date());

        List<String> list1 = titleList();
        new TemplateExcelUtil().exportExcel(temp, target, params, list1, list);

        return list;

    }

    private List<String> titleList() {
        List<String> list = new ArrayList<>();
        list.add("name");
        list.add("numActual");
        list.add("newClient");
        list.add("oldClient");
        list.add("yxClient");
        list.add("money");
        return list;
    }
}
