namespace :dev do
  desc "Executa o script de setup inicial do ambiente de desenvolvimento (script/setup)"
  task setup: :environment do
    puts "Executando script de setup inicial..."
    system("./script/setup")
    puts "Task de setup concluída."
  end
end 