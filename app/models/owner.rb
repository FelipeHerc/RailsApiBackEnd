class Owner < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :sector, optional: true

  def company_name
    self.company.name
  end

  def sector_name
    self.sector.name
  end

  def as_json(options={})
    super(
      methods: [:company_name, :sector_name],
      except: [:created_at, :updated_at, :sector_id, :company_id]
    )
  end
end