class Catalog {
  int hex;
  String name;
  Catalog(this.hex, this.name);
}

final catalogs = List<Catalog>.generate(
  20,
  (index) {
    return Catalog(0xfffff22f + index * 0xffaa1234, "Catalog $index");
  },
);
