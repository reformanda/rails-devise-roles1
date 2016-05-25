class RedocumentsController < ApplicationController

  def download

    if ENV['DOCUMENT_PATH'].present?
      path = "#{ENV['DOCUMENT_PATH']}/#{params[:model]}/#{params[:folder]}/#{params[:id]}/#{params[:basename]}.#{params[:extension]}"
    else
      path = "documents/#{params[:model]}/#{params[:folder]}/#{params[:id]}/#{params[:basename]}.#{params[:extension]}"
    end

    send_file path, :x_sendfile=>true, :disposition => "inline"
  end


end
