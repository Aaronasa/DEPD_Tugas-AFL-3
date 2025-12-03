part of 'widgets.dart';

// Widget untuk menampilkan informasi biaya pengiriman dalam bentuk card
class CardCost extends StatefulWidget {
  final Cost cost;
  const CardCost(this.cost, {super.key});

  @override
  State<CardCost> createState() => _CardCostState();
}

class _CardCostState extends State<CardCost> {
  // Memformat angka menjadi mata uang Rupiah
  String rupiahMoneyFormatter(int? value) {
    if (value == null) return "Rp0,00";
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  // Memformat satuan "day" menjadi "hari" pada estimasi pengiriman
  String formatEtd(String? etd) {
    if (etd == null || etd.isEmpty) return '-';
    return etd.replaceAll('day', 'hari').replaceAll('days', 'hari');
  }

  @override
  Widget build(BuildContext context) {
    Cost cost = widget.cost;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue[800]!),
      ),
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () => _showDetailPopup(context, cost),
        title: Text(
          "${cost.name}: ${cost.service}",
          style: TextStyle(
            color: Colors.blue[800],
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Biaya: ${rupiahMoneyFormatter(cost.cost)}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Estimasi sampai: ${formatEtd(cost.etd)}",
              style: TextStyle(color: Colors.green[800]),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[50],
          child: Icon(Icons.local_shipping, color: Colors.blue[800]),
        ),
      ),
    );
  }

  void _showDetailPopup(BuildContext context, Cost cost) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue[50],
                        child: Icon(
                          Icons.local_shipping,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${cost.name}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue[800],
                            ),
                          ),
                          Text(
                            "${cost.service}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              _detailRow("Nama Kurir", cost.name),
              _detailRow("Kode", cost.code),
              _detailRow("Layanan", cost.service),
              _detailRow("Deskripsi", cost.description),
              _detailRow("Biaya", rupiahMoneyFormatter(cost.cost)),
              _detailRow("Estimasi Pengiriman", formatEtd(cost.etd)),
            ],
          ),
        );
      },
    );
  }

  // Helper row
  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 140, child: Text(label)),
          const Text(" : "),
          Expanded(child: Text(value ?? "-")),
        ],
      ),
    );
  }
}
