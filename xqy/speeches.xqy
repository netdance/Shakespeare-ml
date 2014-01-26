xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html>',
<html:html xmlns:html="http://www.w3.org/1999/xhtml" xml:lang="en">    
<head>
        <title>Speeches</title>
</head>
<body>
{
        for $speech in doc()//SPEECH
        let $speaker := $speech/SPEAKER
        return (
           <h2>{$speaker/text()}</h2>,
           <p>{$speech/LINE/string()}</p>
        )
}
</body>
</html:html>)