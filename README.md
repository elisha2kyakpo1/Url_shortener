<h1 align="center">HelpJuice test</h1>
<div align="center">
  <h3>
  The realtime search box, where users search articles, and then save search queries, have analytics that display what users were searching for. You have to click Analysis button to see what you search. The query will be saved after 5 seconds to give time for users who are a bit slow when typing.
  </h3>
</div>

<div align="center" style="margin-bottom: 20px">
  <h3>
    <span> | </span>
    <a href="urlshortener-production-513b.up.railway.app">
      Live link
    </a>
    <span> | </span>
  </h3>
</div>

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Built With](#built-with)
- [Setup](#setup)
- [Testing](#testing)
- [Author](#author)
- [Elisha Kyakopo](#elisha-kyakopo)


## Built With

- [Ruby on Rails](https://guides.rubyonrails.org/)
- [Stimulusjs](https://stimulus.hotwired.dev/)
- [Bootstrap](https://getbootstrap.com/)
- [Rspect](https://rspec.info/)

## Setup

To get started, you should first get this file in your local machine by cloning or forking this project or typing in your terminal
```
 git clone https://github.com/elisha2kyakpo1/Url_shortener.git
 cd Url_shortener
```
Before you start using the app, you need to be sure that you have Ruby installed on your computer, by typing.
```
 ruby -v
```
You should see your version of ruby.
If it's not installed in your system, follow this [guide](https://www.ruby-lang.org/en/documentation/installation/) and it will help you to get it done.

Then you can install rails using this command,
```
 gem install rails
```
And you can also check your rails version by typing in your terminal
```
 rails -version
```
After that do bundle install to install all required gems and dependences
```
 bundle install
```
Install yarn by running the command below
```
 yarn install
```
Since we are using postgresql database, run this command in your tenimal to create the database
```
 rails db:create

```
Finally, run the migration to populate your database to have the tables

```
 rails db:migrate
```

You then interract with the program from rails server on the web by
```
 rails s
```

Open your favourite blowser and type the command below

```
 http://localhost:3000
```

## Testing

Run the command below to test the app

```
Rspec
```

## Author

## Elisha Kyakopo

  Linkedin: [Elisha Kyakopo](https://www.linkedin.com/in/elisha-kyakopo/)

  Github: [@elisha2kyakpo1](https://github.com/elisha2kyakpo1)

  Twitter: [@elisha1k](https://twitter.com/Elisha1k)
