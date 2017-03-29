syntax keyword typescriptBOMNavigatorProp contained battery buildID cookieEnabled
syntax keyword typescriptBOMNavigatorProp contained doNotTrack maxTouchPoints oscpu
syntax keyword typescriptBOMNavigatorProp contained productSub push serviceWorker
syntax keyword typescriptBOMNavigatorProp contained vendor vendorSub
syntax cluster props add=typescriptBOMNavigatorProp
if exists("did_typescript_hilink") | HiLink typescriptBOMNavigatorProp Keyword
endif
syntax keyword typescriptBOMNavigatorMethod contained addIdleObserver getDeviceStorage nextgroup=typescriptFuncCallArg
syntax keyword typescriptBOMNavigatorMethod contained getDeviceStorages getGamepads nextgroup=typescriptFuncCallArg
syntax keyword typescriptBOMNavigatorMethod contained getUserMedia registerContentHandler nextgroup=typescriptFuncCallArg
syntax keyword typescriptBOMNavigatorMethod contained removeIdleObserver requestWakeLock nextgroup=typescriptFuncCallArg
syntax keyword typescriptBOMNavigatorMethod contained vibrate watch registerProtocolHandler nextgroup=typescriptFuncCallArg
syntax keyword typescriptBOMNavigatorMethod contained sendBeacon nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptBOMNavigatorMethod
if exists("did_typescript_hilink") | HiLink typescriptBOMNavigatorMethod Keyword
endif
syntax keyword typescriptServiceWorkerMethod contained register nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptServiceWorkerMethod
if exists("did_typescript_hilink") | HiLink typescriptServiceWorkerMethod Keyword
endif
