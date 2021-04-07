#!/bin/bash

RAILS_ENV=production bin/rails db:prepare
RAILS_ENV=production bin/rails log:clear tmp:clear
RAILS_ENV=production bin/rails server -p 3000