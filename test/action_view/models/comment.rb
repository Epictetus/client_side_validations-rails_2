class Comment
  attr_reader :id
  attr_reader :post_id
  attr_reader :title
  def initialize(id = nil, post_id = nil); @id, @post_id = id, post_id end
  def save; @id = 1; @post_id = 1 end
  def new_record?; @id.nil? end
  def to_param; @id; end
  def name
    @id.nil? ? "new #{self.class.name.downcase}" : "#{self.class.name.downcase} ##{@id}"
  end

  attr_accessor :relevances
  def relevances_attributes=(attributes); end

  def client_side_validation_hash
    {
      :title => {
        :presence => {
          :message => "can't be blank"
        }
      }
    }
  end
end

