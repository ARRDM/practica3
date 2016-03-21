class MUsersController < ApplicationController
  respond_to :html, :json, :js
  before_action :set_m_user, only: [:show, :edit, :update, :destroy]
  before_action :es_el_usuario, only: [:edit, :update, :destroy]

  def index
    @m_users = MUser.all
  end

  def show
    @m_user = MUser.find(params[:id])
    @posts = @m_user.posts
  end 

  def new
    @m_user = MUser.new
  end

  def edit
    @m_user = MUser.find(params[:id])
  end

  def create
    @m_user = MUser.new(m_user_params)

    respond_to do |format|
      if @m_user.save
        format.html { redirect_to login_url, notice: 'Bienvenido.' }
        format.json { render :show, status: :created, location: @m_user }
      else
        format.html { render :new }
        format.json { rende json: @m_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @m_user.update(m_user_params)
        format.html { redirect_to @m_user, notice: 'M user was successfully updated.' }
        format.json { render :show, status: :ok, location: @m_user }
      else
        format.html { render :edit }
        format.json { rende json: @m_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @m_user.destroy
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'M user was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  def set_m_user
    @m_user = MUser.find(params[:id])
  end

  def m_user_params
    params.require(:m_user).permit(:m_user_name, :m_user_surname, :blood_type_user, :email, :password, :password_digest)
  end

  def es_el_usuario
    if (@m_user != m_user_actual)
      redirect_to m_user_actual
    end
  end
    
end
