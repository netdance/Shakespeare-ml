xquery version '1.0-ml';

(:declare variable $uri := "/content/Users/jimdriscoll/Dropbox/XML Sampledata/shaks200/as_you.xml";:)
declare variable $uri := xdmp:get-request-field("uri");

xdmp:set-response-content-type("application/xml"),
(
    <play:speakers xmlns:play="http://plays" xml:lang="en">  
    {
        (for $speaker in 
           if (not($uri eq "") and fn:doc-available($uri)) 
           then 
             cts:element-values(xs:QName("SPEAKER"),"","item-frequency",cts:document-query($uri))
           else 
             cts:element-values(xs:QName("SPEAKER"),"","item-frequency")
        let $count := cts:frequency($speaker)
        where $speaker 
        order by $count descending
        return 
            <speaker name="{$speaker}" count="{$count}"/>
        )[1 to 200]
    }
    </play:speakers>
)
    