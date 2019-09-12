namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end

# After setting up the rake task, you need to run whenever --update-crontab command in the console to tell Whenever to start running your rake tasks.
