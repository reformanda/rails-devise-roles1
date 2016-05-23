class RedocumentsController < ApplicationController

  def download

    if ENV['documents'].present?
      path = "#{ENV['documents']}/#{params[:model]}/#{params[:folder]}/#{params[:id]}/#{params[:basename]}.#{params[:extension]}"
    else
      path = "documents/#{params[:model]}/#{params[:folder]}/#{params[:id]}/#{params[:basename]}.#{params[:extension]}"
    end

    send_file path, :x_sendfile=>true, :disposition => "inline"
  end


end
