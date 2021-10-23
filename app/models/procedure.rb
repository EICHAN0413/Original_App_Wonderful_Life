class Procedure < ApplicationRecord
    mount_uploader :procedure_image, ProcedureUploader
    belongs_to :post

    validates :procedure, length: { maximum: 50 }, presence: true
end
