class Paste < ActiveRecord::Base
  attr_accessor :is_private
  before_validation :paste_limit
  before_validation :convert_newlines
  before_validation :set_paste_hash
  before_validation :set_paste_key
  before_validation :set_paste_secret
  validates :paste, :paste_hash, :key, :ip, :presence => true
  validates :paste, :length => { :maximum => 1_000_000 }

  def to_param
    path
  end

  def self.safe_find(raw_id)
    id, secret = raw_id.split("-")
    return unless id.to_i.to_s == id
    begin
      self.where(secret: secret).find(id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def path
    [id, secret.presence].compact.join("-")
  end

  def set_paste_hash
    self.paste_hash = Digest::SHA512.hexdigest("#{paste}\n")
  end

  def set_paste_key
    self.key ||= SecureRandom.hex(4)
  end

  def set_paste_secret
    self.secret = SecureRandom.hex(4) if self.is_private?
  end

  def is_private?
    self.is_private == "1"
  end

  def convert_newlines
    self.paste = self.paste.to_s.gsub("\r\n", "\n").gsub("\r", "\n")
  end

  def paste_limit
    ip_post_recent_count = self.class.where(:ip => self.ip).where('created_at > ?', Time.now - 1.hour).count
    errors.add :base, :limit if ip_post_recent_count > 100
  end

  def self.fix_all
    self.all.each do |p|
      p.save
    end
  end
end
