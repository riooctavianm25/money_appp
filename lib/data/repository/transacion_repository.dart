import 'package:money_appp/data/service/http_service.dart';
import 'package:money_appp/data/use_case/request/add_transaction_request.dart';
// Import model response untuk list (yang kamu kirim sebelumnya)
import 'package:money_appp/data/use_case/response/get_all_transaction_response.dart'; 
// Import model response untuk single (jika masih dipakai)
import 'package:money_appp/data/use_case/response/get_transactions_response.dart';

class TransactionRepository {
  final HttpService httpService;

  TransactionRepository(this.httpService);

  // Fungsi untuk mengambil 1 transaksi (Detail)
  Future<GetTransactionsResponse> getTransaction() async {
    final response = await httpService.get('transactions', {});
    if (response.statusCode == 200) {
      return GetTransactionsResponse.fromJson(response.body);
    } else {
      return GetTransactionsResponse.fromJson(response.body);
    }
  }

  // --- PERBAIKAN DI SINI ---
  // Fungsi untuk mengambil SEMUA transaksi (List)
  Future<GetAllTransactionResponse> getAllTransactions() async {
    // 1. Panggil API (Endpoint mungkin 'transactions' atau 'transactions/all' sesuaikan dengan backend)
    final response = await httpService.get('transactions', {}); 

    // 2. Cek status code
    if (response.statusCode == 200) {
      // 3. Parse menggunakan model List (GetAllTransactionResponse)
      return GetAllTransactionResponse.fromJson(response.body);
    } else {
      // 4. Handle error, kembalikan object dengan status error atau throw exception
      // Pastikan backend mengirim format yang sesuai saat error
      return GetAllTransactionResponse.fromJson(response.body);
    }
  }

  Future createTransaction({required AddTransactionRequest request}) async {
      // Nanti isi juga bagian ini agar tidak error saat create
  }
}