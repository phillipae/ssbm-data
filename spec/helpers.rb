def run_seeding
  seed_data
end

private

def seed_data
  %w[
    character
  ].each do |model_name|
    FactoryBot.create_list(model_name.to_sym, 2)
  end
end