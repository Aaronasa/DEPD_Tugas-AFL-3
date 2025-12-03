part of 'widgets.dart';

class CardInternationalCost extends StatefulWidget {
  final Intercost cost; // Menggunakan model Intercost
  const CardInternationalCost(this.cost, {super.key});

  @override
  State<CardInternationalCost> createState() => _CardInternationalCostState();
}

class _CardInternationalCostState extends State<CardInternationalCost> {
  // Memformat angka menjadi mata uang Rupiah
  String rupiahMoneyFormatter(dynamic value) {
    if (value == null) return "Rp0,00";
    // Jaga-jaga jika value dari API berupa String, convert dulu
    double numericValue = 0;
    if (value is int) {
      numericValue = value.toDouble();
    } else if (value is double) {
      numericValue = value;
    } else if (value is String) {
      numericValue = double.tryParse(value) ?? 0;
    }

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );
    return formatter.format(numericValue);
  }

  String formatEtd(String? etd) {
    if (etd == null || etd.isEmpty) return '-';
    return etd.replaceAll('day', 'hari').replaceAll('days', 'hari');
  }

  @override
  Widget build(BuildContext context) {
    Intercost cost = widget.cost;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue[800]!),
      ),
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: 8,
        horizontal: 0, // Dibuat 0 agar mengikuti padding parent layout
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () => _showDetailPopup(context, cost),
        // Title: Menggunakan Service karena biasanya Intercost tidak menyimpan nama Kurir di dalamnya
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
          child: Icon(
            Icons.flight_takeoff,
            color: Colors.blue[800],
          ), // Ikon pesawat
        ),
      ),
    );
  }

  void _showDetailPopup(BuildContext context, Intercost cost) {
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
              // Header Popup
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue[50],
                        child: Icon(
                          Icons.flight_takeoff,
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

              _detailRow("Layanan", cost.service),
              _detailRow("Deskripsi", cost.description),
              _detailRow(
                "Mata Uang",
                cost.currency,
              ),
              _detailRow("Biaya", rupiahMoneyFormatter(cost.cost)),
              _detailRow("Estimasi", formatEtd(cost.etd)),
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
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value ?? "-",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
