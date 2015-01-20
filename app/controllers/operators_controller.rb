#!/bin/env ruby
# encoding: utf-8
require "httparty"
class OperatorsController < ApplicationController

  def index
    url = File.join(AeroAPI::Operator.site.to_s, 'operators', 'name', params[:q])
    render json: HTTParty.get(url)
  end

  def show
    url = File.join(AeroAPI::Operator.site.to_s, 'operators',  params[:id])
    render json: HTTParty.get(url)
  end

  def providers
    url = File.join(AeroAPI::Operator.site.to_s, 'operators',  params[:id])
    providers = HTTParty.get(url).parsed_response["providers"].map{|p| {id_prestador: p["id_prestador"], nom_pre: p["nom_pre"]}}
    render json: providers
  end

  def show_provider
    url = File.join(AeroAPI::Operator.site.to_s, 'providers',  params[:id])
    render json: HTTParty.get(url)
  end

end