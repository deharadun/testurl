class WurlsController < ApplicationController
  before_action :set_wurl, only: [:show, :edit, :update, :destroy]

  # GET /wurls
  # GET /wurls.json
  def index
    @wurls = Wurl.all
p params
 @wurlurl = params[:turl]
  end

  # GET /wurls/1
  # GET /wurls/1.json
  def show
  end

  # GET /wurls/new
  def new
    @wurl = Wurl.new
  end

  # GET /wurls/1/edit
  def edit
  end

  # POST /wurls
  # POST /wurls.json
  def create
    @wurl = Wurl.new(wurl_params)

    respond_to do |format|
      ##########this code should be in config folder
        authorize = UrlShortener::Authorize.new 'kedar123', 'R_d8dd7e1ce9be4cc6b64644f15332d9a7'
  ##########this code should be in lib     
        client = UrlShortener::Client.new authorize
        shorten = client.shorten('http://www.yahoo.com') # => UrlShortener::Response::Shorten object
        shorten.result # => returns a hash of all data returned from bitly
   ####################33333
      @wurlurl = shorten.urls# => Only returns the short urls
      
      if true#@wurl.save
        format.html { redirect_to @wurl, notice: 'Wurl was successfully created.' }
        format.json { render :show, status: :created, location: @wurl }
      else
        format.html { render :new }
        format.json { render json: @wurl.errors, status: :unprocessable_entity }
      end
    end
  end


  def short_url
p "55555555555"
p params
@wurl = Wurl.new(params[:surl][:long_url5])
@wurl = Wurl.new(:ourl=>params[:surl][:long_url])
    respond_to do |format|
      ##########this code should be in config folder
        authorize = UrlShortener::Authorize.new 'kedar123', 'R_d8dd7e1ce9be4cc6b64644f15332d9a7'
  ##########this code should be in lib     
        client = UrlShortener::Client.new authorize
        shorten = client.shorten(params[:surl][:long_url]) # => UrlShortener::Response::Shorten object
        shorten.result # => returns a hash of all data returned from bitly
   ####################33333
      @wurlurl = shorten.urls# => Only returns the short urls
      p @wurlurl
     @wurl.turl=@wurlurl 
     if @wurl.save
        format.html { redirect_to :action=>'index' ,:turl=>@wurlurl, notice: 'Wurl was successfully created.' }
        format.json { render :show, status: :created, location: @wurl }
      else
        format.html { render :new }
        format.json { render json: @wurl.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /wurls/1
  # PATCH/PUT /wurls/1.json
  def update
    respond_to do |format|
      if @wurl.update(wurl_params)
        format.html { redirect_to @wurl, notice: 'Wurl was successfully updated.' }
        format.json { render :show, status: :ok, location: @wurl }
      else
        format.html { render :edit }
        format.json { render json: @wurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wurls/1
  # DELETE /wurls/1.json
  def destroy
    @wurl.destroy
    respond_to do |format|
      format.html { redirect_to wurls_url, notice: 'Wurl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wurl
      @wurl = Wurl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wurl_params
      params.require(:wurl).permit(:ourl, :turl)
    end
end
