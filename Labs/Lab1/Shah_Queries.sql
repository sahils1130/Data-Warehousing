#QUERY 1

Select customer.name,CONCAT(customer.addr1,customer.addr2) AS 'Address', customer.city AS 'City',customer.state AS 'State', customer.zip AS 'Zip',
Invoiceidx.invoiceID AS 'InvoiceID',Invoiceidx.saleDate AS 'SalesDate',
prodidx.description AS 'Description',Invoicedtlidx.amt AS 'Amount',Invoicedtlidx.qty AS 'Quantity' 
from customer
JOIN `invoicehdr` as Invoiceidx ON 
customer.customerID = Invoiceidx.customerID
JOIN `invoicedtl` as Invoicedtlidx ON
Invoiceidx.invoiceID = Invoicedtlidx.invoiceID
JOIN product as prodidx ON
Invoicedtlidx.prodID = prodidx.prodID
Where customer.name = "Pulitzer Publishing Company";

#Query 2

Select businessunitidx.BUID `ID`, businessunitidx.abbrev`Abbreviation`, EXTRACT(YEAR from saleDate) as `Year` ,
COUNT(Invoicedtlidx.amt) as `Total Sales Amount` from `business_unit` as businessunitidx
JOIN `prodtype` as prodtypeidx ON businessunitidx.BUID = prodtypeidx.BUID
JOIN product as prodidx ON prodtypeidx.prodTypeID = prodidx.prodTypeID
JOIN `invoicedtl` as Invoicedtlidx ON prodidx.prodID = Invoicedtlidx.prodID
JOIN `invoicehdr` as Invoicehdridx ON Invoicedtlidx.invoiceID = Invoicehdridx.invoiceID
GROUP BY businessunitidx.BUID,businessunitidx.abbrev,EXTRACT(YEAR from saleDate)
ORDER BY businessunitidx.BUID  ASC;
