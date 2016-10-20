# SolidusContactUs 

Modified version of the `contact_us` gem to work with Solidus.

## REQUIREMENTS

SolidusContactUs requires:

* Solidus 1.4 or greater
* solidus_static_content

## INSTALLATION

In your `Gemfile`, add the following dependencies:

To install from edge:

    gem 'solidus_contact_us', :git => 'https://github.com/2beDigital/solidus_contact_us'

From `Rails.root` run:

    $ bundle
    $ bundle exec rails g solidus_contact_us:install

Add to ApplicationHelper:

		include Spree::PagesHelper


## CONFIGURATION

If you would like to add a name or subject field to the form you may simply set the options to true within the spree_contact_us initializer located at `config/initializers/solidus_contact_us.rb`:

    config.require_name = true
    config.require_subject = true

You may also update your locales under `config/locales/solidus_contact_us.en.yml` or create your own.  Please feel free to submit your own locales so that other users will hopefully find this gem more useful.

## USAGE

Visit your website and navigate to `/contact-us` to see the form in action.

## ISSUES

Please report any bugs or feature requests to the Github issues page @ https://github.com/2beDigital/solidus_contact_us/issues

## CONTRIBUTING

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting bugs
* by suggesting new features
* by [translating to a new language](https://github.com/2beDigital/solidus_contact_us/tree/master/config/locales)
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues](https://github.com/2beDigital/solidus_contact_us/issues)
* by reviewing patches
