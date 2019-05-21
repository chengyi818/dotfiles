# Query Jupyter server for the value of a variable
import json as _VSCODE_json
_VSCODE_max_len = 200
# In IJupyterVariables.getValue this '_VSCode_JupyterTestValue' will be replaced with the json stringified value of the target variable
# Indexes off of _VSCODE_targetVariable need to index types that are part of IJupyterVariable
_VSCODE_targetVariable = _VSCODE_json.loads('_VSCode_JupyterTestValue')

_VSCODE_evalResult = eval(_VSCODE_targetVariable['name'])

# Find shape and count if available
if (hasattr(_VSCODE_evalResult, 'shape')):
    try:
        _VSCODE_targetVariable['shape'] = str(_VSCODE_evalResult.shape)
    except TypeError:
        pass

if (hasattr(_VSCODE_evalResult, '__len__')):
    try:
        _VSCODE_targetVariable['count'] = len(_VSCODE_evalResult)
    except TypeError:
        pass

# Get the string of the eval result, truncate it as it could be far too long
_VSCODE_targetValue = str(_VSCODE_evalResult)
if len(_VSCODE_targetValue) > _VSCODE_max_len:
    _VSCODE_targetVariable['truncated'] = True
    _VSCODE_targetVariable['value'] = _VSCODE_targetValue[:_VSCODE_max_len]
else:
    _VSCODE_targetVariable['value'] = _VSCODE_targetValue

print(_VSCODE_json.dumps(_VSCODE_targetVariable))

# Cleanup
del _VSCODE_max_len
del _VSCODE_json
del _VSCODE_targetVariable
del _VSCODE_evalResult
del _VSCODE_targetValue