desc "Create Questions with options"
task create_questions: :environment do
  questions = ['What is Your Favorite Season?', 'What Do You Do at Parties?', 'My Ideal Workspace Is...', 'Which Would Be Your Go-To First Date?', 'When Do You Get The Most Done?']
  options = { 'What is Your Favorite Season?'         => ['Winter', 'Spring', 'Summer'], 
  						'What Do You Do at Parties?'            => ['Bring food for everyone', 'Play DJ, I bring the music', 'I make friends with the house pets'],
  						'My Ideal Workspace Is...'              => ['Wherever The Work Takes Me', ' An Art Studio', 'An Office' ],
  						'Which Would Be Your Go-To First Date?' => ['Actor', 'Politician', 'Businessman'],
  						'When Do You Get The Most Done?'        => ['Early Morning', 'Late at Night', 'Whenever Inspiration Hits']
  }
  questions.each do |q|
    que = Question.create(title: q, options: options[q])
  end
  puts "Questions created successfully."
end
