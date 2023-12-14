enum ShipType { patrol, rescue, submarine, battleship, carrier }

class Ship {
  final ShipType type;
  final int size;
  final String imagePath;

  Ship({required this.type, required this.size, required this.imagePath});
}
