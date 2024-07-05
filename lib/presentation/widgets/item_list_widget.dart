import 'package:flutter/material.dart';

class ItemListWidget extends StatelessWidget {
  final int id;
  final String title;
  final String url;

  const ItemListWidget({
    super.key,
    required this.id,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD5E8C0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '[$id] $title',
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.lime[100],
                  child: const Icon(Icons.share),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: Text(
                          "Cargando la imagen...",
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        "Error, no se pudo cargar la imagen 🫤.",
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
