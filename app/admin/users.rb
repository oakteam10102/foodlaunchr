ActiveAdmin.register User do
  actions :index, :show

  index do
    column :id
    column :email
    column :referral_code
    column :ref_count
    column :created_at
    column :updated_at
  end
end
