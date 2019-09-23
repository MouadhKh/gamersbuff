# Be sure to restart your server when you modify this file.

# Some browsers are experiencing mime-type problems
Rack::Mime::MIME_TYPES.merge!({
                                ".mp4" => "video/mp4",
                              })
