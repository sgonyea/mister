# Mister. A Helper for Your MapReduce JavaScripts.

In keeping with my \[RD]DD pedanticism, and [Tom Preston-Werner's excellent article][tpdub], this README will serve as
the roadmap for Mister's development. The features/goals are subject to revision, but probably not too much.

# Goals

* Allow you to write MapReduce using both CoffeeScript or JavaScript.
* Organize your MapReduce JavaScripts, in a way that is logical, accessible, and easy to...
* Test. Make it easy to feed fixture/factory data into your MapReduce scripts, and write tests.
* Work only with Rails, for simplicity sake. If this takes off, other frameworks can be supported through contributions.
* Initially, to work with Riak (that's what I'm familiar with). I'd happily accept contributions to support Mongo, Couch, and others.
* Allow you to compose more complex MapReduce tasks, within your Models, while keeping your code fairly DRY.
* Minifies and Caches your JavaScripts, when in production.

* Possibly? Turn the JavaScripts into deployable Migration-like whatevers. Perhaps a Git tag?

# Project Outline

Folder Structure in a Rails App

    / = Rails.root
      /app
        /models
          stocks.rb
        /mapreduces
          /partials
            _regressions.coffee
          /maps
            /stocks
              valuation_above.coffee
          /reduces
            /stocks
              max_variance.coffee
      /config
        /initializers
          mister.rb

# Model Example

```ruby
class Stock
  mapreduce_config :include => [:regressions]

  # or:

  reduces :max_variance {
    includes :regressions
  }
end

Stock.where(:symbol => 'GOOG').maps(:valuation_above => [600]).reduces(:max_variance => [1.month])
```

The symbol is used to look for the map or reduce file, with the same name. If there are any necessary support files,
you can specify that inside your model. It's also assumed that the file name and the entry function are the same, unless
you specify otherwise. ie,

```ruby
reduces :max_variance {
  includes  :regressions
  sources   :max_variance
  calls     :variance
}
```

# Configuration Example

```ruby
Mister.setup do |config|
  config.keep     = true
  config.timeout  = 90_000

  config[:production, :staging] do |envs|
    envs.minify = true
    envs.cache  = true
  end
end
```


[tpdub]:http://tom.preston-werner.com/2010/08/23/readme-driven-development.html
