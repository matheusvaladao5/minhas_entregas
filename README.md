# minhas_entregas

Projeto de aplicativo Flutter para controle de entrega de pacotes

## Getting Started

Para utilizar o projeto, siga os seguintes passos:

1 - Baixe o código fonte para sua máquina pessoal.<br/>
2 - Crie uma conta no Firebase.<br/>
3 - Crie um projeto no Firebase.<br/>
4 - Configure o projeto seguindo o passo descrito no Firebase para configurar o uso em um projeto Flutter.<br/>
4.1 - Configure como pacote base no Firebase: com.example.minhas_entregas<br/>
4.2 - Baixe o arquivo google-services.json e adicione dentro de android/app/<br/>
5 - Habilite autenticação no Firebase por email e senha.<br/>
6 - Crie um banco de dados Firestore.<br/>
7 - Crie duas collections: deliveries e receivers<br/>
8 - Para conseguir cadastrar deliveries "pacotes" pelo aplicativo, insira manualmente nos receivers os objetos relativos aos recebedores na seguinte estrutura do exemplo abaixo:<br/>

    String - address : "Rua Jose da Silva, 180"
    Geopoint - localization : [43° N, 57° E]
    String - name : "Marcos"
    String - phone : "11993445566"
    double - value : 4.5
