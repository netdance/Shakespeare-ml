xquery version '1.0-ml';

import module namespace json = "http://marklogic.com/xdmp/json" 
    at "/Marklogic/json/json.xqy";

xdmp:set-response-content-type("application/json"),
let $result :=

    (<plays>
    {
        for $i in collection() 
        let $title := string($i/PLAY/TITLE)
        where $title
        return (
            <play title="{$title}" uri="{xdmp:url-encode(document-uri($i))}"/>
        )
    }
    </plays>)
    
 return  
    let $c := json:config("custom"),
        (:$x := map:put($c,"whitespace","ignore"),:)
        $x := map:put($c,"array-element-names",xs:QName("play")),
        $x := map:put($c,"camel-case",fn:true()),
        $j := json:transform-to-json($result,$c)
    return $j

