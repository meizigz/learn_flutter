void main() {
  // Set<String>。集合，大括号，只有value没有key
  var halogens = {'fluorine', 'chlorine'};
  // Map<String,String>。映射，大括号，key和value一一对应，key的类型不限制。
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  halogens.add('chlorine2'); // 集合添加元素。不会有重复元素
  gifts['third'] = 'rose'; // 映射设置key的值，如果key尚未存在则新增
  var g = gifts['fourth']; // 取值。推断为String?，如果对应的值不存在则返回null

  // 遍历Map
  gifts.entries.forEach((element) {
    print(element.key);
    print(element.value);
  });

  gifts.remove('fifth'); // 删除元素。返回删除的元素
  gifts.clear(); // 清空

  var names = <String>{}; // 空Set。Set<String>，集合，元素无关系
  var infos = <String, String>{}; // 空Map。Map<String,String>，映射，k和v

  var names2 = <String>{'Bob', ...halogens}; // ...展开。类似数组也可以用if和for初始化
}
