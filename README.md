# Bridgetown Obsidian Plugin

A Bridgetown plugin to convert Obsidian notes to Bridgetown posts.

This plugin allows you to use Obsidian's [internal links](https://help.obsidian.md/Linking+notes+and+files/Internal+links) feature to cross reference your Bridgetown posts and [embed images](https://help.obsidian.md/Linking+notes+and+files/Embedding+files). It replaces all the wikilinks references in `src/_posts` with Bridgetown compatible versions:

1. Converts wikilinks from `[[My Markdown Post]]` to `<a href="/my-markdown post/">My Markdown Post</a>`
2. Supports optional link titles such as `[[My Markdown Post|with an optional title]]`
3. Converts image references from `![[attachments/image.jpg]]` to `<img src="/attachments/bridge.jpg" alt="" />`

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
bundle add bridgetown_obsidian
```

Then add the initializer to your configuration in `config/initializers.rb`:

```ruby
init :bridgetown_obsidian
```

### Obsidian Setup

There are two main ways you can use this plugin with obsidian.

1. Create a new vault that points to your `src/_posts` folder in Bridgetown. In this case you might want to add `.obsidian` to your `.gitignore` file.

2. Create an symbolink link in your existing vault to your Bridgetown folder. This option is [strongly advised against](https://help.obsidian.md/Files+and+folders/Symbolic+links+and+junctions) by Obsidian so use at your own risk.

```shell
ln -s /path/to/bridgetown/folder/src/_posts "My Blog"
```

In either case, turn on `Use [[Wikilinks]]` option in [Files & Links settings](https://help.obsidian.md/Linking+notes+and+files/Internal+links).

## Usage

Edit your posts in Obsidian. If you have a Bridgetown server running, you can see your changes in real-time. If not, your changes will get reflected the next time you build your site.

## Testing

- Run `bundle exec rake test` to run the test suite.

## Credits

Check out these other great plugins that helped to inspire this one:

- https://github.com/SpinalCMS/bridgetown-internal-markdown-links
- https://github.com/jamie/bridgetown-notable

## Contributing

1. Fork it (https://github.com/username/my-awesome-plugin/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
