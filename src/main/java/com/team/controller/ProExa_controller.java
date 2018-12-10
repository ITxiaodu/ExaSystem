package com.team.controller;

import com.team.code.PageJsonResult;
import com.team.pojo.ProFile;
import com.team.pojo.UploadFile;
import com.team.service.ProExa_service;
import com.team.until.SearchInfo;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Insert;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("proExa")
public class ProExa_controller {
    @Resource
    ProExa_service proExa_service;

    @RequestMapping("toExa")
    public String toExa(){
        return "Examine/exaMain";
    }
    @RequestMapping("toFront")
    public String toFront(){
        return "Examine/exaMain";
    }
    @RequestMapping("pExa")
    @ResponseBody
    public PageJsonResult getProExa(Integer pageSize, Integer pageNumber, String searchText, SearchInfo info){
        if (searchText!=null&&searchText.length()>=0) info.setWhere("where proName like '%"+searchText+"%'");
        else info.setWhere("");
        info.setPageSize(pageSize);
        info.setPageNumber(pageNumber);
        List<ProFile> list = proExa_service.getAllTeam(info);
        int fileCount = proExa_service.getCountForFile();
        PageJsonResult pjr = new PageJsonResult();
        pjr.setTotal(fileCount);
        pjr.setRows(list);
        System.out.println(pageSize+":"+pageNumber);
        return pjr;
    }
    @RequestMapping("dl")
    public ResponseEntity<byte[]> downloadFile(HttpServletRequest request, String teamName, String fileName, ModelMap model) throws Exception{
        teamName = URLDecoder.decode(teamName,"UTF-8");
        fileName = URLDecoder.decode(fileName,"UTF-8");
        System.out.println(teamName+fileName);
        String path ="E:/projects/" + teamName;
        File file = new File(path+File.separator + fileName);
        HttpHeaders httpHeaders = new HttpHeaders();
        String downloadFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        httpHeaders.setContentDispositionFormData("attachment",downloadFileName);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);

    }

    @RequestMapping("test")
    public void get(String teamName,String fileName) throws Exception{
        teamName = URLDecoder.decode(teamName,"UTF-8");
        fileName = URLDecoder.decode(fileName,"UTF-8");
        System.out.println(teamName+":"+fileName);
    }

    @RequestMapping("re")
    public String register(HttpServletRequest request, @ModelAttribute UploadFile uploadFile,ModelMap m)throws Exception{
        String fn = "AnalogFrontEndUpload";
        if (!uploadFile.getFile().isEmpty()){
            String path ="E:/projects/" + fn;
            String filename = uploadFile.getFile().getOriginalFilename();
            File filepath = new File(path,filename);
            if(!filepath.getParentFile().exists()){
                filepath.getParentFile().mkdir();
            }
            uploadFile.getFile().transferTo(new File(path + File.separator + filename));
            toMySqlRe(filename,path,request,fn);
            return toExa();
        }else{
            return "";
        }
    }

    public String toMySqlRe(String filename,String path,HttpServletRequest request,String fn){
        String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        ProFile proFile = new ProFile();
        proFile.setTeamName(fn);
        proFile.setFileName(filename);
        proFile.setProName(fn);
        proFile.setPath(path);
        proFile.setTime(time);
        proExa_service.UploadInsert(proFile);
        return toExa();
    }
}
