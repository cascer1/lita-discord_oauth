# lita-discord

[![Build Status][travis-img]][travis-url]
[![Gem Version][gem-img]][gem-url]
[![Gem Downloads][gem-dl-img]][gem-url]
[![Dependency status][gem-dep-img]][gem-dep-url]
[![Codacy Badge][codacy-img]][codacy-url]

Discord adapter for Lita, using OAuth tokens.

## No longer maintained

This repository is no longer maintained since I moved away from Lita to JDA. 
Feel free to use the code in this repository in your own Lita adapter.

## Installation

Add lita-discord to your Lita instance's Gemfile:

``` ruby
gem "lita-discord_oauth"
```

## Configuration

The adapter exposes two configuration settings:

* `config.adapters.discord_oauth.token = ''`  
  Bot account token
* `config.adapters.discord_oauth.client = ''`  
  Bot client ID
  
You can get both these values from [this page](https://discordapp.com/developers/applications/me) - Make sure that the application is a bot user!

![bot user](https://ducohosting.com/screenshots/isaac28fe06147f6a73a1a654433cf2ef3d37.png)

## Usage

This bot includes a custom help command. You must disable the built-in help command to prevent double output.


[travis-img]: https://img.shields.io/travis/cascer1/lita-discord_oauth.svg
[travis-url]: https://travis-ci.org/cascer1/lita-discord_oauth
[gem-img]: https://img.shields.io/gem/v/lita-discord_oauth.svg
[gem-url]: https://badge.fury.io/rb/lita-discord_oauth
[gem-dl-img]: https://img.shields.io/gem/dv/lita-discord_oauth/stable.svg
[gem-dep-img]: https://img.shields.io/gemnasium/cascer1/lita-discord_oauth.svg
[gem-dep-url]: https://gemnasium.com/github.com/cascer1/lita-discord_oauth
[codacy-img]: https://img.shields.io/codacy/grade/a66b558f1d7a4fd89673e5514e437493.svg
[codacy-url]: https://www.codacy.com/app/cascer1/lita-discord_oauth?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=cascer1/lita-discord_oauth&amp;utm_campaign=Badge_Grade
