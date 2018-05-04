ActiveAdmin.register Exam do

	permit_params :kind, :created_at, :updated_at

	menu label: "Exames"

	index :title => 'Cadastro de Exames' do
	    column "Tipo de Exame:", :kind
	    column "Criado em:", :created_at
	    column "Última atualização em:", :updated_at

	    actions
	end

	controller do
		#Para mostrar os títulos das páginas corretamente
    	def edit
    		@page_title = "Edição de Tipo de Exame"
    	end

    	def show
      		@page_title = "Exame #{resource.kind}"
    	end
  	end

end
