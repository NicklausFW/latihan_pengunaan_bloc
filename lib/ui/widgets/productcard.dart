part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  ProductCard({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        onTap: () {},
        title: Text(
          product.name,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(product.price),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(product.image, scale: 40),
          child: Text(
            product.name[0],
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
