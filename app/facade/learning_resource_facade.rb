class LearningResourceFacade
  
  def self.learning_resource(q)
    @video = VideoService.search(q)[:items][0]
    @images = ImageService.search(q)[:results]
    LearningResource.new(@video, @images, q)
  end
end