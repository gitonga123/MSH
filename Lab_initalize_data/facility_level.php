<?php

require "connect.php";

//HTTP GET request -Using Curl -Response JSON

$url="https://hiskenya.org/api/analytics?dimension=dx:nNhisoZuTzR;fgGcpHh5Bl6;H3PiVz5cdlS;THefpTo9qAa;UDNKVH14KuC;iQvswzF7Zcr;REDgTs0CyzY;MnMPmhXaWns&dimension=pe:LAST_12_MONTHS&dimension=co&filter=ou:HfVjCurKxh2&displayProperty=NAME";

// initailizing curl
$ch = curl_init();
//curl options
curl_setopt($ch, CURLOPT_POST, false);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_TIMEOUT, 20);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 20);
//execute
$result = curl_exec($ch);

//close connection
curl_close($ch);

if ($result){

	$result=json_decode($result,true);
	$json=$result['rows'];

	foreach($json as $row)
    { 
        $drugid = $row[0];
        $periodic = $row[1];
        $drugcategoryid = $row[2];
        $drugvalue = $row[3];
        
        $sql = "INSERT INTO facility_level_data(drug_id,period,drug_category_id,drug_value)VALUES('$drugid','$drugcategoryid','$periodic','$drugvalue')";
        if(mysql_query($sql,$con)){
            echo ("inserted successfully <br>");
 
        }
        else{
           die('Error : ' . mysql_error()); 
        }

    }

}
else{

    echo -1;
}

?>

