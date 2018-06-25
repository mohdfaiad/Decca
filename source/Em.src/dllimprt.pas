unit DllImprt;

interface

  function emReport(userName : String; userpassword : String; ServerName : String; RepName : String;
                       SerialNos : Integer) : Boolean;

implementation
  function emReport(userName : String; userpassword : String; ServerName : String; RepName : String;
                       SerialNos : Integer) : Boolean; external 'dll/emrep' index 1;

end.
