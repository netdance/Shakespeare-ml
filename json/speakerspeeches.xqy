xquery version '1.0-ml';


import module namespace json = "http://marklogic.com/xdmp/json" 
    at "/Marklogic/json/json.xqy";

(: declare variable $query := "FALSTAFF"; :)

declare variable $query := xdmp:get-request-field("speaker");

xdmp:set-response-content-type("application/json"),
let $result :=
    <result>
    {
        for $speakerplay in /PLAY[//SPEAKER = $query]
          let $title := $speakerplay/TITLE/string(),
              $uri := base-uri($speakerplay)
        return (
          <play>
          <title>{$title}</title>
          <uri>{xdmp:url-encode($uri)}</uri>
          {
            for $line in $speakerplay//SPEAKER[. = $query]/parent::SPEECH/LINE/string()
            return (<line>{$line}</line>)[1 to 200] (: TODO implement paging:)
          }
          </play>
        ) [1 to 10] (: TODO implement paging:)
    }
    </result>
 return  
    let $c := json:config("custom"),
        $x := map:put($c,"array-element-names",(xs:QName("play"),xs:QName("line"))),       
        $j := json:transform-to-json($result,$c)
    return $j
