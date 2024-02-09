json.extract! member, :id, :first_name, :last_name, :email, :points, :position, :date_joined, :degree, :food_allergies, :created_at, :updated_at
json.url member_url(member, format: :json)
