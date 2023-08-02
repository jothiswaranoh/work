# Import Map Documentation

## What is the Import Map?

The Import Map is a JavaScript feature that provides a way to manage dependencies and import statements in your web application. It allows you to specify the mapping of module specifiers to URLs, making it easier to handle complex dependency structures and ensure consistent loading of modules.

## Installation

To use the Import Map in your Ruby on Rails application, you need to have the `importmap-rails` gem installed. Add the gem to your Gemfile and run `bundle install`:

```ruby
gem 'importmap-rails'
```

After installing the gem, generate the necessary configuration files by running:

```bash
rails generate importmap:install
```

This will create an `importmap.rb` file in your `config` directory and an `importmap.json` file in your `public` directory.

## Creating an Import Map

In your `importmap.json` file (located in the `public` directory), you can declare the mappings of module specifiers to their corresponding JavaScript files.

Example `importmap.json`:

```json
{
  "imports": {
    "jquery-blockui": "/javascripts/vendor/jquery-blockui.js"
  }
}
```

In this example, we have specified a mapping for the `jquery-blockui` module. The corresponding JavaScript file should be located at `/javascripts/vendor/jquery-blockui.js`.

## Pinning JavaScript Library with Import Map

You can use the `importmap` command-line utility provided by the `importmap-rails` gem to pin JavaScript libraries directly from their CDNs or URLs. For example, to pin `jquery-blockui`:

```bash
./bin/importmap pin jquery-blockui --download
```

This will automatically download the `jquery-blockui.js` file and add the mapping to your `importmap.json` file.

## Importing JavaScript Modules

In your application's layout file (e.g., `app/views/layouts/application.html.erb`), include the `importmap` JavaScript using the `javascript_include_tag` helper:

```html
<!DOCTYPE html>
<html>
<head>
  <!-- Your head content here -->
  <%= javascript_include_tag 'importmap' %>
</head>
<body>
  <!-- Your body content here -->
</body>
</html>
```

This will make the `importmap.json` available in your application, and the mapped modules can be imported in your JavaScript files.

## Using JavaScript Modules

In your JavaScript files (e.g., `app/javascript/packs/application.js`), use the import statements to include the mapped JavaScript modules:

```javascript
// Import or require other modules as needed
import { Turbo, cable } from "@hotwired/turbo-rails";
import "controllers";

// Import your modules using the module specifiers defined in importmap.json
import "jquery-blockui";

// Now you can use functions or features provided by the imported modules.
```

## Compile and Serve Assets

After adding or modifying the `importmap.json` file, you need to precompile and serve the assets to make the changes effective. Run the following commands to compile your assets:

```bash
rails assets:precompile
```

Start or restart your Rails server:

```bash
rails server
```

## Conclusion

The Import Map feature provided by the `importmap-rails` gem allows you to manage JavaScript dependencies efficiently in your Ruby on Rails application. By declaring the mappings of module specifiers to their corresponding URLs, you can ensure the correct versions of modules are loaded and simplify the import statements in your application. With a well-organized dependency management approach, you can maintain a clean and efficient codebase for your web application.