xquery version '1.0-ml';

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

xdmp:set-response-content-type("application/xml"),
(
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
            return <line>{$line}</line>
          }
          </play>
        ) 
    }
    </result>
)
