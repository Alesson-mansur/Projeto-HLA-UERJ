ActiveAdmin.register User do

	permit_params :username, :email, :approved, :supervisor

	menu priority: 3, label: "Usuários"

	index :title => 'Usuários Cadastrados' do
    	column "Usuário:", :username
    	column "Email:", :email
    	column "Cadastrado em:", :created_at
    	column "Autorizado em:", :updated_at
      column "Supervisor?:", :supervisor
    	column "Cadastro Aprovado?", :approved
    	actions
  	end

  	controller do
  		
  		#Para mostrar os títulos das páginas corretamente
    	def edit
    		@page_title = "Edição de Cadastro"
    	end

    	def show
      	@page_title = "#{resource.username}".titleize
    	end
  	end

end
