class LearningResource
  attr_reader :id, :country, :video, :images
  def initialize(video, images, q)
    @id = nil
    @country = q
    @video = format_video(video)
    @images = format_images(images)
  end

  def format_images(images)
    if images.nil?
      {}
    else
      images.map do |image|
        { alt_tag: image[:alt_description], url: image[:urls][:small]}
      end
    end
  end

  def format_video(video)
    if video.nil? 
      {}
    else
      {title: video[:snippet][:title], youtube_video_id: video[:id][:videoId]}
    end
  end 
end