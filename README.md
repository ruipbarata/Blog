# Blog
This project consists of a blog where users can create their own articles, as well as comment on articles written by other users.
#### Dependencies
* [ruby  *2.6.6*](https://www.ruby-lang.org)
* [Rails *6.0.3.2*](https://rubyonrails.org/)
* [PostgreSQL *12.3*](https://www.postgresql.org)
* [Node *10.19.0*](https://nodejs.org/en/)
#### Recommendations
* [Ruby Version Manager (RVM)](https://rvm.io)
* [Node Version Manager (NVM)](https://github.com/nvm-sh/nvm)
* [Docker](https://www.docker.com)
#### Making use of docker
```bash
$ docker-compose up
```
#### Configuration
```bash
$ ./bin/setup
```
**Important**
Don't forget to request the `.env` info to your team.
#### Start the Rails server
```bash
$ rails s (default port number - 3000)
$ rails s -p <port number>
```
Plus, start the Webpack server too `./bin/webpack-dev-server`.
#### Try it:
```bash
curl localhost:3000
```
#### Tests
```bash
$ rails test -b test/models
```

On commit creation:
- insert a "good" message
- rubocop, ESlint and Minitest will run to make sure everything is good
Git Hooks are defined on the `./git/hooks` folder.