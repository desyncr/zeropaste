class PastesController < ApplicationController
  caches_page :show

  # GET /1
  # GET /1.txt
  def show
    @paste = Paste.safe_find(params[:id])
    head :not_found and return unless @paste

    expires_in 1.year, :public => true
    respond_to do |format|
      format.html # show.html.erb
      format.txt # show.txt.erb
    end
  end

  # GET /
  def new
    @paste = Paste.new
    @paste.set_paste_key
    begin
      @paste.paste = Paste.find(params[:base]).paste
    rescue
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /
  # POST /pastes.json
  # POST /pastes.txt
  def create
    if params[:paste].is_a? Hash
      if params[:paste][:paste_gzip_base64]
        # 1. decode from base64
        # 2. create StringIO from decoded string
        # 3. unzip and read the stream
        params[:paste][:paste] = Zlib::GzipReader.new(StringIO.new(Base64.decode64(params[:paste].delete(:paste_gzip_base64)))).read
      elsif params[:paste][:paste_gzip]
        params[:paste][:paste] = Zlib::GzipReader.new(StringIO.new(params[:paste].delete(:paste_gzip))).read
      end
    end
    @paste = Paste.new(paste_params.merge(ip: request.remote_ip))

    begin
      respond_to do |format|
        if @paste.save
          @fresh = true
          format.html { redirect_to @paste, :notice => 'Paste was successfully created.' }
          format.json { render :json => @paste, :status => :created, :location => @paste }
        else
          format.html { render :action => "new" }
          format.json { render :json => @paste.errors, :status => :unprocessable_entity }
        end
        format.txt
      end
    rescue ActiveRecord::RecordNotUnique
      @paste = Paste.where(:ip => @paste.ip, :paste_hash => @paste.paste_hash).first
      respond_to do |format|
        format.html { redirect_to paste_path(@paste) }
        format.json { render :json => @paste }
        format.txt
      end
    end
  end

  def destroy
    @paste = Paste.safe_find(params[:id])
    if @paste.key == params[:paste][:key]
      @paste.destroy
      expire_page :controller => 'pastes', :action => 'show', :id => @paste.id
      flash[:notice] = "Paste ##{params[:id]} deleted"
      redirect_to root_path
    else
      flash[:error] = 'Incorrect deletion key'
      render :action => :show
    end
  end

  private
  def paste_params
    params.require(:paste).permit(:paste, :is_private, :key)
  end
end
