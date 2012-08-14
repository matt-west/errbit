class Search

  attr_reader :terms, :show_resolved

  def initialize(params, options = {})
    @apps          = options[:apps] || []
    @terms         = params[:terms]
    @show_resolved = params[:resolved].present?
    build_search
  end

  def results
    @search.results
  end

  private

  def build_search
    @search = Tire.search('problems', :load => true) do |search|
      search.query do |query|
        query.boolean do |it|
          it.must { |have| have.terms :app_id, @apps }
          it.must { |have| have.string "#{self.terms}*" }
          it.must { |have| have.term :resolved, false } unless self.show_resolved
        end
      end
    end
  end

end
