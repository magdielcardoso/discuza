# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data in development to avoid duplicates
if Rails.env.development?
  puts "🧹 Cleaning existing data..."
  AnswerMark.destroy_all
  Reaction.destroy_all
  Vote.destroy_all
  Reply.destroy_all
  Discussion.destroy_all
  User.where.not(email: [ 'admin@devconnect.com' ]).destroy_all
  Category.destroy_all
end

puts "🌱 Starting comprehensive seeding..."

# === CATEGORIES ===
puts "\n📁 Seeding Categories..."

categories_data = [
  { name: 'Geral', icon: 'circle-dot', color_class: 'stroke-gray-800 dark:stroke-white' },
  { name: 'Rails', icon: 'gem', color_class: 'text-red-500' },
  { name: 'Ruby', icon: 'heart', color_class: 'text-red-700' },
  { name: 'Hotwire', icon: 'zap', color_class: 'text-purple-500' },
  { name: 'Stimulus', icon: 'sparkles', color_class: 'text-blue-500' },
  { name: 'Frontend', icon: 'palette', color_class: 'text-green-500' },
  { name: 'Backend', icon: 'code', color_class: 'text-gray-600' },
  { name: 'Deploy', icon: 'cloud-upload', color_class: 'text-orange-500' },
  { name: 'Testing', icon: 'shield-check', color_class: 'text-purple-600' },
  { name: 'Performance', icon: 'activity', color_class: 'text-yellow-500' },
  { name: 'Security', icon: 'lock', color_class: 'text-red-600' },
  { name: 'Database', icon: 'database', color_class: 'text-blue-600' }
]

categories_data.each do |category_attrs|
  Category.find_or_create_by!(name: category_attrs[:name]) do |category|
    category.icon = category_attrs[:icon]
    category.color_class = category_attrs[:color_class]
  end
end

puts "Categories seeded: #{Category.count}"

# === USERS ===
puts "\n👥 Seeding Users..."

users_data = [
  { name: "Stan Dev", email: "stan@devconnect.com", is_admin: true },
  { name: "Marie Curie", email: "marie@devconnect.com" },
  { name: "Ada Lovelace", email: "ada@devconnect.com" },
  { name: "Grace Hopper", email: "grace@devconnect.com" },
  { name: "Linus Torvalds", email: "linus@devconnect.com" },
  { name: "Yukihiro Matsumoto", email: "matz@devconnect.com" },
  { name: "DHH", email: "dhh@devconnect.com" },
  { name: "Kent Beck", email: "kent@devconnect.com" },
  { name: "Martin Fowler", email: "martin@devconnect.com" },
  { name: "Robert Martin", email: "uncle.bob@devconnect.com" },
  { name: "Sandi Metz", email: "sandi@devconnect.com" },
  { name: "Aaron Patterson", email: "tenderlove@devconnect.com" },
  { name: "Avdi Grimm", email: "avdi@devconnect.com" },
  { name: "Katrina Owen", email: "katrina@devconnect.com" },
  { name: "José Valim", email: "jose@devconnect.com" },
  { name: "Rafael França", email: "rafael@devconnect.com" }
]

users = users_data.map do |user_attrs|
  User.find_or_create_by!(email: user_attrs[:email]) do |user|
    user.name = user_attrs[:name]
    user.password = "password123"
    user.password_confirmation = "password123"
    user.is_admin = user_attrs[:is_admin] || false
  end
end

puts "Users seeded: #{User.count}"

# === DISCUSSIONS ===
puts "\n💬 Seeding Discussions..."

discussion_topics = [
  {
    title: "Como estruturar um projeto Rails grande?",
    content: "Estou trabalhando em um projeto Rails que está crescendo rapidamente. Quais são as melhores práticas para organizar o código, dividir responsabilidades e manter a arquitetura limpa?",
    category: "Rails"
  },
  {
    title: "Hotwire vs React: Qual escolher em 2024?",
    content: "Tenho um projeto Rails existente e preciso adicionar mais interatividade. Estou em dúvida entre usar Hotwire (Turbo + Stimulus) ou integrar React. Quais são os prós e contras?",
    category: "Frontend"
  },
  {
    title: "Otimização de queries N+1 no Active Record",
    content: "Minha aplicação está com problemas de performance devido a queries N+1. Quais estratégias vocês usam para identificar e resolver esses problemas?",
    category: "Performance"
  },
  {
    title: "Deploy com Kamal: Vale a pena?",
    content: "Estou considerando migrar de Heroku para deploy próprio usando Kamal. Alguém tem experiência? Quais os benefícios e desafios?",
    category: "Deploy"
  },
  {
    title: "Ruby 3.3: Novidades que valem a pena",
    content: "Acabei de atualizar para Ruby 3.3 e queria compartilhar algumas descobertas interessantes. Quais features vocês estão mais animados para usar?",
    category: "Ruby"
  },
  {
    title: "Testing com RSpec vs Minitest",
    content: "Sempre usei RSpec mas tenho visto muita gente migrando para Minitest. Quais são as vantagens de cada um? Vale a pena mudar?",
    category: "Testing"
  },
  {
    title: "Segurança em aplicações Rails",
    content: "Quais são as principais vulnerabilidades que devo me preocupar em uma aplicação Rails moderna? Além das proteções padrão do framework.",
    category: "Security"
  },
  {
    title: "PostgreSQL vs MySQL para Rails",
    content: "Estou iniciando um novo projeto e preciso escolher o banco de dados. Qual a experiência de vocês com PostgreSQL vs MySQL em projetos Rails?",
    category: "Database"
  },
  {
    title: "Stimulus Controllers: Organização e boas práticas",
    content: "Como vocês organizam os Stimulus controllers em projetos grandes? Alguma convenção de nomenclatura ou estrutura de pastas?",
    category: "Stimulus"
  },
  {
    title: "Background Jobs: Sidekiq vs Good Job",
    content: "Preciso implementar background jobs e estou entre Sidekiq e Good Job. Quais são os prós e contras de cada um?",
    category: "Backend"
  },
  {
    title: "Turbo Frames vs Turbo Streams",
    content: "Ainda tenho dúvidas sobre quando usar Turbo Frames e quando usar Turbo Streams. Alguém pode explicar com exemplos práticos?",
    category: "Hotwire"
  },
  {
    title: "Rails 8: O que esperar?",
    content: "Com o Rails 8 se aproximando, quais features vocês estão mais ansiosos? Solid Queue e Solid Cache parecem promissores!",
    category: "Rails"
  },
  {
    title: "API-only Rails: Design patterns",
    content: "Estou construindo uma API Rails para uma aplicação mobile. Quais patterns vocês recomendam para organizar controllers e serializers?",
    category: "Backend"
  },
  {
    title: "CSS moderno em Rails: Tailwind vs CSS-in-JS",
    content: "Qual abordagem vocês preferem para CSS em aplicações Rails? Tailwind, PostCSS, ou alguma solução CSS-in-JS?",
    category: "Frontend"
  },
  {
    title: "Monitoramento e observabilidade",
    content: "Quais ferramentas vocês usam para monitorar aplicações Rails em produção? APM, logs, métricas...",
    category: "Performance"
  },
  {
    title: "Docker para desenvolvimento Rails",
    content: "Vale a pena usar Docker para desenvolvimento local de aplicações Rails? Quais os benefícios e problemas que encontraram?",
    category: "Deploy"
  },
  {
    title: "ActiveRecord vs ROM.rb",
    content: "Alguém aqui já experimentou ROM.rb como alternativa ao ActiveRecord? Como foi a experiência?",
    category: "Database"
  },
  {
    title: "Autenticação: Devise vs Auth0 vs Custom",
    content: "Para um novo projeto, qual abordagem vocês recomendam para autenticação? Devise ainda é a melhor opção?",
    category: "Security"
  },
  {
    title: "TDD em Rails: Como começar?",
    content: "Quero implementar TDD no meu workflow de Rails. Quais recursos vocês recomendam para aprender e quais armadilhas evitar?",
    category: "Testing"
  },
  {
    title: "Rails Console: Dicas e truques",
    content: "Compartilhem suas dicas favoritas para usar o rails console de forma mais produtiva!",
    category: "Rails"
  },
  {
    title: "Metaprogramming em Ruby: Quando usar?",
    content: "Ruby permite muito metaprogramming, mas quando realmente devemos usar? Quais são as boas práticas?",
    category: "Ruby"
  },
  {
    title: "Caching strategies em Rails",
    content: "Quais estratégias de cache vocês usam em aplicações Rails? Fragment caching, Russian Doll, Redis...",
    category: "Performance"
  },
  {
    title: "Importmap vs esbuild vs Vite",
    content: "Qual solução vocês preferem para gerenciar JavaScript em Rails 7+? Importmap, esbuild, ou Vite?",
    category: "Frontend"
  },
  {
    title: "Solid Queue vs Sidekiq: Migração",
    content: "Alguém já migrou de Sidekiq para Solid Queue? Como foi o processo e quais os benefícios percebidos?",
    category: "Backend"
  },
  {
    title: "View Components vs Partials",
    content: "Vale a pena usar View Components ou partials ainda são suficientes para a maioria dos casos?",
    category: "Frontend"
  },
  {
    title: "ActiveStorage vs Shrine vs Carrierwave",
    content: "Para upload de arquivos em Rails, qual gem vocês preferem e por quê?",
    category: "Rails"
  },
  {
    title: "GDPR compliance em Rails",
    content: "Como vocês implementam compliance com GDPR em aplicações Rails? Alguma gem específica ou solução custom?",
    category: "Security"
  },
  {
    title: "Database migrations em produção",
    content: "Quais cuidados vocês tomam ao rodar migrations em produção? Zero-downtime deployments são possíveis?",
    category: "Database"
  },
  {
    title: "Rails Engines: Quando usar?",
    content: "Em quais cenários Rails Engines fazem sentido? Alguém tem experiência com modularização usando engines?",
    category: "Rails"
  },
  {
    title: "Code reviews em Rails: Checklist",
    content: "Qual checklist vocês usam para code reviews em projetos Rails? O que sempre verificam?",
    category: "Geral"
  },
  {
    title: "Debugging tools para Rails",
    content: "Além do binding.pry, quais ferramentas vocês usam para debug em Rails? Gems úteis?",
    category: "Geral"
  },
  {
    title: "Rails API + SPA: Autenticação JWT",
    content: "Como vocês implementam autenticação JWT em APIs Rails que servem SPAs? Alguma gem recomendada?",
    category: "Security"
  },
  {
    title: "Active Job: Error handling",
    content: "Qual a melhor estratégia para handle de erros em Active Jobs? Retry policies, dead letter queues...",
    category: "Backend"
  },
  {
    title: "Rails 7.1: Novas features favoritas",
    content: "Quais features do Rails 7.1 vocês mais gostaram? Composite primary keys? Async queries?",
    category: "Rails"
  },
  {
    title: "Turbo Drive: Problemas e soluções",
    content: "Alguém já teve problemas com Turbo Drive quebrando JavaScript de terceiros? Como resolveram?",
    category: "Hotwire"
  },
  {
    title: "Rails deployment: AWS vs DigitalOcean",
    content: "Para deploy de aplicações Rails, vocês preferem AWS ou DigitalOcean? Custos e complexidade?",
    category: "Deploy"
  },
  {
    title: "ActiveRecord callbacks: Boas práticas",
    content: "Como vocês lidam com callbacks complexos no ActiveRecord? Service objects? Observers?",
    category: "Rails"
  },
  {
    title: "Ruby gems essenciais para Rails",
    content: "Quais gems vocês consideram essenciais em qualquer projeto Rails? Além das óbvias como Devise.",
    category: "Ruby"
  },
  {
    title: "CSS Grid vs Flexbox em Rails apps",
    content: "Para layouts em aplicações Rails, vocês preferem CSS Grid ou Flexbox? Quando usar cada um?",
    category: "Frontend"
  },
  {
    title: "Rails concerns: Overuse ou úteis?",
    content: "Concerns são úteis ou são um code smell? Como vocês decidem quando extrair código para um concern?",
    category: "Rails"
  },
  {
    title: "Stimulus Reflex vs LiveView",
    content: "Alguém aqui já comparou Stimulus Reflex com Phoenix LiveView? Quais as diferenças na prática?",
    category: "Stimulus"
  },
  {
    title: "Rails logging: Structured logging",
    content: "Como implementar structured logging em Rails? JSON logs para melhor observabilidade?",
    category: "Performance"
  },
  {
    title: "Active Model Serializers vs Jbuilder",
    content: "Para APIs Rails, vocês preferem AMS, Jbuilder ou outra solução? Prós e contras?",
    category: "Backend"
  },
  {
    title: "Rails new app: Setup inicial",
    content: "Qual o setup inicial vocês fazem em todo projeto Rails novo? Gems, configurações, etc?",
    category: "Rails"
  },
  {
    title: "Ruby performance: Profiling tools",
    content: "Quais ferramentas vocês usam para profile de performance em Ruby/Rails? ruby-prof, stackprof?",
    category: "Performance"
  },
  {
    title: "Stimulus vs Alpine.js",
    content: "Para pequenas interações em Rails apps, vocês preferem Stimulus ou Alpine.js? Por quê?",
    category: "Frontend"
  },
  {
    title: "Rails credentials vs ENV vars",
    content: "Como vocês gerenciam secrets em Rails? Credentials, ENV vars, ou soluções como Vault?",
    category: "Security"
  },
  {
    title: "Database indexing em Rails",
    content: "Quais estratégias vocês usam para indexing em bancos Rails? Como identificar índices necessários?",
    category: "Database"
  },
  {
    title: "Rails upgrade: De 6 para 7",
    content: "Alguém fez upgrade de Rails 6 para 7 recentemente? Quais foram os principais desafios?",
    category: "Rails"
  },
  {
    title: "Action Cable vs third-party",
    content: "Para real-time features, Action Cable é suficiente ou vocês usam soluções como Pusher?",
    category: "Backend"
  }
]

# Create discussions with random users and categories
discussions = []
discussion_topics.each do |topic|
  category = Category.find_by(name: topic[:category]) || Category.first
  user = users.sample

  discussion = Discussion.create!(
    title: topic[:title],
    content: topic[:content],
    user: user,
    category: category,
    pinned: [ true, false, false, false ].sample, # 25% chance of being pinned
    closed: [ true, false, false, false, false ].sample # 20% chance of being closed
  )

  # Add closure details for closed discussions
  if discussion.closed?
    discussion.update!(
      closed_at: rand(1..30).days.ago,
      closed_by: users.sample,
      closure_status: [ Discussion::RESOLVED, Discussion::NOT_RESOLVED ].sample,
      closure_reason: "Discussion concluded with sufficient answers."
    )
  end

  discussions << discussion
end

puts "Discussions seeded: #{Discussion.count}"

# === REPLIES ===
puts "\n💭 Seeding Replies..."

reply_contents = [
  "Excelente pergunta! Na minha experiência, a melhor abordagem é...",
  "Tive o mesmo problema recentemente. O que funcionou para mim foi...",
  "Discordo um pouco da resposta anterior. Acredito que...",
  "Para complementar a resposta anterior, gostaria de adicionar que...",
  "Já passei por isso também. Uma dica importante é...",
  "Ótima discussão! Aqui estão algumas considerações adicionais...",
  "Na documentação oficial menciona que...",
  "Um padrão que tenho usado com sucesso é...",
  "Cuidado com essa abordagem porque pode causar...",
  "Uma alternativa interessante seria...",
  "Isso me lembra de um caso similar que tive...",
  "A comunidade Rails geralmente recomenda...",
  "Segundo o DHH em uma talk recente...",
  "Para projetos pequenos, sugiro...",
  "Em produção, sempre verifico...",
  "Uma gem que pode ajudar nesse caso é...",
  "Testei essa solução e os resultados foram...",
  "A partir do Rails 7, temos a opção de...",
  "Performance-wise, é melhor...",
  "Para debugging, costumo usar..."
]

longer_replies = [
  "Essa é uma questão complexa que merece uma resposta detalhada.\n\nPrimeiro, é importante entender que não existe uma solução única que funcione para todos os casos. Cada projeto tem suas particularidades e restrições específicas.\n\nNa minha experiência de mais de 5 anos trabalhando com Rails, posso dizer que a abordagem mais eficaz geralmente envolve uma combinação de fatores:\n\n1. **Análise do contexto atual** - Antes de implementar qualquer solução, é crucial entender o estado atual do projeto, suas limitações e objetivos.\n\n2. **Planejamento incremental** - Ao invés de fazer mudanças drásticas, prefiro implementar melhorias de forma gradual e iterativa.\n\n3. **Testes abrangentes** - Qualquer mudança significativa deve ser acompanhada de testes adequados para garantir que não introduzimos regressões.\n\nEspero que isso ajude! Se tiverem dúvidas específicas sobre algum ponto, posso elaborar mais.",

  "Ótima pergunta! Vou compartilhar minha experiência prática com esse problema.\n\nRecentemente tive que implementar uma solução similar em um projeto enterprise com mais de 100k usuários ativos. O desafio era encontrar um balance entre performance, maintainability e developer experience.\n\nApós várias tentativas e benchmarks, chegamos à seguinte arquitetura:\n\n```ruby\n# Este seria um exemplo de implementação\n# mas não vou incluir código real aqui\n```\n\nOs resultados foram impressionantes:\n- 40% de redução no tempo de resposta\n- 60% menos uso de memória\n- Zero downtime durante a migração\n\nAlgumas lições aprendidas no processo:\n- Sempre meça antes de otimizar\n- Performance prematura é a raiz de todo mal\n- A documentação é tão importante quanto o código\n\nSe alguém quiser mais detalhes técnicos sobre a implementação, posso compartilhar em uma discussão separada.",

  "Interessante discussão! Vou adicionar uma perspectiva diferente baseada na minha experiência em startups vs empresas grandes.\n\n**Em startups (até 10 pessoas):**\nA velocidade de desenvolvimento é crítica. Priorizo soluções simples e diretas, mesmo que não sejam as mais elegantes. O importante é validar o product-market fit rapidamente.\n\n**Em empresas médias (10-50 pessoas):**\nComeço a me preocupar mais com arquitetura e sustentabilidade do código. Introduzo patterns mais sofisticados e invisto em tooling para manter a qualidade.\n\n**Em empresas grandes (50+ pessoas):**\nFoco em standardização, documentação e processos bem definidos. A arquitetura precisa suportar múltiplos times trabalhando em paralelo.\n\nCada contexto tem suas trade-offs. O importante é reconhecer em qual estágio você está e adaptar sua abordagem accordingly.\n\nQual é o contexto do seu projeto? Isso pode ajudar a dar uma recomendação mais específica."
]

# Create replies for each discussion
discussions.each do |discussion|
  next if discussion.closed? && rand > 0.3 # Closed discussions have fewer replies

  # Each discussion gets 1-8 replies
  reply_count = discussion.closed? ? rand(1..3) : rand(1..8)

  reply_count.times do |i|
    content = if i == 0 && rand > 0.7
                longer_replies.sample
    else
                reply_contents.sample
    end

    Reply.create!(
      discussion: discussion,
      user: users.sample,
      content: content
    )
  end
end

puts "Replies seeded: #{Reply.count}"

# === VOTES ===
puts "\n👍 Seeding Votes..."

# Vote on discussions (70% get votes)
Discussion.includes(:user).find_each do |discussion|
  next if rand > 0.7

  # Each discussion gets 1-15 votes
  voters = users.sample(rand(1..15))
  voters.each do |voter|
    next if voter == discussion.user # Users can't vote on their own content

    Vote.create!(
      user: voter,
      votable: discussion,
      value: [ 1, 1, 1, -1 ].sample # 75% upvotes, 25% downvotes
    )
  end
end

# Vote on replies (60% get votes)
Reply.includes(:user, :discussion).find_each do |reply|
  next if rand > 0.6

  # Each reply gets 1-10 votes
  voters = users.sample(rand(1..10))
  voters.each do |voter|
    next if voter == reply.user # Users can't vote on their own content

    Vote.create!(
      user: voter,
      votable: reply,
      value: [ 1, 1, 1, -1 ].sample # 75% upvotes, 25% downvotes
    )
  end
end

puts "Votes seeded: #{Vote.count}"

# === REACTIONS ===
puts "\n😊 Seeding Reactions..."

emoji_options = [ '👍', '❤️', '😂', '😮', '😢', '😡', '🚀', '👏', '🔥', '💯' ]

# Add reactions to discussions (50% get reactions)
Discussion.includes(:user).find_each do |discussion|
  next if rand > 0.5

  # Each discussion gets 1-8 reactions
  reactors = users.sample(rand(1..8))
  reactors.each do |reactor|
    next if reactor == discussion.user # Users can't react to their own content

    Reaction.create!(
      user: reactor,
      reactable: discussion,
      emoji: emoji_options.sample
    )
  end
end

# Add reactions to replies (40% get reactions)
Reply.includes(:user, :discussion).find_each do |reply|
  next if rand > 0.4

  # Each reply gets 1-5 reactions
  reactors = users.sample(rand(1..5))
  reactors.each do |reactor|
    next if reactor == reply.user # Users can't react to their own content

    Reaction.create!(
      user: reactor,
      reactable: reply,
      emoji: emoji_options.sample
    )
  end
end

puts "Reactions seeded: #{Reaction.count}"

# === ANSWER MARKS ===
puts "\n✅ Seeding Answer Marks..."

# Mark some replies as answers (only for discussions that have replies and aren't closed)
Discussion.joins(:replies).includes(:replies, :user).distinct.each do |discussion|
  next if discussion.closed?
  next if rand > 0.3 # Only 30% of discussions have marked answers

  # Pick a random reply with some upvotes to mark as answer
  potential_answers = discussion.replies.joins(:votes)
                                       .where(votes: { value: 1 })
                                       .group('replies.id')
                                       .having('COUNT(votes.id) >= ?', 2)

  if potential_answers.any?
    answer_reply = potential_answers.sample

    AnswerMark.create!(
      user: discussion.user, # Only discussion owner can mark answers
      reply: answer_reply
    )
  end
end

puts "Answer marks seeded: #{AnswerMark.count}"

puts "\n🎉 Seeding completed successfully!"
puts "="*50
puts "📊 Final count:"
puts "   Categories: #{Category.count}"
puts "   Users: #{User.count}"
puts "   Discussions: #{Discussion.count}"
puts "   Replies: #{Reply.count}"
puts "   Votes: #{Vote.count}"
puts "   Reactions: #{Reaction.count}"
puts "   Answer Marks: #{AnswerMark.count}"
puts "   Total items: #{Category.count + User.count + Discussion.count + Reply.count + Vote.count + Reaction.count + AnswerMark.count}"
puts "="*50
