<h1>Tuiter</h1>
<p>Esse projeto tem por objetivo apresentar um timeline mais completo, estilo Twitter, com dados de um banco de dados local, para a Seleção de Estágio Elcoma</p>
<h1>Recursos</h1>
<p>O projeto foi desenvolvido usando Ruby on Rails e Bootstrap. Por isso, é necessário ter o Ruby on Rails instalado no sistema que irá testá-lo</p>
<h1>Instalação</h1>
<p>Para instalar o Sistema é necessário alguns simples passos:</p>
<h2>RoR on Linux</h2>
<p>Para instalar o Ruby on Rails no Ubuntu/Fedora, basta usar os scripts rails-install-fedora.sh / rails-install-ubuntu.sh fornecidos pelas RailsGirls</p>
<h2>RoR no Windows/OSX</h2>
<p>Você pode seguir o tutorial em: <a href="http://guides.railsgirls.com/install">Guides.RailsGirls.com</a>.</p>
<h2>Setup do Website</h2>
<p>Para executar o Website, é necessário alguns comandos simples. Com o projeto baixado e descompactado, navegue até a pasta do projeto com o terminal e execute:</p>
<b>bundle install</b>
<p>Esse comando instalará os recursos necessários ao projeto</p>
<b>rake db:setup</b>
<p>Esse comando irá configurar a base de dados</p>
<b>rake db:seed</b>
<p>Esse comando irá preencher a base de dados com alguns dados</p>
<b>rails s</b>
<p>Esse comando executará o servidor do Rails</p>
<h1>Visualizando</h1>
<p>No navegador, acesse <a href="http://localhost:3000">http://localhost:3000</a></p>
<p>Pronto, o projeto já deve estar em execução</p>
<p>Crie um novo usuário para usar o Tuiter. O banco de dados é local, então não é preciso se preocupar em usar dados reais.</p>
<h1>Código fonte</h1>
<p>A base do código fonte se encontra em:</p>
<b>./app/assets/stylesheets/tuiter.scss</b><br>
<b>./app/assets/javascripts/scripts.js</b><br>
<b>./app/controllers/tuiter_controller.rb</b><br>
<b>./app/views/layouts/application.html.erb</b><br>
<b>./app/views/tuiter/home.html.erb</b><br>
<b>./app/views/tuiter/view_posts.html.erb</b><br>
<b>./app/views/tuiter/view_user.html.erb</b><br>
<b>./app/views/tuiter/edit_page.html.erb</b><br>
<b>./config/routes.rb</b>
<b>./db/migrate/001_users.rb</b><br>
<b>./db/migrate/002_posts.rb</b><br>
<b>./db/migrate/003_likes.rb</b><br>
<b>./db/schema.rb</b><br>
<b>./db/seeds.rb</b><br>
