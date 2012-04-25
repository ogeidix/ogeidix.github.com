---
layout: posts
title: 'Documenting Rails: two gems released'
tags: [ruby, rails, documentation, yard, yard-spec-plugin, yard-rails-plugin]
excerpt: Your boss asks you the documentation? Here is the answer!
image: http://www.ogeidix.com/images/yard-rails-plugin.png
---
Documenting Rails: two gems released
====================================

One of the saddest day for a developer is when a project is ending and... the manager asks about its documentation!  
I bet that many projects are neverending and the developers keep coding just because they are scared of that word: **documentation**

That day comes also to me :) so I looked for a way to **automate it**.

How to document a Rails project
-------------------------------
While ruby has great documentation tools and standard as [rdoc](http://rdoc.rubyforge.org), [yardoc](http://http://yardoc.org), [rubydoc](http://rubydoc.info) I didn't find a way to generate the documentation of a Rails project which is of course ruby code, but it also has many specific properties and in general doesn't fit very well in the standard documentation template.

So now you can use [**yard-rails-plugin**](https://github.com/ogeidix/yard-rails-plugin) to have an automatic semi-human documentation for your rails project.

The plugin is just in the beginning of its development and there are really a lot of features that can be added. (listing models, list active-record attributes...)  
If you want to contribute join me on the repo! [https://github.com/ogeidix/yard-rails-plugin](https://github.com/ogeidix/yard-rails-plugin)

<img src="/images/yard-rails-plugin.png" style="float: right; width: 380px; border: 1px solid grey;">

At the moment it supports:

- Routes
	- creates a summary file
	- adds routes to each controller and action
- Controller Params
	- adds the list of params taken to each action
	
<hr style="clear: both; background: white">

Going further: RSpec
---------------------------------
The ruby community says _"tests are our documentation"_ and then renamed **tests** in **specifications**.
To truly realize this you can add to your project: [**yard-spec-plugin**](https://github.com/ogeidix/yard-spec-plugin)
This plugin adds to each class and method the documentation auto generated from the specs of your project.

[**yard-spec-plugin**](https://github.com/ogeidix/yard-spec-plugin) supports:

- Anchoring specs to class and methods through the keyword _describe_.

      describe MyClass do
        describe "#instace_method" do
          it "should do something" do
        ...

- Indent specs by the keywork _context_

      describe "#instace_method" do
        context "with valid params" do
          it "should do something" do
            ...
              
- [RSpec-Rails](https://github.com/rspec/rspec-rails) controller and routing specs style

      describe MyController do
        context "describe GET index" do
          it "assigns all items to @items" do
            ...

      describe "routing to profiles" do
        it "routes /profile/:username to profile#show for username" do
          { :get => "/profiles/jsmith" }.should route_to(:controller => "profiles", :action => "show", :username => "jsmith")
        end


Last but not least: Cucumber
----------------------------

To include Cucumber features in your documentation take a look at [Yard-Cucumber](https://github.com/burtlo/yard-cucumber)