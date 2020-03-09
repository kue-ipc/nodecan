import { h } from 'hyperapp'

Input = ({id, name, type, value, readonly, validation...}) =>
  <input id={id} class="form-control" type={type} name={name} value={value} readonly={readonly} {validation...} />

export FormInput = ({prefix, name, value, model, readonly}) =>
  inputName = "#{model?.name}[#{name}]"
  inputId = "#{prefix}#{model?.name}_#{name}"
  attrLabel = model?.attrs?[name]?.human
  attrType = model?.attrs?[name]?.type
  attrMapping = model?.attrs?[name]?.mapping
  selectOptions = []
  validation = model?.attrs?[name]?.validation

  if attrMapping
    selectOptions.push [<option selected={!value?} label="選択してください。"></option>]
    Object.entries(attrMapping).map ([key, info]) =>
      selectOptions.push <option value={key} selected={value == key}>{info.human}</option>

  <div class="form-group row">
    <label class="col-sm-2 col-form-label" for={inputId}>
      {attrLabel}
    </label>
    <div class="col-sm-10">
      {
        switch attrType
          when 'string'
            <Input type="text" name={inputName} id={inputId} value={value} readonly={readonly} {validation...} />
          when 'integer'
            <Input type="number" name={inputName} id={inputId} value={value} readonly={readonly} {validation...} />
          when 'text'
            <textarea id={inputId} class="form-control" name={inputName} readonly={readonly}>{value}</textarea>
          when 'enum'
            <select id={inputId} class="custom-select" name={inputName} readonly={readonly} {validation...}>
              {selectOptions}
            </select>
          else
            <span>不明なタイプ</span>
      }
    </div>
  </div>
