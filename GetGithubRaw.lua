function load(one,two,three,four)
local http = game:GetService("HttpService")
local base64 = require("base64")

-- Replace the following variables with your own values
local username = one
local repo = two
local file_path = three
local token = four

-- Construct the URL for the file
local url = "https://api.github.com/repos/" .. username .. "/" .. repo .. "/contents/" .. file_path

-- Construct the headers for the HTTP request
local headers = {
    Authorization = "token " .. token
}

-- Make an HTTP GET request to the URL with the headers
local response = http:RequestAsync({
    Url = url,
    Method = "GET",
    Headers = headers
})

-- Parse the response to get the raw data of the file
local data = http:JSONDecode(response.Body)
local raw_data = data.content

-- Decode the base64-encoded raw data
local decoded_data = game:GetService("HttpService"):Base64Decode(raw_data)

-- Print the raw data to the output
_G.Src = decoded_data
end
