local test = suite:new("http://h.transitiontech.ca")
test:nodeinfo()
test:page200()
test:page200("/index")
