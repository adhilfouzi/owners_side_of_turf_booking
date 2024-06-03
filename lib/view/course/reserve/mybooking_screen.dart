import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../view_model/course/slot_request_controller.dart';
import '../../../model/data_model/booking_model.dart';
import '../revenue/utils/date_filter.dart';
import 'utils/booking_list_item.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    final SlotReservationController controller = Get.find();

    Future<void> refresh() async {
      await controller.fetchBookingRequests();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Slot Reservation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage));
            } else {
              return Column(
                children: [
                  DateFilter(
                    isRevenue: false,
                    startDate: controller.startDate,
                    endDate: controller.endDate,
                    onDateRangeSelected: (DateTimeRange? picked) {
                      if (picked != null) {
                        controller.updateDateRange(picked.start, picked.end);
                      }
                    },
                  ),
                  Expanded(
                    child: controller.groupedBookings.isEmpty
                        ? RefreshIndicator(
                            onRefresh: refresh,
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height - 200,
                                alignment: Alignment.center,
                                child: const Text("No bookings available"),
                              ),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: refresh,
                            child: ListView.builder(
                              itemCount: controller.groupedBookings.length,
                              itemBuilder: (context, index) {
                                DateTime date = controller.groupedBookings.keys
                                    .toList()[index];
                                List<BookingModel> bookings =
                                    controller.groupedBookings[date]!;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Text(
                                        DateFormat('dd-MMM-yy').format(date),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: bookings.length,
                                      itemBuilder: (context, index) {
                                        var booking = bookings[index];
                                        return BookingListItem(
                                            booking: booking);
                                      },
                                    ),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
