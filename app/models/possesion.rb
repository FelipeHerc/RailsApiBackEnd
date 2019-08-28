class Possesion < ApplicationRecord
  belongs_to :owner
  belongs_to :equip

  def owner_data
  {
    "owner_id": self.owner.id,
    "owner_name": self.owner.name,
    "owner_cpf": self.owner.cpf,
    "sector":
    {
      "owner_sector_id": self.owner.sector.id,
      "owner_sector_name": self.owner.sector.name
    },
    "company":
    {
      "owner_company_id": self.owner.company.id,
      "owner_company_name": self.owner.company.name
    }
  }
  end

  def equip_data
    if self.equip.notebook
      {
        "notebook_data":
        {
          "equip_notebook_id": self.equip.notebook.id,
          "equip_notebook_stat_id": self.equip.notebook.stat_id,
          "equip_notebook_stat_description": self.equip.notebook.stat.description,
          "equip_notebook_brand": self.equip.notebook.brand,
          "equip_notebook_model": self.equip.notebook.model,
          "equip_notebook_serialNumber": self.equip.notebook.serialNumber
        }
      }
    elsif self.equip.chip_id
      {
        "chip_data": 
        {
          "equip_chip_id": self.equip.chip.id,
          "equip_chip_stat_id": self.equip.chip.stat_id,
          "equip_chip_stat_description": self.equip.chip.stat.description,
          "equip_chip_operator": self.equip.chip.operator,
          "equip_chip_ddd": self.equip.chip.ddd,
          "equip_chip_phoneNumber": self.equip.chip.phoneNumber,
          "equip_chip_value": self.equip.chip.value
        }
      }
    
    elsif self.equip.cel_id
      {
        "cel_data":
        {
          "equip_cel_id": self.equip.cel.id,
          "equip_cel_stat_id": self.equip.cel.stat_id,
          "equip_cel_stat_description": self.equip.cel.stat.description,
          "equip_cel_brand": self.equip.cel.brand,
          "equip_cel_model": self.equip.cel.model,
          "equip_cel_imei1": self.equip.cel.imei1,
          "equip_cel_imei2": self.equip.cel.imei2
        }
      } 
    end
  end

  def as_json(options={})
    super(
      methods: [:owner_data, :equip_data],
      except: [:created_at, :updated_at, :owner_id]
    )
  end
end
