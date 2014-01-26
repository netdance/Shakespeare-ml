import module namespace search-lib = "http://www.marklogic.com/tutorial2/search-lib" 
        at "modules/search-lib.xqy";

declare variable $query := xdmp:get-request-field("query");

xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">',
<xhtml:html xmlns:xhtml="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Speaker Results for {$query}</title>
	</head>
	<xhtml:body>
		<h1>Results for {$query}</h1>
		<a href="./search.xqy">Search for a different person</a>
		{
			for $speech in search-lib:find-speech($query) 
			let $play := $speech/ancestor::PLAY/TITLE/text()
			return 
				(
			  	<p><b>Play:</b>&nbsp;{$play}</p>,
				<p><b>Line:</b>&nbsp;{$speech/LINE/text()}</p>
				)
		}
	</xhtml:body>
</xhtml:html>)