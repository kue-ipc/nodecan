json.status :sucess
json.set! :model do
  json.name Category.model_name.name
  json.human Category.model_name.human
  json.total Category.count
  json.set! :attrs do
    json.partial! 'categories/attributes'
  end
end
json.set! :page do
  json.current 1
  json.total 1
  json.limit 0
end
json.set! :items do
  json.array! @categories, partial: "categories/category", as: :category
end
json.set! :display do
  json.index %i[code name model]
  json.update %i[name model description]
  json.read %i[code name model description]
  json.create %i[code name model description]
end
access_policy = policy(Category)
json.set! :acl do
  json.create access_policy.create?
  json.read access_policy.show?
  json.update access_policy.update?   
  json.delete access_policy.destroy?
end
