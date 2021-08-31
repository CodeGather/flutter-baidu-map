package com.baidu.flutter.trace.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class DataConvertUtil {

    public static Object mapToObject(Map<String, Object> map, Class<?> clazz) {
        if (map == null) {
            return null;
        }

        Object obj = null;
        clazz.getComponentType();
        try {
            obj = clazz.newInstance();
            Class<?> objClass = obj.getClass();
            List<Field> fields = getAllFields(objClass);
            for (Field field : fields) {
                int mod = field.getModifiers();
                if (Modifier.isStatic(mod) || Modifier.isFinal(mod)) {
                    continue;
                }
                field.setAccessible(true);
                Object value = map.get(field.getName());
                if (value == null) {
                    continue;
                }
                if (value instanceof Map) {
                    Type genericType = field.getGenericType();
                    if (field.getType() == Map.class || field.getType() == HashMap.class) {
                        field.set(obj, value);
                    } else {
                        field.set(obj, mapToObject((Map<String, Object>) value, field.getType()));
                    }
                } else if (value instanceof List) {
                    Type genericType = field.getGenericType();
                    if (genericType instanceof ParameterizedType) {
                        ParameterizedType parameterizedType = (ParameterizedType) genericType;

                        Class<?> genericClazz =
                                (Class<?>) parameterizedType.getActualTypeArguments()[0];
                        if (genericClazz == Integer.class || genericClazz == Long.class
                                || genericClazz == Double.class || genericClazz == String.class
                                || genericClazz == Boolean.class) {
                            field.set(obj, value);
                            continue;
                        }
                        List list = (List) value;
                        List<Object> objectList = new ArrayList<>();
                        for (int i = 0; i < list.size(); i++) {
                            objectList.add(mapToObject((Map<String, Object>) list.get(i),
                                    genericClazz));
                        }
                        field.set(obj, objectList);
                    }
                } else {
                    field.set(obj, value);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return obj;
    }

    private static List<Field> getAllFields(Class<?> objClass) {
        List<Field> fields = new ArrayList<>();
        while (objClass != null) {
            fields.addAll(Arrays.asList(objClass.getDeclaredFields()));
            objClass = objClass.getSuperclass();
        }
        return fields;
    }

    public static Map<String, Object> objectToMap(Object obj) {
        if (obj == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();
        Class<?> objClass = obj.getClass();
        List<Field> fields = getAllFields(objClass);
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                Object value = field.get(obj);
                if (value instanceof List) {
                    List list = (List) value;
                    List<Map<String, Object>> mapList = getListObjectMap(list);
                    map.put(field.getName(), mapList);
                } else if (value instanceof Boolean || value instanceof Integer
                        || value instanceof Long || value instanceof Double
                        || value instanceof String || value instanceof Map) {
                    map.put(field.getName(), value);
                } else if (!isJavaObject(field)) {
                    map.put(field.getName(), objectToMap(value));
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        return map;
    }
    
    private static List<Map<String, Object>> getListObjectMap(List list) {
        List<Map<String, Object>> mapList = new ArrayList<>();
        Object object;
        for (int i = 0; i < list.size(); i++) {
            object = list.get(i);
            mapList.add(listItemToMap(object));
        }
        return mapList;
    }

    public static Map<String, Object> listItemToMap(Object obj) {
        if (obj == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();

        Class<?> objClass = obj.getClass();
        List<Field> fields = getAllFields(objClass);
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                Object value = field.get(obj);
                if (value instanceof Boolean || value instanceof Integer
                        || value instanceof Long || value instanceof Double
                        || value instanceof String || value instanceof Map) {
                    map.put(field.getName(), value);
                } else if (!isJavaObject(field)) {
                    map.put(field.getName(), oneObjectToMap(value));
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        return map;
    }

    public static Map<String, Object> oneObjectToMap(Object obj) {
        if (obj == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();

        Class<?> objClass = obj.getClass();
        List<Field> fields = getAllFields(objClass);
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                Object value = field.get(obj);
                if (value instanceof List) {
                    List list = (List) value;
                    List<Map<String, Object>> mapList = new ArrayList<>();
                    Object object;
                    for (int i = 0; i < list.size(); i++) {
                        object = list.get(i);
                        mapList.add(oneObjectItemToMap(object));
                    }
                    map.put(field.getName(), mapList);
                } else if (value instanceof Boolean || value instanceof Integer
                        || value instanceof Long || value instanceof Double
                        || value instanceof String || value instanceof Map) {
                    map.put(field.getName(), value);
                } else if (!isJavaObject(field)) {
                    map.put(field.getName(), oneObjectToMap(value));
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        return map;
    }

    public static Map<String, Object> oneObjectItemToMap(Object obj) {
        if (obj == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();

        Class<?> objClass = obj.getClass();
        List<Field> fields = getAllFields(objClass);
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                Object value = field.get(obj);
                if (value instanceof Boolean || value instanceof Integer
                        || value instanceof Long || value instanceof Double
                        || value instanceof String || value instanceof Map) {
                    map.put(field.getName(), value);
                } else if (!isJavaObject(field)) {
                    map.put(field.getName(), oneObjectItemToMap(value));
                }
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        return map;
    }
    
    private static boolean isJavaObject(Field field) {
        String fieldName = field.getDeclaringClass().getName();
        if (fieldName.startsWith("java.")) {
            return true;
        }
        return false;
    }

    public static int toInt(Object o) {
        return ((Number) o).intValue();
    }

    public static double toDouble(Object o) {
        return ((Number) o).doubleValue();
    }

    public static List<?> toList(Object o) {
        return (List<?>) o;
    }

    public static Map<?, ?> toMap(Object o) {
        return (Map<?, ?>) o;
    }
}
