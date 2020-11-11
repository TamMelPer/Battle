- **Can I build a web app?**

### Concepts and skills for the week

#### Concepts

- The relationship between a client and a server.
- How HTTP is used to send information over the web.
- RESTful APIs.
- The request/response cycle.
- Web templating with HTML/CSS.

#### Skills

- Debugging programs that use multiple languages.
- Using a framework (Sinatra) in your code. Sinatra is a Domain Specific Language implemented in Ruby that's used for writing web applications.
- Structuring the code for apps that have user interaction and visual output.
- Testing apps that have user interaction and visual output.
- Tracing data between the browser and server.

## Structure of the challenges

- Some exercises to get you familiar with Requests, Responses, and HTTP
- A project to get you familiar with Servers, `params`, `session`s
- Some exercises to get you familiar with Capybara. Capybara helps you test web applications by simulating how a real user would interact with your app. Selenium WebDriver tool is used to automate web application testing to verify that it works as expected. I
- An extended project to wrap it all together

### Challenge setup

Here are the complete User Stories for this project. They begin with some 'Basic' User Stories:

```
As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them

As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points

As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation

As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10

As two Players,
So we can continue our game of Battle,
We want to switch turns

As Player 1,
So I can see how close I am to losing,
I want to see my own hit points

As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation

As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10

As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first
```
### Steps taken:

- I started a new project directory `Battle` and added dependencies for `rspec`, `capybara` and `sinatra` using a Gemfile, and installed using `bundle`.
- Added an `app.rb` file at the root of the directory and, using Sinatra's Modular Style, set up the Sinatra application as follows:
```ruby
# in app.rb

require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Hello Battle!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
```
- Added a `config.ru` file at the root with this:
```
require_relative "./app"
run Battle
```
- Ran `rackup` in terminal which outputted a port and used that to create a URL like `localhost:XXXX`.  Then visited that URL in our web browser to see `Hello Battle!`.
- Used `rspec --init` to create a `spec/spec_helper.rb` and `.rspec` file.  This gives us a skeletal rspec setup.
- Then set up our spec_helper.rb with the things it needs to prepare Capybara and to get Capybara to test our app.

```ruby
# add this to spec/spec_helper.rb

ENV['RACK_ENV'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

# tell Capybara about our app class
Capybara.app = Battle
```

- Inside the  `spec` directory, created a `features` directory that will house our feature tests, which will be written using Capybara.

```
.
└── battle
    ├── spec
    │   ├── features
    │   └── spec_helper.rb
    ├── .rspec
    ├── Gemfile
    ├── Gemfile.lock
    ├── app.rb
    └── config.ru
```
