= Capybara/Selenium Test Harness

This is a simple configuration of RSpec and Capybara for testing local static pages or internet pages with Selenium

It's very rough right now but it works and I'm sharing this so maybe you can benefit from it too. If you think I can clean up the code better, let me know and I'd be happy to take patches.

== Usage

Ensure Firefox is installed in its default location.

This uses Rack to serve the files in the public/ folder. Nothing fancy. Modify it to run a Sinatra app if you want. 

    $ bundle
    $ bundle exec rspec
    
This should run any tests in the `spec` folder, popping the browser open to run them.

== Advanced usage

See the Capybara documentation. Everything should be configurable.    

== Licence


The MIT License (MIT)

Copyright (c) 2013 Brian P. Hogan

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

        
