xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html>',
<html:html xmlns:html="http://www.w3.org/1999/xhtml" xml:lang="en">    
<head>
        <title>First Play</title>
    </head>
    <body>
        {
            for $play in doc()[2]
            return (<h1>{string($play/PLAY/TITLE)}</h1>,
                for $act in $play/act
                return <li>$act</li>)

            (:
            let $title := $play/PLAY/TITLE/text()
            return 
                <h1>{$title}</h1>
                :)

        }
    </body>
</html:html>)