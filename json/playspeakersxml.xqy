xquery version '1.0-ml';

declare variable $uri := xdmp:get-request-field("uri");


xdmp:set-response-content-type("application/xml"),
('<?xml version="1.0" encoding="UTF-8"?>',

    <play:play xmlns:play="http://plays" xml:lang="en"> 

    {
        if (empty($uri) or $uri eq "" or empty(doc($uri))) then
        (
            <error>No content</error>
        )
        else 
        (
            let $doc := doc($uri),
                $title := string($doc/PLAY/TITLE)
            return (
                <TITLE>{$title}</TITLE>,
                for $speaker in fn:distinct-values($doc//SPEAKER) 
                order by $speaker
                return
                    <SPEAKER>{$speaker}</SPEAKER>
                )
        )
    }
    </play:play>
)
