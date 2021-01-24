package com.example.blah;

// Reference: https://poi.apache.org/apidocs/dev/index.html?org/apache/poi/xssf/usermodel/package-summary.html

import org.apache.poi.xssf.usermodel.*;
import java.io.*;

public class HelloWorld {
  public static void main(String[] args) {
      HelloWorld.writeHelloWorldExcel("helloworld-java.xlsx");
  }

  public static void writeHelloWorldExcel(String basename) {
    try {
      XSSFWorkbook wkbk = new XSSFWorkbook();
      XSSFSheet sheet = wkbk.createSheet("Hello World");
      XSSFRow row = sheet.createRow(0);
      XSSFCell cell = row.createCell(0);
      cell.setCellValue("Hello, world!");
      File buildDir = new File("build");
      if (!buildDir.isDirectory()) {
        buildDir.mkdir();
      }
      File file = new File("build/"+basename);
      OutputStream ostr = new FileOutputStream(file);
      wkbk.write(ostr);
      ostr.close();
      System.out.println("Created "+file);
    } catch (Exception e) {
      System.err.println("Error: " + e.getMessage());
      e.printStackTrace();
    } 
  }

}