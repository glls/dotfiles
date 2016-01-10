#!/bin/sh
brew update; brew cleanup; brew cask cleanup
brew outdated
brew upgrade