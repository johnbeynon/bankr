[![Build Status](https://secure.travis-ci.org/johnbeynon/bankr.png?branch=master)](https://travis-ci.org/johnbeynon/bankr)

Bankr is intended as a PERSONAL tool for analysing OFX files exported from your bank (tested against HSBC UK accounts). It should be
considered a WORK IN PROGRESS. It is a tool that scratches an itch for me, it's not pretty either.

Steps to get up and running
-------------

* Checkout code
* bundle
* start rails server
* visit site and sign up
* login as new user
* Click on Add Account
* Remember ID of account (from url)
* import statement (see below)

Importing Statements
-------------

At the moment importing is a manual process performed from the command like, both .csv and .ofx files are supported.

* rake import:ofx[filename, account_id]
* rake import:csv[filename, account_id]
