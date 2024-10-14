# Lua Code Library

This repository contains a Lua code library for extracting valid codes from HTML responses using asynchronous HTTP requests. This library is designed for use in Roblox and provides functionality to retrieve and filter codes efficiently.

## Features

- **Extract Valid Codes**: The library can extract valid codes from specified HTML tags.
- **Asynchronous HTTP Requests**: HTTP requests are handled asynchronously, ensuring smooth performance without blocking the main thread.
- **Easy Integration**: Simple interface for fetching codes and data updates.

## Getting Started

### Prerequisites

- Roblox environment
- Lua 5.1 or higher (typically bundled with Roblox)

### Installation

1. Clone this repository or download the script file.
2. Include the library in your Roblox script.

### Usage

Here's how to use the library in your Roblox game:

```lua
local Library = require(path.to.your.library) -- Update with the actual path

-- Define the URL to extract data from
local args = {"your_param1", "https://example.com"}

-- Initialize the library with parameters
local CodeLibrary = Library(args)

-- Fetch valid codes asynchronously
CodeLibrary:GetCode(function(codes)
    print("Codes List: ", codes)
end)
-- Fetch the last data update asynchronously
CodeLibrary:GetDataLastedUpdate(function(lastUpdate)
    print("Last Data Update: ", lastUpdate)
end)
### Usage [Roblox Executor]
-- Here's how to use the library in your Roblox Executor:
- requirement
    <URL> Exmaple https://progameguides.com/roblox/xxxxxxxx/
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SEFLASe32/P1ER/refs/heads/main/client.lua"))({"","<URL> <string>"})
table.foreach(
    Library:GetCode(),
    print
)
print(Library:GetDataLastedUpdate())
    
