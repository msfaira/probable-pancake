import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epsi_shop/bo/cart.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({Key? key}) : super(key: key);

  @override
  _PaiementPageState createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final double subTotal = double.parse(cart.priceTotalInEuro().replaceAll('€', ''));
    final double taxRate = 0.20;
    final double taxAmount = subTotal * taxRate;
    final double total = subTotal + taxAmount;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Finalisation de la commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Boîte pour le récapitulatif de la commande
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).colorScheme.outline),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    ),
                    child: Text(
                      'Récapitulatif de la Commande',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue, // Couleur du titre
                      ),
                    ),
                  ),
                  Text('Sous-total: ${subTotal.toStringAsFixed(2)}€'),
                  Text('TVA (20%): ${taxAmount.toStringAsFixed(2)}€'),
                  Text('Total: ${total.toStringAsFixed(2)}€'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Boîte pour l'adresse avec une flèche vers la droite
            InkWell(
              onTap: () {
                // Action à effectuer lorsque la boîte est tapée (peut être vide si aucune action n'est nécessaire)
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline)),
                          ),
                          child: Text(
                            'Adresse de Livraison',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green, // Couleur du titre
                            ),
                          ),
                        ),
                        Text('Michel le Poney'),
                        Text('8 rue des ouvertures de portes'),
                        Text('93204 CORBEAUX'),
                      ],
                    ),
                    Icon(Icons.arrow_forward), // Ajoutez l'icône de la flèche vers la droite
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Boîte pour les méthodes de paiement
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).colorScheme.outline),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline)),
                    ),
                    child: Text(
                      'Méthode de Paiement',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red, // Couleur du titre
                      ),
                    ),
                  ),
                  PaymentMethodIcon(imagePath: 'picture/visa_icone.png', method: 'Visa'),
                  PaymentMethodIcon(imagePath: 'picture/mastercard.png', method: 'MasterCard'),
                  PaymentMethodIcon(imagePath: 'picture/applepay.jpeg', method: 'Apple Pay'),
                  // Ajoutez d'autres méthodes de paiement selon vos besoins
                ],
              ),
            ),
            // Spacer pour occuper l'espace restant
            Spacer(),
            // Bouton pour confirmer l'achat (ne fait rien pour l'instant)
            ElevatedButton(
              onPressed: () {},
              child: Text("Confirmer l'achat"),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget pour afficher l'icône de la méthode de paiement
class PaymentMethodIcon extends StatelessWidget {
  final String imagePath;
  final String method;

  PaymentMethodIcon({required this.imagePath, required this.method});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 10, // Ajustez la hauteur selon vos besoins
          width: 10, // Ajustez la largeur selon vos besoins
        ),
        SizedBox(width: 10),
        Text(method),
      ],
    );
  }
}
