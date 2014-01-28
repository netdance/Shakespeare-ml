xquery version '1.0-ml';


import module namespace json = "http://marklogic.com/xdmp/json" 
    at "/Marklogic/json/json.xqy";


(: declare variable $uri := "/content/Users/jimdriscoll/Dropbox/XML Sampledata/shaks200/as_you.xml"; :)
(: declare variable $query := "FALSTAFF"; :)

declare variable $query := xdmp:get-request-field("speaker");

(: shamelessly copied from http://www.xqueryfunctions.com/xq/functx_is-node-in-sequence.html 
   some seriously master class code :)
declare function local:is-node-in-sequence 
  ( $node as node()? ,
    $seq as node()* )  as xs:boolean {
   some $nodeInSeq in $seq satisfies $nodeInSeq is $node
};
 
(: shamelessly copied from http://www.xqueryfunctions.com/xq/functx_distinct-nodes.html 
   some seriously master class code :) 
declare function local:distinct-nodes 
  ( $nodes as node()* )  as node()* {
    for $seq in (1 to count($nodes))
    return $nodes[$seq][not(local:is-node-in-sequence(
                                .,$nodes[position() < $seq]))]
};

xdmp:set-response-content-type("application/json"),
let $result :=
    <result>
    {
        for $speakerplay in 
          local:distinct-nodes(
            for $speaker in //SPEAKER[. = $query]
            let $play := $speaker/ancestor::PLAY
            return $play
          )
        let $title := $speakerplay/TITLE,
            $uri := document-uri(fn:doc(xdmp:node-uri($speakerplay)))
        return (
          <play>
          <title>{string($title)}</title>
          <uri>{xdmp:url-encode($uri)}</uri>
          {
            for $line in $speakerplay//SPEAKER[. = $query]/ancestor::SPEECH/LINE/string()
            return (<line>{$line}</line>)[1 to 200] (: TODO implement paging :)
          }
          </play>
        ) [1 to 10] (: TODO implement paging :)
    }
    </result>

 return  
    let $c := json:config("custom"),
        $x := map:put($c,"array-element-names",(xs:QName("play"),xs:QName("line"))),       
        $j := json:transform-to-json($result,$c)
    return $j
