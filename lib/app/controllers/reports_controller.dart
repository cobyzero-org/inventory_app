import 'package:get/get.dart';
import 'package:inventory_app/domain/models/client_model.dart';
import 'package:inventory_app/domain/models/entry_model.dart';
import 'package:inventory_app/domain/models/exit_model.dart';
import 'package:inventory_app/domain/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportsController extends GetxController {
  final supabase = Supabase.instance.client;
  final products = <ProductModel>[].obs;
  final entries = <EntryModel>[].obs;
  final exits = <ExitModel>[].obs;
  final loading = false.obs;
  final mostProductsStock = <ProductModel>[].obs;
  final mostEntriesProducts = <ProductModel>[].obs;
  final mostExitsProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    loading.value = true;
    await fetchProducts();
    await fetchEntries();
    await fetchExits();
    loading.value = false;
  }

  Future<void> fetchProducts() async {
    try {
      final response = await supabase.from("products").select("*");
      for (var element in response) {
        products.add(ProductModel.fromJson(element));
      }
      fetchMostProductsStock();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> fetchEntries() async {
    try {
      entries.clear();
      final response = await supabase.from("entries").select("*");
      for (var element in response) {
        final product = await supabase
            .from("products")
            .select("*")
            .eq("id", element['product_id'])
            .single();
        final client = await supabase
            .from("clients")
            .select("*")
            .eq("id", element['client_id'])
            .single();
        entries.add(
          EntryModel.fromJson(
            element,
            ProductModel.fromJson(product),
            ClientModel.fromJson(client),
          ),
        );
      }
      fetchMostEntriesProducts();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> fetchExits() async {
    try {
      exits.clear();
      final response = await supabase.from("exits").select("*");
      for (var element in response) {
        final product = await supabase
            .from("products")
            .select("*")
            .eq("id", element['product_id'])
            .single();
        final client = await supabase
            .from("clients")
            .select("*")
            .eq("id", element['client_id'])
            .single();
        exits.add(
          ExitModel.fromJson(
            element,
            client: ClientModel.fromJson(client),
            product: ProductModel.fromJson(product),
          ),
        );
      }
      fetchMostExitsProducts();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void fetchMostProductsStock() {
    final mostProductsStock = products
        .where((product) => product.stock > 0)
        .toList();
    final listReduced = mostProductsStock.take(5).toList();
    listReduced.sort((a, b) => b.stock.compareTo(a.stock));
    this.mostProductsStock.value = listReduced;
  }

  void fetchMostEntriesProducts() {
    final entries = this.entries;
    entries.sort((a, b) => b.quantity.compareTo(a.quantity));
    final listReduced = entries.take(5).toList();
    mostEntriesProducts.value = listReduced
        .map((entry) => entry.product!)
        .toList();
  }

  void fetchMostExitsProducts() {
    final exits = this.exits;
    exits.sort((a, b) => b.quantity.compareTo(a.quantity));
    final listReduced = exits.take(5).toList();
    mostExitsProducts.value = listReduced.map((exit) => exit.product!).toList();
  }

  Future<void> generateStockPdf() async {
    final pdf = pw.Document();

    mostProductsStock.sort((a, b) => b.stock.compareTo(a.stock));

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(24),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.blue800,
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Text(
                  'Productos con Mayor Stock',
                  style: pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 20),

              // Subtitle
              pw.Text(
                'Listado ordenado por disponibilidad',
                style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
              ),

              pw.SizedBox(height: 12),

              // Table
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColors.grey300,
                  width: 0.8,
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(4),
                  1: const pw.FlexColumnWidth(2),
                  2: const pw.FlexColumnWidth(2),
                },
                children: [
                  // Header row
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.blue100,
                    ),
                    children: [
                      _tableHeader('Producto'),
                      _tableHeader('Stock'),
                      _tableHeader('Precio'),
                    ],
                  ),

                  // Data rows
                  ...List.generate(mostProductsStock.length, (index) {
                    final p = mostProductsStock[index];
                    return pw.TableRow(
                      decoration: pw.BoxDecoration(
                        color: index.isEven
                            ? PdfColors.grey100
                            : PdfColors.white,
                      ),
                      children: [
                        _tableCell(p.name),
                        _tableCell(
                          p.stock.toString(),
                          align: pw.TextAlign.center,
                        ),
                        _tableCell(
                          'S/ ${p.unitPrice.toStringAsFixed(2)}',
                          align: pw.TextAlign.right,
                        ),
                      ],
                    );
                  }),
                ],
              ),

              // Header
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.blue800,
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Text(
                  'Productos con Mayores Entradas',
                  style: pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 20),

              // Subtitle
              pw.Text(
                'Listado ordenado por cantidad',
                style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
              ),

              pw.SizedBox(height: 12),

              // Table
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColors.grey300,
                  width: 0.8,
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(4),
                  1: const pw.FlexColumnWidth(2),
                  2: const pw.FlexColumnWidth(2),
                },
                children: [
                  // Header row
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.blue100,
                    ),
                    children: [
                      _tableHeader('Producto'),
                      _tableHeader('Stock'),
                      _tableHeader('Precio'),
                    ],
                  ),

                  // Data rows
                  ...List.generate(mostEntriesProducts.length, (index) {
                    final p = mostEntriesProducts[index];
                    return pw.TableRow(
                      decoration: pw.BoxDecoration(
                        color: index.isEven
                            ? PdfColors.grey100
                            : PdfColors.white,
                      ),
                      children: [
                        _tableCell(p.name),
                        _tableCell(
                          p.stock.toString(),
                          align: pw.TextAlign.center,
                        ),
                        _tableCell(
                          'S/ ${p.unitPrice.toStringAsFixed(2)}',
                          align: pw.TextAlign.right,
                        ),
                      ],
                    );
                  }),
                ],
              ),
              // Header
              pw.Container(
                width: double.infinity,
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  color: PdfColors.blue800,
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Text(
                  'Productos con Mayores Salidas',
                  style: pw.TextStyle(
                    color: PdfColors.white,
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 20),

              // Subtitle
              pw.Text(
                'Listado ordenado por cantidad',
                style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
              ),

              pw.SizedBox(height: 12),

              // Table
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColors.grey300,
                  width: 0.8,
                ),
                columnWidths: {
                  0: const pw.FlexColumnWidth(4),
                  1: const pw.FlexColumnWidth(2),
                  2: const pw.FlexColumnWidth(2),
                },
                children: [
                  // Header row
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.blue100,
                    ),
                    children: [
                      _tableHeader('Producto'),
                      _tableHeader('Stock'),
                      _tableHeader('Precio'),
                    ],
                  ),

                  // Data rows
                  ...List.generate(mostExitsProducts.length, (index) {
                    final p = mostExitsProducts[index];
                    return pw.TableRow(
                      decoration: pw.BoxDecoration(
                        color: index.isEven
                            ? PdfColors.grey100
                            : PdfColors.white,
                      ),
                      children: [
                        _tableCell(p.name),
                        _tableCell(
                          p.stock.toString(),
                          align: pw.TextAlign.center,
                        ),
                        _tableCell(
                          'S/ ${p.unitPrice.toStringAsFixed(2)}',
                          align: pw.TextAlign.right,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  // Helpers
  pw.Widget _tableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
        textAlign: pw.TextAlign.center,
      ),
    );
  }

  pw.Widget _tableCell(String text, {pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        textAlign: align,
        style: const pw.TextStyle(fontSize: 11),
      ),
    );
  }
}
