module Sequelize
  def build_query(key, value)
    case key
    when "base_hearts_recovered"
      query = "lower(text(#{key})) like ?", "#{value.to_f}"
    else
      query = "lower(text(#{key})) like ?", "%#{value.downcase}%"
    end
    query
  end
end
