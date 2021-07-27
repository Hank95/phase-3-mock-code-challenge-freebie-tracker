class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.where(item_name: item_name).exists?
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            freebie.dev = dev 
        else
            "Not your swag to give!"
        end
    end


end
