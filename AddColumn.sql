select * from DataFile ;

alter table dbo.DataFile add A_GregorianDate date;

alter table dbo.DataFile add A_GregorianDateTime datetime;




--select dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](substring(StartDateCustomer , 1 , 4)  , 
--substring( substring(StartDateCustomer , 6 , 4) , 1  ,   CHARINDEX('/', substring(StartDateCustomer , 6 , 4) )-1      ) 
--, substring( substring(StartDateCustomer , 6 , 4)   ,  CHARINDEX('/',substring(StartDateCustomer , 6 , 4))+1   ,    2      ) ))
--from dbo.Try;

update dbo.DataFile
set		A_GregorianDate =
dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](substring(A , 1 , 4)  , 
substring( substring(A , 6 , 4) , 1  ,   CHARINDEX('/', substring(A , 6 , 4) )-1      ) 
, substring( substring(A , 6 , 4)   ,  CHARINDEX('/',substring(A , 6 , 4))+1   ,    2      ) ))
;
go


update dbo.DataFile
set A_GregorianDateTime =
dbo.[UDF_Julian_To_Gregorian](dbo.[UDF_Persian_To_Julian](substring(A , 1 , 4)  , 
substring( substring(A , 6 , 4) , 1  ,   CHARINDEX('/', substring(A , 6 , 4) )-1      ) 
, substring( substring(A , 6 , 4)   ,  CHARINDEX('/',substring(A , 6 , 4))+1   ,    2      ) ))
+Right(A , 6)
;
go