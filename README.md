# geostatics
Projeto de pesquisa sobre impacto da qualidade da água sobre


Esse projeto funciona com duas frentes de trabalho.

1. Química e análises da qualidade da água
2. Equipe tecnológica que desenvolve e mantém a plataforma

### Acompanhamento da qualidade de água

### Tecnologia

Para esse projeto, por ser desenvolvido e mantido por alunos dos cursos técnicos de informática, optamos por tecnologias que estão em evidência mercadológica. Buscamos reduzir o que gap entre mercado e academia, utilizando tecnologias que o mercado tem como tendência.

#### Linguagens de marcação e estruturação

As linguagens utilizadas para marcação, ou seja, criar estrutura base de conteúdo e visualização dos dados, foram HTML e CSS. Para maximizar os resultados optamos por lançar mão do Framework [Bootstrap](https://getbootstrap.com.br). Além disso utilizamos o [Google Maps](https://developers.google.com/maps/documentation) para visualização de mapas do nosso projeto, onde foi possível explorar a API via trabalho e formatação *Java Script*.

Aqui utilizamos:
- Bootstrap
- SASS
- HTML
- Google Maps
- Javascript

#### Javascript

A linguagem de scripts mais popular da internet, *Java Script* foi utilizada em dois momentos principais: (i) para consumo e configuração dos maps do Google Maps; (ii) consumo de dados via uma API construída com PHP, onde era possível consultar o banco de dados com informações do projeto.

Aqui utilizamos:
- Javascript
- PHP
- Utilização de API REST


#### PHP

A linguagem de *server-side* foi PHP. Por ser uma linguagem com baixa curva de aprendizado, documentação madura e vasta quantidade de materiais de aprendizado espalhado pela internet. Para utilizar com mais *performance* e produtividade, utilizamos alguns microframeworks para criar estruturas de API REST e utilização mais consistente do ORM (mapeamento objeto-relacional).

- Flight PHP
Para criar a estrutura da API, utilizamos o [microframework Flight PHP](https://flightphp.com). Se trata de uma estrutura simplificada onde é possível criar rotas mais amigáveis e saídas configuradas com fins de melhorar o uso de dados via JSON (notação de objeto em javascript).

Com a utilização do Flight ficou mais fácil utilizar as camadas do MVC (modelo, visualização e controle) e ter resultados mais rápidos e robustos.

- NotORM
A utilização de banco de dados relacional implica na complexidade de realizar o mapeamento de uma estrutura relacional (MySQL) para uma estutura de objetos (PHP). Entender esses conceitos é essencial para o mapeamento correto e o resultado final com qualidade. Para tanto utilizamos o [NotORM](https://www.notorm.com). Ele é uma biblioteca escrita em PHP para realizar a tarefa abstrair o mapeamento objeto-relacional.


#### MySQL

O banco eleito para trabalhar neste projeto foi o [MySQL](https://www.mysql.com) por ser um banco gratuito, simples de usar e com alta performance. Além disso ele é fácil de aprender e é comumente utilizados nos cursos do IFRN.


