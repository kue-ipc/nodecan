import { h } from 'hyperapp'

Input = ({id, name, type, value, readonly}) =>
  <input id={id} class="form-control" type={type} name={name} value={value} readonly={readonly}/>

export FormInput = ({prefix, name, value, model, readonly}) =>
  inputName = "#{model?.name}[#{name}]"
  inputId = "#{prefix}#{model?.name}_#{name}"
  attrLabel = model?.attrs?[name]?.human
  attrType = model?.attrs?[name]?.type
  attrMapping = model?.attrs?[name]?.mapping
  options = []

  if attrMapping
    options.push [<option selected={!vale?}>選択してください。</option>]
    Object.entries(attrMapping).map ([key, info]) =>
      options.push <option value={info.value} selected={value == key}>{info.human}</option>

  <div class="form-group row">
    <label class="col-sm-2 col-form-label" for={inputId}>
      {attrLabel}
    </label>
    <div class="col-sm-10">
      {
        switch attrType
          when 'string'
            <Input type="text" name={inputName} id={inputId} value={value} readonly={readonly} />
          when 'integer'
            <Input type="number" name={inputName} id={inputId} value={value} readonly={readonly} />
          when 'text'
            <textarea id={inputId} class="form-control" name={inputName} readonly={readonly}>{value}</textarea>
          when 'enum'
            <select id={inputId} class="custom-select" name={inputName} readonly={readonly}>
              {options}
            </select>
          else
            <span>不明なタイプ</span>
      }
    </div>
  </div>
