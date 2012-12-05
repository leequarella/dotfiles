resetDataBaseAndCloneForTest(){
  bundle exec rake db:reset
  bundle exec rake db:test:clone
}

alias be='bundle exec'
alias beg='bundle exec guard'
alias rst='rails s thin'
alias rdbr=resetDataBaseAndCloneForTest
alias spec='rspec'

alias mysqlp='mysql -u root -pim1coolguy'
alias mysqldumpp='mysqldump -u root -pim1coolguy'

alias udup='sudo apt-get update && sudo apt-get upgrade'

alias adb='~/android-sdk-linux/platform-tools/adb'
alias android='~/android-sdk-linux/tools/android'

#Android Development Tools
PATH=$PATH:$HOME/android-sdk-linux/tools
