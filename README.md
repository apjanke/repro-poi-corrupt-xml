# repro-poi-corrupt-xml

This reproduces a bug where using Apache POI inside Matlab produces corrupt OOXML files, where some of the XML is missing attributes like namespaces on some of its elements.

## Reproduction

To do the repro:

* Add `Mcode/` to your Matlab path
* Run `blah.Blah.writeHelloWorldExcel`
* Try to open the resulting `.xlsx` file

To see details of the produced XML, do this:

```bash
cd build
mkdir helloworld-R2021a
cd helloworld-R2021a
unzip ../helloworld-R2021a.xlsx
```

And then open that directory in a text editor.

Then, for comparison, create an XLSX file in just Java:

* Run `./create_helloworld_xlsx_from_java`


