require 'digest/md5'

class ServersController < ApplicationController
  protect_from_forgery :except => :beat

  # GET /
  # GET /servers
  # GET /servers.xml
  def index
    @servers = Server.beating

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @servers }
    end
  end

  # GET /servers.txt
  def plaintext
    @servers = Server.beating

    render :text => @servers.map{|s| "#{s.hostname}:#{s.port}" }.join("\n")
  end

  # GET /servers/1
  # GET /servers/1.xml
  def show
    @server = Server.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @server }
    end
  end

  # POST /beat/
  # POST /beat/key
  def beat
    if params[:key]
      @server = Server.find_by_key params[:key]
      @server.beat_counter += 1
    else
      @server = Server.new
      @server.key ||= Digest::MD5.hexdigest(rand.to_s)
      @server.beat_counter = 1
    end
    
    @server.hostname = params[:hostname] || request.remote_ip
    @server.port = (params[:port] || 28997).to_i
    @server.title = params[:title] || "New Server"
    @server.game_mode = nil
    
    if @server.save
      render :text => @server.key
    else
      render :text => 'Error saving record', :status => 500
    end
  end

  # GET /servers/new
  # GET /servers/new.xml
  def newX
    @server = Server.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @server }
    end
  end

  # GET /servers/1/edit
  def editX
    @server = Server.find(params[:id])
  end

  # POST /servers
  # POST /servers.xml
  def createX
    @server = Server.new(params[:server])

    respond_to do |format|
      if @server.save
        format.html { redirect_to(@server, :notice => 'Server was successfully created.') }
        format.xml  { render :xml => @server, :status => :created, :location => @server }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def updateX
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to(@server, :notice => 'Server was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroyX
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
    end
  end
end
