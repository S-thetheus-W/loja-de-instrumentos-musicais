import 'package:flutter/material.dart';
import '../../models/instrumento.dart';

class CartaoInstrumento extends StatefulWidget {
  final Instrumento instrumento;
  final VoidCallback onTap; 

  const CartaoInstrumento({
    super.key,
    required this.instrumento,
    required this.onTap,
  });

  @override
State<CartaoInstrumento> createState() => _CartaoInstrumentoState();
}

class _CartaoInstrumentoState extends State<CartaoInstrumento> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
  cursor: SystemMouseCursors.click,
  onEnter: (_) {
    setState(() {
      _hover = true;
    });
  },
  onExit: (_) {
    setState(() {
      _hover = false;
    });
  },
  child: GestureDetector(
    onTap: widget.onTap,
      child: AnimatedContainer(
  margin: const EdgeInsets.all(4),
  duration: const Duration(milliseconds: 180),
transform: Matrix4.translationValues(
  0,
  _hover ? -4 : 0,
  0,
),
  
  decoration: BoxDecoration(
  color: _hover
      ? const Color(0xFF1B2940)
      : const Color(0xFF172033),
  borderRadius: BorderRadius.circular(14),
  border: Border.all(
    color: _hover
        ? const Color(0xFF607A96)
        : const Color(0xFF414751),
    width: 1,
  ),
  boxShadow: _hover
      ? const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ]
      : [],
),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF101A2A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          child: ClipRRect(
         borderRadius: const BorderRadius.only(
         topLeft: Radius.circular(14),
         topRight: Radius.circular(14),
      ),
      child: Image.asset(
       widget.instrumento.imagemUrl,
       width: double.infinity,
       height: double.infinity,
       fit: BoxFit.cover,
  ),
),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.instrumento.nome,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDAE2FD),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.instrumento.marca.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFC1C7D3),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'R\$ ${widget.instrumento.preco.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFFA4C9FF),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
  ),
    );
  }
}