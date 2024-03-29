namespace :subscription do
  desc "Check if a user subscription should be deactivate"
  task check: :environment do
    User.all.each do |user| # Loop on all users to check everyone
      if user.end_date != nil # Select the users have not a Nil end Date
        puts "The user #{user.email} has an end date for their subscription : #{user.end_date}"
        if DateTime.now > user.end_date.to_datetime # Think about the jetLag. DateTime.now is UTC - 1
          puts "This user's subscription is now deactivated ==> changing is_subscriber to false and end_date to nil"
          user.update(is_subscriber: false, end_date: nil) # Remove the subscriber status and remove the end date to Nil.
        end
      end
    end
  end
end
