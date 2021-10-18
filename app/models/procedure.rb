class Procedure < ApplicationRecord
    mount_uploader :procedure_image, ProcedureUploader
    belongs_to :post
end
