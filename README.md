# lita-discord

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
