# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding Categories..."

categories_data = [
  { name: 'Geral', icon: 'circle-dot', color_class: 'stroke-gray-800 dark:stroke-white' },
  { name: 'Rails', icon: 'gem', color_class: 'text-red-500' },
  { name: 'Ruby', icon: 'heart', color_class: 'text-red-700' },
  { name: 'Hotwire', icon: 'zap', color_class: 'text-purple-500' },
  { name: 'Stimulus', icon: 'sparkles', color_class: 'text-blue-500' },
  { name: 'Frontend', icon: 'palette', color_class: 'text-green-500' },
  { name: 'Backend', icon: 'code', color_class: 'text-gray-600' },
  { name: 'Deploy', icon: 'cloud-upload', color_class: 'text-orange-500' }
]

categories_data.each do |category_attrs|
  Category.find_or_create_by!(name: category_attrs[:name]) do |category|
    category.icon = category_attrs[:icon]
    category.color_class = category_attrs[:color_class]
  end
end

puts "Categories seeded: #{Category.count}"

puts "\nSeeding Users and Discussions..."

# Criar Usuários
user1 = User.find_or_create_by!(email: "stan@example.com") do |user|
  user.name = "Stan Dev"
  user.password = "password"
  user.password_confirmation = "password"
  # Adicione user.confirm se Devise confirmable estiver ativo e você quiser confirmar automaticamente
end

user2 = User.find_or_create_by!(email: "marie@example.com") do |user|
  user.name = "Marie Curie"
  user.password = "password123"
  user.password_confirmation = "password123"
end

puts "Users seeded: #{User.count}"

# Criar Discussões
discussions_data = [
  {
    user: user1,
    title: "Qual a melhor forma de aprender Rails?",
    content: "Estou começando com Ruby on Rails e gostaria de dicas sobre as melhores abordagens para aprender o framework de forma eficiente. Quais recursos vocês recomendam? Livros, cursos, projetos práticos?"
  },
  {
    user: user2,
    title: "Hotwire vs React: Prós e Contras",
    content: "Tenho um projeto Rails existente e estou considerando adicionar interatividade no frontend. Estou em dúvida entre usar Hotwire (Turbo + Stimulus) ou integrar React. Quais são os prós e contras de cada abordagem no contexto do Rails?"
  },
  {
    user: user1,
    title: "Dicas para otimizar queries Active Record",
    content: "Percebi que algumas queries no meu app Rails estão lentas. Quais são as melhores práticas para otimizar queries Active Record? Eager loading, select, joins, etc.? Compartilhem suas dicas!"
  },
  {
    user: user2,
    title: "Deploy de Rails com Kamal: Primeiras impressões",
    content: "Recentemente comecei a usar Kamal para fazer deploy das minhas aplicações Rails e estou achando incrível! Alguém mais está usando? Quais suas primeiras impressões e dicas para quem está começando com Kamal?"
  }
]

discussions_data.each do |discussion_attrs|
  Discussion.find_or_create_by!(title: discussion_attrs[:title]) do |discussion|
    discussion.user = discussion_attrs[:user]
    discussion.content = discussion_attrs[:content] # ActionText lidará com isso
    # discussion.category = Category.find_by(name: "Geral") # Exemplo se quiser associar a uma categoria
  end
end

puts "Discussions seeded: #{Discussion.count}"
