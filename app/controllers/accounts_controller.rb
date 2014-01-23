class AccountsController < ApplicationController
  
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :redirect_accountable_requests

  def index
    @accounts = Account.all
  end

  def show
  end

  def accountable_redirect
debugger
    controller = Account.find_by(subdomain: request.subdomain).accountable_type.downcase.pluralize
    redirect_to controller: controller

  end

  def not_found
    raise ActionController::RoutingError.new('Account Not Found')
  end
     
  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  def redirect_accountable_requests
    redirect_to controller: 'vineyards', action: 'show'

  end
private
  def set_account
    @account = Account.where(:subdomain => request.subdomain).first || not_found
    # @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:accountable_id, :accountable_type, :subdomain)
  end

end
