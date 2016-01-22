%w(yum_update ruby_build postgresql).each do |resource|
  include_recipe "./#{resource}.rb"
end
