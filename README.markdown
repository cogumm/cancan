## == Translate CanCan  ==

Arquivos modificados para tratuzir as permissões do CanCan, juntamente com o pt-BR da aplicação Rails.


# = Licença =

CanCan está sob licença MIT.


# = Instalação =

## Gemfile
    gem "cancan"

## Rode o bundle
    $ bundle install
    $ bundle update

## Copiando os arquivos

Vá em:
    /home/< USUARIO >/.rvm/gems/ruby-1.9.2/gems/

Procure por cancan e entre, agora faça o backup do diretório /lib/.
Vá no terminal e digite:
   git clone git@github.com:cogumm/cancan.git

Após ter feito isso, os seus arquivos da pasta /lib/ serão modificados pelos nossos.

Obs.: Verifique se existe apenas uma pasta/diretório /lib/ dentro de cancan/


## pt-BR

    cancan:
      default: "Você não está autorizado a ver esta página."
      read: "Você não tem permissão para ver {{model}}."
      new: "Você não tem permissão para criar {{model}}."
      edit: "Você não tem permissão para editar {{model}}."
      destroy: "Você não tem permissão para excluir {{model}}."


# = Special Thanks =

CanCan was inspired by [http://github.com/stffn/declarative_authorization/](declarative_authorization) and [http://github.com/makandra/aegis](aegis).

Also many thanks to the CanCan [http://github.com/ryanb/cancan/contributors](contributors).
See the [http://github.com/ryanb/cancan/blob/master/CHANGELOG.rdoc](CHANGELOG) for the full list.
