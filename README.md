# README

SA crime stats app consumes the api https://data.code4sa.org/resource/fgg4-qjnk.json/ # [Not available anymore]
to get the crime statistics in South Africa and computes the data to represent it in
a more interactive manner.

# Instructions to run locally

* git clone https://github.com/Vutivi/sa-crime-statistics.git
* cd sa-crime-stats
* npm install
* bundle install
* rake start

# Deploy to production

* heroku apps:create sa-crime-stats
* heroku buildpacks:add heroku/nodejs --index 1
* heroku buildpacks:add https://github.com/bundler/heroku-buildpack-bundler2 --index 2
* git add .
* git commit -m "deploy to heroku"
* git push heroku master

# Production link

https://sa-crime-stats.herokuapp.com/
