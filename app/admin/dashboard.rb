ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: "Home"

    content title: "Home" do
        section "Usuários Cadastrados" do
            table_for User.order("created_at desc").limit(10) do
                column "Username", :username
                column "Email", :email
                column "Criado em:", :created_at
                column "Supervisor?", :supervisor
                column "Cadastro Aprovado?", :approved
            end
        strong { link_to "Ver Todos os Usuários", admin_users_path }
        end   
    end
end
