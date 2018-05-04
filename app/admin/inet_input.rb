class InetInput < Formtastic::Inputs::StringInput
#put this in app/admin/inet_input.rb so that edit/update of resources work with activeadmin
#Isso é necessário pra sobrescrever o comando do formtastic de entrada de strings, e ler,
#de fato, como uma string. Sem isso o Active Admin não consegue criar novos users.
end