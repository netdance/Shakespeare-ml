xquery version '1.0-ml';

xdmp:set-response-content-type("application/xml"),
('<?xml version="1.0" encoding="UTF-8"?>',

    <play:speakers xmlns:play="http://plays" xml:lang="en">  
    {
        for $i in fn:distinct-values(collection()//SPEAKER)
        return (
            <speaker>{$i}</speaker>
        )
    }
    </play:speakers>
)
    