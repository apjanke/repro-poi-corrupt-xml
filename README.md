# repro-poi-corrupt-xml

This reproduces a bug where using Apache POI inside Matlab produces corrupt OOXML files, where some of the XML is missing attributes like namespaces on some of its elements.

When running the exact same code, against the exact same JARs, under a JRE outside the Matlab environment, the produced files are fine. This tells me that Matlab's Java XML library setup is messed up.

This applies to Matlab R2019b (and probably earlier, going back to whenever they switched the bundled JRE to Java 8), and at least up to R2020b (and future releases unless they fix it).

Technical Support Case #03977621 has been opened with MathWorks Technical Support about this issue.

## Reproduction

To do the repro:

* Add `Mcode/` to your Matlab path
* Run `blah.Blah.writeHelloWorldExcel`
* Run `blah.Blah.writeHelloWorldExcelUsingJavaInsideMatlab`
* Try to open the resulting `.xlsx` files

The `.xlsx` files will be in the `build/` directory.

Then, for comparison, create an XLSX file in just Java, run outside of Matlab:

* Run `./create_helloworld_xlsx_from_java`
* Try opening `build/helloworld-java.xlsx`

To see details of the produced XML in the files, do this:

```bash
cd build
mkdir helloworld-R2021a
cd helloworld-R2021a
unzip ../helloworld-R2021a.xlsx
```

And then open that directory in a text editor.

## What's going on

For me, when I run this code under a plain Java 8 JDK, the resulting `.xlsx` files are fine, and open with no problem in Excel.

But when I run that same Java code in the Matlab environment, which is also currently shipping JDK 8, I get corrupted files.

I think the problem is the XML-related JARs that Matlab is bundling in `java/jarext`:

* `xml-apis.jar`
* `xml-apis-ext.jar`
* `xercesImpl.jar`

Java 8 already ships with these XML APIs included. These XML JAR files in `jarext/` may be older, possibly buggy ones, for previous versions of Java. IMHO, they should probably be removed.

## Author

This repro case was created by [Andrew Janke](https://apjanke.net). Its home page is [its GitHub repo](https://github.com/apjanke/repro-poi-corrupt-xml).
