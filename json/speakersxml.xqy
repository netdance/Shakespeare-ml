xquery version '1.0-ml';

import module namespace search-lib = "http://www.marklogic.com/tutorial2/search-lib" 
        at "/modules/search-lib.xqy";

xdmp:set-response-content-type("application/xml"),
('<?xml version="1.0" encoding="UTF-8"?>',

    <play:speakers xmlns:play="http://plays" xml:lang="en">  
    {
        for $speaker in fn:distinct-values(collection()//SPEAKER)
        (: need to modify indexes?  always returns 37:)
        (: let $c := xdmp:estimate(collection()//SPEAKER[text()="{$speaker}"]) :)
        (: fn:count always returns 0, so there's something else going on :)
        (: let $c := fn:count(collection()//SPEAKER[text()="{$speaker}"]) :)
        (: this works, but it's going to be slow on anything other than a toy :)
        let $c := fn:count(search-lib:find-speech($speaker))
        where $speaker 
        order by $c descending
        return (
            <speaker count="{$c}">{$speaker}</speaker>
        )
    }
    </play:speakers>
)
    