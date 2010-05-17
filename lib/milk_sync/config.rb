require 'singleton'

module MilkSync
  class Config
    include LightMongo::Document
    include Singleton
    attr_accessor :name

    @@instance = self.find.first
    
    def self.[](param)
      c = @@instance
      return c.send("#{param}")
    end

    def self.[]=(param, value)
      c = @@instance
      unless c.respond_to? param
        c.class.class_eval { attr_accessor param.to_sym }
      end
      c.send("#{param}=", value)
      c.save
    end

    def self.instance
      @@instance ||= self.find.first      
    end
    
  end
end
