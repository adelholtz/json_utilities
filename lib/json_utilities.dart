class JSONUtils {
  JSONUtils();

  get(json, String path, String defaultValue) {
    List pathSplitter = path.split(".");
    var returnValue;

    json.forEach((key, value) {
      if (key == pathSplitter[0]) {
        if (pathSplitter.length == 1) {
          returnValue = value;
          return;
        }
        pathSplitter.remove(key);

        if (value == null) {
          returnValue = defaultValue;
          return;
        }
        try{
          try{
            value = value.toJson();
          }catch(error){
            // handle error
          }
          returnValue = get(value, pathSplitter.join("."), defaultValue);
        }catch(error){
          returnValue = defaultValue;
        }
        return;
      }
    });

    return returnValue != null ? returnValue : defaultValue;
  }
}