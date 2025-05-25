return (function(args)
    local Library = {}

    local function ExtractCode(data, tag)
        local pattern = "<" .. tag .. ">(.-)</" .. tag .. ">"
        local ValidCodes = {}
        for match in data:gmatch(pattern) do
            if match ~= "" then 
                table.insert(ValidCodes, match)
            end
        end

        return ValidCodes
    end
    local function http_request_async(url, callback)
        task.spawn(function()
            local requestFunction = (syn and syn.request) or (fluxus and request) or (http and http.request) or request 
            local response = requestFunction({Url = url, Method = "GET"})
            callback(response.Body)
        end)
    end
    function Library:GetCode(callback)
        http_request_async(args[2], function(html)
            local codes = ExtractCode(html, "strong")
            table.remove(codes, 1)
            callback(codes)
        end)
    end

    function Library:GetDataLastedUpdate(callback)
        http_request_async(args[2], function(html)
            local lastUpdate = ExtractCode(html, "strong")[1] or nil
            callback(lastUpdate)
        end)
    end

    return Library
end)
