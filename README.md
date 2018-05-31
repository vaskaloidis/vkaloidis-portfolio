# Vasis.Work Portfolio

A portfolio written in Rails. Converting into a Gem for public use (soon).

It also contains a Blog but it has been disabled along with the GitHub feed view. These will be revamped and re-enabled when the Gem is created.

```bash
rails db:setup
rails db:migrate
rails db:data:loade
```

Custom Rake Tasks

```bash
# Import Wordpress Posts for Blog
rake BlueHelmet:import_wp
# Convert all the posts to markdown
rake BlueHelmet:convert_posts_to_markdown
# Unpublish all Blog articles
rake BlueHelmet:unpublish_all_articles

# Custom Seeder
rake BlueHelmet:seed
# Does the following:
Rake::Task['Bluehelmet:import_wp'].invoke
Rake::Task['db:data:load'].invoke
Rake::Task['Bluehelmet:convert_projects'].invoke

# Clear the Cache on Heroku server
rake BlueHelmet:heroku_cache

# Pushes local DB to Heroku
rake BlueHelmet:push_db
# Executes the following
heroku('pg:reset HEROKU_POSTGRESQL_GOLD')
heroku('pg:push vkaloidis HEROKU_POSTGRESQL_GOLD --app vkaloidis')

# Clears Cache
rake BlueHelmet:clear_cache
# Does the following
Rake::Task['tmp:clear'].invoke
Rake::Task['tmp:cache:clear'].invoke
Rake::Task['assets:clean'].invoke

# Clear memcache
rake BlueHelmet:clear_memcache

# View Available Custom Rake Tasks
rake BlueHelmet:info

# In the BlueHelmet.rake file you can use the Heroku method to execute Heroku commands easily in the file
heroku(command_to_run)
# Example
heroku(config:get GMAIL_EMAIL)
```
