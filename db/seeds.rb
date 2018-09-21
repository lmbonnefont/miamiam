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


lien = html_doc.css('a.photoenglob img').take(63)
lien.each do |img|
  p img["src"]
end

# recettes = html_doc.search('.photoenglob').take(63)

# urls = []
# recettes.each do |element|
#   urls << element["href"]
# end

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

#   recette = Recette.create!(nom: titre, instruction: instructions, nb_personne: nombre)


# ###############################################################################


# instructions = html_doc.search('#ingredients').text.strip.split(",")
# instructions.each do |ingredient|
#   ingredient.gsub!("\n","")
# end


# #on remplace les ratio par des nombres

# substitution_number = {
#   "1/2": 0.5,
#   "1/4": 0.25,
#   "3/4": 0.75,
# }


# instructions.each do |combinaison|
#   if substitution_number[combinaison[0..2].to_sym] != nil
#     nb = substitution_number[combinaison[0..2].to_sym].to_s
#     combinaison.gsub!(combinaison[0..2], nb)
#   end
# end

# p instructions
# instructions.each do |combinaison|
#   if combinaison.match(/\d.\d/)
#     quantité = combinaison.match(/\d.\d/).to_s
#     ingredient = combinaison[quantité.to_s.length + 1..-1]
#   elsif combinaison.match(/\d/)
#     quantité = combinaison.match(/\d/).to_s
#     ingredient = combinaison[quantité.to_s.length + 1..-1]
#   else quantité = 1
#     ingredient = combinaison
#   end

#   dose = Dose.create!(quantite: quantité, ingredient:ingredient, recette: recette)
# end



# ###############################################################################



#   puts "Et hop une recette dans la besace :)"
# end
