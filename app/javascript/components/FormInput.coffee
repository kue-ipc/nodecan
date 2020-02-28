import { h } from 'hyperapp'



Input = ({id, name, type, value}) =>
  <input id={id} class="form-control" type={type} name={name} />

export FormInput = ({prefix, name, value, model}) =>
  inputName = "#{model?.name}[#{name}]"
  inputId = "#{prefix}#{model?.name}_#{name}"
  attrLabel = model?.attrs?[name]?.human
  attrType = model?.attrs?[name]?.type

  <div class="form-group row">
    <label class="col-sm-2 col-form-label" for={inputId}>
      {attrLabel}
    </label>
    <div class="col-sm-10">
      {
        switch attrType
          when 'string'
            <Input type="text" name={inputName} id={inputId} />
          when 'integer'
            <Input type="number" name={inputName} id={inputId} />
          when 'text'
            <textarea id={inputId} class="form-control" name={inputName}></textarea>
          else
            <Input type="text" name={inputName} id={inputId} />
      }
    </div>
  </div>
