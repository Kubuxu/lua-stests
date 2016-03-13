### Tests for Hypesites made easy

It requires very new luasocket, the rocks one is too old.
To install it do:
```bash
git clone https://github.com/diegonehab/luasocket.git
cd luasocket
sudo luarocks make
```
#### How to run test
To run just one: `./test.lua ovh-kubuxu.test.lua`
To run all of them `./test.lua *.test.lua`

#### How to write test

Create file called your domain in reverse order with dots replaces with dashes ending with `.test.lua` and refer sample test files provided in this repository.

### License
```
Copyright © 2016 Jakub Sztandera <k.sztandera@protonmail.ch>

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To But It's Not My Fault, Version 1
as published by Ben McGinnes. See the LICENSE file for more details.
```

