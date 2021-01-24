classdef Blah < blah.internal.BlahBase

  methods (Static)
    
    function writeHelloWorldExcel()
      file = sprintf('helloworld-R%s.xlsx', version('-release'));
      
      % Create Excel workbook using POI
      jWkbk = org.apache.poi.xssf.usermodel.XSSFWorkbook();
      jSheet = jWkbk.createSheet('HelloWorld');
      jRow = jSheet.createRow(0);
      jCell = jRow.createCell(0);
      jCell.setCellValue('Hello, world!');
      
      % Write it to the .xlsx file
      jOutStream = java.io.FileOutputStream(file);
      jWkbk.write(jOutStream);
      jOutStream.close;
      
      fprintf('Created %s\n', file);
    end
    
    function writeHelloWorldExcelUsingJava()
      javaHello = com.example.blah.HelloWorld;
      javaHello.writeHelloWorldExcel('helloworld-R%-java.xlsx', version('-release'));
    end
    
  end
  
end

