lapis = require "lapis"

import respond_to, json_params from require "lapis.application"
import hmac_sha1 from require "lapis.util.encoding"

class extends lapis.Application
    [body_read_test: "/body-test"]: =>
        ngx.req.read_body!
        return ngx.req.get_body_data!
    [test_hook: "/test-hook"]: json_params =>
        ngx.req.read_body!
        body = ngx.req.get_body_data!
        digest = hmac_sha1("secret", body)
        hex_digest = ""
        for b in digest\gfind "."
            hex_digest ..= string.format("%02X", string.byte(b))
        @html ->
            pre "secret"
            hr!
            pre body
            hr!
            pre @req.headers["X-Hub-Signature"]
            hr!
            pre digest
            hr!
            pre hex_digest
