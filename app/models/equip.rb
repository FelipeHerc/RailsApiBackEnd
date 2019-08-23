class Equip < ApplicationRecord
  belongs_to :notebook, optional: true
  belongs_to :chip, optional: true
  belongs_to :cel, optional: true
  
  def notebook_data
    if self.notebook
    { 
      "stat": self.notebook.stat.description,
      "stat_id": self.notebook.stat_id,
      "brand": self.notebook.brand, 
      "model": self.notebook.model,
      "serialNumber": self.notebook.serialNumber
    }
    end
  end

  def chip_data
    if self.chip
    { 
      "stat": self.chip.stat.description,
      "stat_id": self.chip.stat_id,
      "operator": self.chip.operator, 
      "ddd": self.chip.ddd,
      "phoneNumber": self.chip.phoneNumber,
      "value": self.chip.value
    }
    end
  end

  def cel_data
    if self.cel
    { 
      "stat": self.cel.stat.description,
      "stat_id": self.cel.stat_id,
      "brand": self.cel.brand, 
      "model": self.cel.model,
      "imei1": self.cel.imei1,
      "imei2": self.cel.imei2
    }
    end
  end

  def as_json(options={})
    super(
      methods: [:notebook_data, :chip_data, :cel_data],
      except: [:created_at, :updated_at]
    )
  end
end
