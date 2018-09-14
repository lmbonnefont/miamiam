require 'open-uri'
require 'nokogiri'

Dose.destroy_all
Recette.destroy_all
Semaine.destroy_all
User.destroy_all

user = User.create!(email: "jeanbon@gmail.com", password: "123456")
semaine = Semaine.create!(active: true, user: user)

url = "http://www.unjourunerecette.fr/que-manger-ce-soir"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

recettes = html_doc.search('.photoenglob').take(63)

urls = []
recettes.each do |element|
  urls << element["href"]
end

# urls.each do |lien|

#   puts "ça tourne ..."

#   url = "http://www.unjourunerecette.fr/#{lien}"
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)

#   titre = html_doc.search('.item').first.text
#   titre = titre.strip

#   instructions = html_doc.search('.instructions').first.text
#   instructions = instructions.strip

#   nombre = html_doc.search('#entouringredients .courses').first.text
#   nombre = nombre.strip.match(/\d/)[0].to_i

#   Recette.create!(nom: titre, instruction: instructions, nb_personne: nombre)

#   puts "Et hop une recette dans la besace :)"
# end

url = "http://www.unjourunerecette.fr/recette-taboule-en-assiette-de-poivron"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
instructions = html_doc.search('#ingredients').text.strip.split(",")
instructions.each do |ingredient|
  ingredient.gsub!("\n","")
end

instructions.each do |combinaison|
  quantité = combinaison.match(/\d/)
  if quantité == ""
    quantité = 1
    ingredient = combinaison
  else
    quantité = quantité[0].to_i
    ingredient = combinaison.match(/\s(.*)/)[0].strip
    if ingredient == nil
      ingredient = combinaison
    else
      ingredient = ingredient[0].strip
    end
  end
   p ingredient
end
