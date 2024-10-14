return (function(args)
    local Library = {}

    -- Function to extract valid code based on the provided pattern
    local function ExtractCode(data, tag)
        local pattern = "<" .. tag .. ">(.-)</" .. tag .. ">"
        local ValidCodes = {}

        -- Filter and extract only valid codes
        for match in data:gmatch(pattern) do
            if match ~= "" then -- You can extend the filter here if necessary
                table.insert(ValidCodes, match)
            end
        end

        return ValidCodes
    end

    -- Function to send HTTP requests asynchronously
    local function http_request_async(url, callback)
        task.spawn(function()
            local requestFunction = (syn and syn.request) or (fluxus and request) or (http and http.request) or request -- your can add more executor func request
            local response = requestFunction({Url = url, Method = "GET"})
            callback(response.Body)
        end)
    end

    -- Get Code List asynchronously
    function Library:GetCode(callback)
        http_request_async(args[2], function(html)
            local codes = ExtractCode(html, "strong")
            -- Remove and return the first item (if needed) in the callback
            table.remove(codes, 1)
            callback(codes)
        end)
    end

    -- Get Last Data Update asynchronously
    function Library:GetDataLastedUpdate(callback)
        http_request_async(args[2], function(html)
            local lastUpdate = ExtractCode(html, "strong")[1] or nil
            callback(lastUpdate)
        end)
    end

    return Library
end)
