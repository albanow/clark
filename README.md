# Clark test scripts

## Ruby version used

> ruby 2.5.7p206 (2019-10-01 revision 67816) [x64-mingw32]

## First install bundler gem

`$ gem install bundler`

## Then execute from project root

`$ bundle install`

## Below gems are being used

> backports 3.15.0
> builder 3.2.3
> bundler 2.0.2
> childprocess 3.0.0
> cucumber-tag_expressions 1.1.1
> gherkin 5.1.0
> cucumber-core 3.2.1
> cucumber-expressions 6.0.1
> cucumber-wire 0.0.1
> diff-lcs 1.3
> multi_json 1.14.1
> multi_test 0.1.2
> cucumber 3.1.2
> rspec-support 3.9.0
> rspec-core 3.9.0
> rspec-expectations 3.9.0
> rubyzip 2.0.0
> selenium-webdriver 3.142.6

## Main gems used

> selenium-webdriver

> cucumber

> rspec

## To execute cucumber features

### For both fatures

`$ cucumber features/login.feature  features/home_tabs.feature`

### For single feature

`$ cucumber features/login.feature`

or 

`$ cucumber features/home_tabs.feature`

A json file for test data is used to centralize the data and run script in different environmets (prod, qa, stage, etc)

## Improvements

* Take a screenshot for failed/passed step.
* Create a log file for each execution to debug failures.
* Define in json test data a key->value pair to switch the browser (chrome, firefox, IE, etc) and implement logic.

