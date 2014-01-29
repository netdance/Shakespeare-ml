xquery version '1.0-ml';

(: declare variable $query := "FALSTAFF"; :)
declare variable $query := xdmp:get-request-field("speaker");

xdmp:set-response-content-type("application/xml"),
(
    <result>
    {
        for $speakerplay in /PLAY[.//SPEAKER = $query]
          let $title := $speakerplay/TITLE/string(),
              $uri := base-uri($speakerplay)
        return (
          <play>
          <title>{$title}</title>
          <uri>{xdmp:url-encode($uri)}</uri>
          {
            for $line in $speakerplay//SPEECH[./SPEAKER = $query]/LINE/string()
            return <line>{$line}</line>
          }
          </play>
        ) 
    }
    </result>
)
