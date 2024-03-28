namespace :subscription do
  desc "TODO"
  task check: :environment do
    User.all.each do |user| # Loop on all users to check everyone
      if user.end_date != nil # Select the users have not a Nil end Date
        if DateTime.now > user.end_date.to_datetime # Think about the jetLag. DateTime.now is UTC - 1
          user.update(is_subscriber: false, end_date: nil) # Remove the subscriber status and remove the end date to Nil.
        end
      end
    end
  end

end
