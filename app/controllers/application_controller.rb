
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # this endpoint will get all compines with an added array of its drinks
  get '/companies' do
    companies = Company.all
    companies.to_json(include: :drinks)
  end

  # this endpoint will post a company with an empty array of drinks
  post '/companies' do
    new_company = Company.create(
      name: params[:name],
      logo_url: params[:logo_url]
    )
    new_company.to_json(include: :drinks)
  end

  # this patch will update a company with a specific id
  patch '/companies/:id' do
    company = Company.find(params[:id])

    updated_company = company.update(params.slice(:name, :logo_url))

    company.to_json(include: :drinks)
  end

  # this delete will delete a company with a specific id but because we have dependent: :delete on the company model it will also delete any drinks with the company id
  delete '/companies/:id' do
    company = Company.find(params[:id])
    company.destroy
    company.to_json(include: :drinks)
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


  # this delete will delete a drink by id
  delete '/drinks/:id' do
    drink = Drink.find(params[:id])
    drink.destroy
  end

end
