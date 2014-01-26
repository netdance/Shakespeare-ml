
let $uri := xdmp:get-request-field("uri")
return
    if (empty($uri) or $uri eq "") then
    (
        xdmp:redirect-response("listplays.xqy")
    )
    else 
    (
        xdmp:set-response-content-type("text/xml"),
        if (empty(doc($uri)))
        then <error>No content</error>
        else doc($uri)
    )
