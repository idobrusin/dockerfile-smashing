#!/bin/bash

function install_widgets() {
  WIDGETS=$1
  if [[ ! -z "$WIDGETS" ]]; then
    for WIDGET in $WIDGETS; do
      echo -e "\nInstalling widget from gist $WIDGET"
      dashing install "$WIDGET"
    done
  fi
}

function install_gems() {
  GEMS=$1
  if [[ ! -z "$GEMS" ]]; then
    echo -e "\nInstalling gem(s): $GEMS"
    for GEM in $GEMS; do
      echo -e "\ngem '$GEM'" >> Gemfile
    done
    bundle install
  fi
}

if [[ ! -e /installed ]]; then
  install_widgets $WIDGETS
  install_gems $GEMS
  touch /installed
fi

# Start dashing
exec dashing start

