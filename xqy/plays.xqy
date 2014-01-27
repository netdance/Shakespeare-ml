xdmp:set-response-content-type("text/html"),
('<!DOCTYPE html>',
<html>
    <head>
        <title>Play List</title>
    </head>
        {
            for $play in //PLAY/TITLE/string()
            order by $play
            return <h3>{$play}</h3>
        }
    <body>
    </body>
</html>)