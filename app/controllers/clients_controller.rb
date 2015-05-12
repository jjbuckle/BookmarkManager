class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    create_loginurl
    if @client.save
      redirect_to '/clients'
    else
      render 'new'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.present?
      @client.destroy
    end
    redirect_to root_url
  end

  def show
    redirect_to 'clients'
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    create_loginurl
    if @client.update_attributes(client_params)
      redirect_to '/clients'
    else
    	render 'edit'
    end
  end

private

  def client_params
    params.require(:client).permit(:username,:password,:url,:name,:loginurl)
  end

  def create_loginurl
    @client.loginurl = client_params[:url] + 'frontrt.aspx?Page=tauto&action=login&userid=' + client_params[:username] + '&password=' + client_params[:password]
  end
end
