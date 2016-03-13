#!/usr/bin/env lua
-- vim: set expandtab ts=2 sw=2 :

if select('#', ...) == 0 then
  print(("Usage: %s FILE..."):format(arg[0]))
  print("    To run tests defined in FILE.")
  return 1
end

-- Define test suite
local http = require("socket.http")
suite = {}

function suite:new(site)
  local site = site
  if not site:match("://") then
    site = "http://" .. site
  end
  local res = { site = site }
  setmetatable(res, { __index = self })
  return res
end

function suite:page200(page)
  local page = page or "/"
  local target = self.site .. page
  local res, code = http.request(target)
  if not res then
    error(code)
  elseif code ~= 200 then
    error(("Request for %s returned code: %d, expected: 200"):format(target, code))
  end
end

function suite:nodeinfo()
  self:page200("/nodeinfo.json")
end

for i = 1, select('#', ...) do
  local testfile = select(i, ...)
  local e, msg = pcall(dofile, testfile)
  if not e then
    print(("Testing failed at <%s> with message: '%s'"):format(testfile, msg))
    os.exit(2)
  else
    print(("Tests for <%s> passed."):format(testfile))
  end
end

