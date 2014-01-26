xquery version '1.0-ml';

xdmp:set-response-content-type("application/xml"),
('<?xml version="1.0" encoding="UTF-8"?>',

    <play:PLAYS xmlns:play="http://plays" xml:lang="en">  
    {
        for $i in collection() 
        let $title := string($i/PLAY/TITLE)
        where $title
        return (
            <PLAY TITLE="{$title}" URI="{xdmp:url-encode(document-uri($i))}"/>
        )
    }
    </play:PLAYS>
)
    