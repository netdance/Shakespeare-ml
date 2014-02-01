xquery version '1.0-ml';

(: declare variable $query := "FALSTAFF"; :)
(:declare variable $uri := "/content/Users/jimdriscoll/Dropbox/XML+Sampledata/shaks200/hen_iv_2.xml";:)

declare variable $query := xdmp:get-request-field("speaker");
declare variable $uri := xdmp:get-request-field("uri");


xdmp:set-response-content-type("application/xml"),
(
    <result>
      <request>
        <speaker>{$query}</speaker>
        <uri>{$uri}</uri>
      </request>
    {
        for $speakerplay in 
          if (not($uri eq "") and fn:doc-available($uri)) 
           then 
            fn:doc($uri)/PLAY
           else 
            /PLAY[.//SPEAKER = $query]
          let $title := $speakerplay/TITLE/string(),
              $playuri := base-uri($speakerplay)
        return (
          <play>
          <title>{$title}</title>
          <uri>{xdmp:url-encode($playuri)}</uri>
          {
            for $line in $speakerplay//SPEECH[./SPEAKER = $query]/LINE/string()
            return <line>{$line}</line>
          }
          </play>
        ) 
    }
    </result>
)
