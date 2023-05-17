class ClothSizeVO {
  String? size;
  bool? isSelected;

  ClothSizeVO({this.size, this.isSelected});
}

List<ClothSizeVO> clothSizeList = [
  ClothSizeVO(
    size: "S",
    isSelected: false,
  ),
  ClothSizeVO(
    size: "M",
    isSelected: false,
  ),
  ClothSizeVO(
    size: "L",
    isSelected: false,
  ),
  ClothSizeVO(
    size: "XL",
    isSelected: false,
  ),
  ClothSizeVO(
    size: "XXL",
    isSelected: false,
  ),
];