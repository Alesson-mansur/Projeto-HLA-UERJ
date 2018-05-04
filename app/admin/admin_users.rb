ActiveAdmin.register AdminUser do
  permit_params :username, :email, :password, :password_confirmation

  menu priority: 2, label: "Administradores"

  controller do
    #Para mostrar os títulos das páginas corretamente
    def show
      @page_title = "#{resource.username}".titleize
    end 
  end

   index :title => 'Administradores Cadastrados' do
    selectable_column
    column "Username:", :username
    column "Email:", :email
    column "Login realizado em:", :current_sign_in_at
    column "Número de vezes logado:", :sign_in_count
    column "Criado em:", :created_at
    actions
  end

  filter :username
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
