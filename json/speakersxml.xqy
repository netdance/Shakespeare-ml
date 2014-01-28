xquery version '1.0-ml';

xdmp:set-response-content-type("application/xml"),
(
    <play:speakers xmlns:play="http://plays" xml:lang="en">  
    {
        for $speaker in cts:element-values(xs:QName("SPEAKER"),"","item-frequency")
        let $count := cts:frequency($speaker)
        order by $count descending
        return
        (
            <speaker count="{$count}">{$speaker}</speaker>
        )
    }
    </play:speakers>
)
    