xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html>',
<html:html xmlns:html="http://www.w3.org/1999/xhtml" xml:lang="en">    
    <head>
        <title>Play List</title>
    </head>
        <a href="./search.xqy">Search for all lines of one speaker</a>
        <h2>All the plays in our database</h2>
        <ul>
        {
            for $i in collection() 
            let $title := string($i/PLAY/TITLE)
            where $title
            return (
                <li>
                    <a href="displayplay.xqy?uri={xdmp:url-encode(document-uri($i))}">
                        {$title}
                    </a>
                </li>
            )
        }
        </ul>
    <body>
    </body>
</html:html>)