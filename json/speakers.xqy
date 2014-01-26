xquery version '1.0-ml';

import module namespace search-lib = "http://www.marklogic.com/tutorial2/search-lib" 
        at "/modules/search-lib.xqy";
import module namespace json = "http://marklogic.com/xdmp/json" 
    at "/Marklogic/json/json.xqy";

xdmp:set-response-content-type("application/json"),
let $result :=

    (<speakers>
    {
        for $speaker in fn:distinct-values(collection()//SPEAKER) 
        let $count := fn:count(search-lib:find-speech($speaker))
        where $speaker 
        order by $count descending
        return (
            <speaker name="{$speaker}" count="{$count}"/>
        )
    }
    </speakers>)
    
 return  
    let $c := json:config("custom"),
        (:$x := map:put($c,"whitespace","ignore"),:)
        $x := map:put($c,"array-element-names",xs:QName("speaker")),
        $x := map:put($c,"camel-case",fn:true()),
        $j := json:transform-to-json($result,$c)
    return $j
