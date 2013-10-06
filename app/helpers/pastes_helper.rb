module PastesHelper
  def print_txt_create_result
    unless @paste.errors.any?
      url =  paste_path @paste, :only_path => false
      if @fresh
        "#{url} (key: #{@paste.key})"
      else
        url
      end
    else
      'Failed'
    end
  end
end
