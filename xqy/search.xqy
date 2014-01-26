xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">',
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Speech Search</title>
	</head>
	<body>
        <a href="./listplays.xqy">Go back to list of plays</a>
		<form method="get" action="./results.xqy">
			Speaker to search for?&nbsp;<input type="text" name="query"/>&nbsp;
            <input type="submit" value="Search!"/>
	    </form>
	</body>
</html>)