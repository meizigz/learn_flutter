// 普通枚举，定义在顶层
enum MyColor { red, green, blue }

// 增强枚举，定义在顶层。可以视作一个类，有构造函数。
enum Vehicle {
  // 枚举值仍然在枚举内。以','分开
  car(4), // 枚举值的类型都是Vehicle
  bike(2);

  // 字段必须是final的，因为生成后值不能再变
  final int tires;

  // 构造函数必须是const的，因为枚举值不能变。字段构造时就要初始化
  const Vehicle(this.tires);
}

void main() {
  // 通过values获取所有枚举值数组
  print(MyColor.values); // [MyColor.red, MyColor.green, MyColor.blue]

  var favoriteColor = MyColor.blue; // 使用枚举值
  print(favoriteColor); // MyColor.blue 保存的枚举值
  print(favoriteColor.index); // 2。枚举值的索引
  print(MyColor.red.name); // 'red'。枚举值的名称

  var favoriteVechicle = Vehicle.car; // 使用枚举值
  print(Vehicle.car.index); // 0。获取枚举的索引值
  print(favoriteVechicle.name); // 'car'。获取枚举的名称
  print(favoriteVechicle.tires); // 4。可以访问增强枚举值的属性
}
