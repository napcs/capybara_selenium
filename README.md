# Capybara/Selenium Test Harness

This is a simple configuration of RSpec and Capybara for testing local static pages or internet pages with Selenium

It's very rough right now but it works and I'm sharing this so maybe you can benefit from it too. If you think I can clean up the code better, let me know and I'd be happy to take patches.

## Usage

Ensure Firefox is installed in its default location.

This uses Rack to serve the files in the public/ folder. Nothing fancy. Modify it to run a Sinatra app if you want. 

    $ bundle
    $ bundle exec rspec
    
This should run any tests in the `spec` folder, popping the browser open to run them.

### Creating a test

Create a new file called `mytest_spec.rb` in the `spec` folder.

Add this line to the top

```
require File.dirname(__FILE__) + '/spec_helper'
```

This ensures your test uses the shared setup stuff.

Then add a simple test like this:

```
describe "The calculator  page" do
  it "computes the appropriate tip" do
    # this is a comment

    # the url of the page.  Relative URLs are files
    # in the public/ folder.
    visit "/calculator.html"

    # Fill in the form field by finding it with it's label.
    fill_in("Bill amount", :with => "10")

    # click_on finds links or buttons.
    click_on "Compute tip"

    # now look for text on the screen
    page.should have_content "The tip is $1.50" 
    page.should have_content "The total bill  is $11.50" 

  end
    
end

```

Now run this test with

```
$ bundle exec rspec
```

It'll open the browser but this new test will fail. Let's write the program.

In `public/calculator.html` create a simple HTML skeleton with a form:

```
<!DOCTYPE html>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
    <form id="tip_calculator">

      <label>Bill amount: 
        <input type="text" id="bill">
      </label>
      <input type="submit" value="Compute tip">
    </form>

    <p id="tip_output"></p>
    <p id="total_output"></p>

  </body>
```

Then right above the closing `<body>` tag, add a `<script` tag with
this JavaScript code:

```
<script>

  var form = document.getElementById("tip_calculator");
  form.addEventListener("submit", function(e){
    var bill, tip, tipOutput, total, totalOutput;

    // Without this, the form will submit to the server.
    e.preventDefault();

    // Get the value the user typed in
    bill = document.getElementById("bill").value;

    // Values come in as text, so convert them
    bill = parseInt(bill); 

    // Try to avoid rounding errors by converting dollars into cents.
    bill*= 100;  

    // Do the computations
    tip = bill * 0.15;
    total = bill + tip;

    // Have to shift the decimals back so we get dollars. We'll round too.
    tip = Math.round(tip)/100;
    total = Math.round(total)/100;

    // now we can put the output on the page. Find the elements:

    tipOutput = document.getElementById("tip_output");
    totalOutput = document.getElementById("total_output");

    // Now put the values in.
    tipOutput.innerHTML = "The tip is $" + tip.toFixed(2);
    totalOutput.innerHTML = "The total bill is $" + total.toFixed(2);

  });
</script>
```

This is a pretty crude tip calculator but it makes the test pass. And that
means that now you can make the code better,

Visit https://github.com/jnicklas/capybara#the-dsl to learn more about the Capybara DSL.


## Advanced usage

See the Capybara documentation. Everything should be configurable.    

## Licence


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

        
