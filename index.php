<h1>Top 10 cities in Bulgaria</h1>
<?php
	// CONNECTION INFORMATION BELLOW 

	if( $conn === false ) {
	     die( print_r( sqlsrv_errors(), true));
	}

	$stmt = sqlsrv_query( $conn, "SELECT * FROM Cities");

	if( $stmt === false ) {
	     die( print_r( sqlsrv_errors(), true));
	}

	print "<ol>\n";
	
	while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
	     echo "<li>".$row['CityName']." -> ".$row['Population']."</li>\n";
	}
	
	print "</ol>\n";
?>
