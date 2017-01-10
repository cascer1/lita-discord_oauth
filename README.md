# lita-discord

[![Build Status](https://travis-ci.org/cascer1/lita-discord.png?branch=master)](https://travis-ci.org/cascer1/lita-discord) [![Gem Version](https://badge.fury.io/rb/lita-discord_oauth.svg)](https://badge.fury.io/rb/lita-discord_oauth)

Discord adapter for Lita, using OAuth tokens.

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

TODO: Describe the plugin's features and how to use them.
