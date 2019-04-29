require "http"

system "clear"

word = ""

until word == "q" do

  puts ""
  print "Please enter a word to get its definition(press q to quit): "
  word = gets.chomp

  if word == "q"
    break
  end

  puts ""
  puts "=" * 50

  definition_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=5&includeRelated=false&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  definitions = definition_response.parse
  puts "DEFINITIONS"
  puts "=" * 50
  count = 1

  definitions.each do |definition|
    puts "#{count}. #{definition["text"]}."
    puts ""
    count += 1
  end

  # definition = def_data[0]["text"]

  example_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  example_data = example_response.parse
  example = example_data["text"]

  puts "The top example of #{word} is #{example}."
  puts ""

  # puts "=" * 50
  # puts "EXAMPLES"
  # puts "=" * 50
  # count = 1

  # examples.each do |example|
  #   puts "#{count}. #{example["text"]}."
  #   puts ""
  #   count += 1
  # end

  pronounce_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=5&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  pronounciations = pronounce_response.parse

  puts "Pronounciations"
  puts "=" * 50
  count = 1

  pronounciations.each do |pronounciation|
    puts "#{count}. #{pronounciation["raw"]}."
    puts ""
    count += 1
  end

  audio_response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  audio_data = audio_response.parse
  audio = audio_data[0]["fileUrl"]

  word.capitalize!

  # puts "A definition of #{word} is: #{definition}."
  # puts ""
 
  # puts "#{word} is pronounced #{prounctiation}."
  # puts ""
  puts "=" * 50
end