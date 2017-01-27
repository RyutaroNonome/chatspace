# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  include CarrierWave::RMagick
  process :resize_to_limit => [500, 500]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end