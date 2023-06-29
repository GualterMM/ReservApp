![workflow](https://github.com/GualterMM/ReservApp/actions/workflows/flutter-pipeline.yml/badge.svg)  

# ReservAPP

Aplicativo mobile para Android e iOS para fazer reservas em restaurantes.

## Sobre

O intuito do projeto é permitir ao usuário realizar reservas nos restaurantes cadastrados no aplicativo. Ele poderá navegar entre os diferentes restaurantes da sua cidade, consultar os cardápios e preços, fazer uma reserva na data e horário de sua escolha junto ao número de convidados, deixar uma avaliação para o restaurante e consultar seus restaurantes favoritos.

### Tecnologias Utilizadas
* **Flutter**: O front-end da aplicação é feito inteiramente em Flutter. Sua base de código permite que o aplicativo seja exportado para Android e iOS com performance virtualmente igual a um aplicativo nativo.
* **Django REST Framework**: A API da aplicação é feita utilizando o Django REST Framework. Essa ferramenta permite a construção ágil de uma API web com código limpo e de fácil manutenção.
* **AWS**: A parte de persistência de dados da aplicação será feita utilizando os serviços de banco de dados relacionais da Amazon. O banco de dados na nuvem permite o uso global do aplicativo, e a fácil configuração do mesmo proporciona agilidade no desenvolvimento.

## Pré-requisitos
* O [Android Studio](https://developer.android.com/) deve estar instalado na máquina. Ele contém as ferramentas necessárias para a criação de um emulador Android, além de ser um pré-requisito para a instalação do Flutter. Após a instalação, crie um emulador Android tendo um número de API de no mínimo 30.
* O [SDK do Flutter](https://flutter.dev/) deve ser instalado logo depois. Após a instalação, utilize o comando `flutter doctor` no seu terminal para determinar se o Flutter foi instalado corretamente ou se ainda falta alguma dependência.
* A [API do projeto](https://github.com/IsabelaRezendeB/DjangoRestAPI-ReservApp) deve ser instalada e executada para o funcionamento correto do aplicativo. 

## Instalando o projeto

Abra a pasta que deseja instalar pelo terminal, e clone o repositório:
```
git clone -b relatorio2 https://github.com/GualterMM/C214-Lab-Relatorio3.git
```

Logo depois, instale as dependências utilizando o seguinte comando:
```
flutter pub get
```

Para gerar os mocks necessários para o teste, utilize os seguinte comandos:
```
dart run build_runner build
```

Execute os testes usando ocomando:
```
flutter test
```

Para rodar a aplicação, certifique-se que o emulador Android está ligado e use o comando:
```
flutter run lib/main.dart
```

### Equipe de Desenvolvimento

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/GualterMM">
        <img src="https://avatars.githubusercontent.com/u/35864822?v=4" width="100px;" alt="Foto do Gualter Machado no GitHub"/><br>
        <sub>
          <b>Gualter Machado</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/IsabelaRezendeB">
        <img src="https://avatars.githubusercontent.com/u/49520751?v=4" width="100px;" alt="Foto da Isabela Rezende no GitHub"/><br>
        <sub>
          <b>Isabela Rezende</b>
        </sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/VictoriaRBrito">
        <img src="https://avatars.githubusercontent.com/u/82007104?v=4" width="100px;" alt="Foto da Victoria Brito no GitHub"/><br>
        <sub>
          <b>Victoria Brito</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
