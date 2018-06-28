def run_seeding
  clear_data
  seed_data
end

private

def clear_data
  DatabaseCleaner.start
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

def seed_data
  seed_characters
end

def seed_characters
  FactoryBot.create_list(:character, 2)
end

# def clear_data
# end

# def seed_data
#   %w[
#     character
#   ].each do |model_name|
#     seed_current_model = "create_list(:#{model_name}, 2)"
#     FactoryBot.public_send(seed_current_model) if FactoryBot.respond_to?(seed_current_model)
#   end
# end

# define_method("seed_#{model_name}") do
#   factory_call = "Factory.create(:#{model_name})"
#   obj.public_send(factory_call) if obj.respond_to?(factory_call)
# end