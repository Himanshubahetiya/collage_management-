class AccountController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy,]

    

  def index
    
    accounts = Account.all
    render json: accounts
  end

  def show
    
    account = Account.find(params[:id])  
    render json: account
  end

  
  def create
    
    account = Account.new(account_params)

    if account.save
      
      render json: account, status: :created
    else
      
      render json: { errors: account.errors.full_messages }, status: :unprocessable_entity
    end
  end
  


  def update
    account = Account.find(params[:id])

    if account.update(account_params)
      render json: account, status: :ok
    else
      render json: { errors: account.errors.full_messages }, status: :unprocessable_entity
    end
  end


 
 def destroy
    account = Account.find(params[:id])

    if account.destroy
      render json: { message: 'Account deleted successfully' }, status: :ok
    else
      render json: { errors: account.errors.full_messages }, status: :unprocessable_entity
    end
  end
 



  private
  
  def account_params    
    params.require(:account).permit(:name, :email, :role_id, :password)
  end
end
