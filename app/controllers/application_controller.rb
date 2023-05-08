
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/companies' do
    companies = Company.all
    companies.to_json(include: :drinks)
  end

  post '/companies' do
    new_company = Company.create(
      name: params[:name],
      logo_url: params[:logo_url]
    )
    new_company.to_json(include: :drinks)
  end

  patch '/companies/:id' do
    company = Company.find(params[:id])

    updated_company = company.update(params.slice(:name, :logo_url))

    company.to_json(include: :drinks)
  end

  delete '/companies/:id' do
    company = Company.find(params[:id])
    company.destroy
  end

  post '/companies/:company_id/drinks' do
    company = Company.find(params[:company_id])
    new_drink = company.drinks.create(
      name: params[:name],
      image_url: params[:image_url],
      description: params[:description]
    )
    new_drink.to_json
  end

  delete '/companies/:company_id/drinks/:id' do
    company = Company.find(params[:company_id])
    drink = company.drinks.find(params[:id])
    drink.destroy
  end

end
