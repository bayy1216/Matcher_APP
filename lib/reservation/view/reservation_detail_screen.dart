import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../model/seat_state_enum.dart';

class ReservationDetailScreen extends StatelessWidget {
  static String get routeName => 'reservation_detail';

  const ReservationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      body: ListView(
        children: [
          const SizedBox(height: 10),
          _Content(
            title: 'GDSC 정기모임',
            date: '2021-10-10 12:00 ~ 14:00',
            location: '복현회관',
            content: '스터디 계획을 세워보아요',
          ),
          Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
            height: 360,
            child: TableExample(),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String content;

  const _Content({
    super.key,
    required this.title,
    required this.location,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TITLE_MEDIUMN_STYLE.copyWith(height: 0.8)),
          Text(date, style: CONTENT_SMALL_STYLE),
          const SizedBox(height: 20),
          Text(
            content,
            style: CONTENT_MEDIUMN_STYLE.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 20),
          Text(location, style: CONTENT_SMALL_STYLE),
        ],
      ),
    );
  }
}

/// The class containing the TableView for the sample application.
class TableExample extends StatefulWidget {
  /// Creates a screen that demonstrates the TableView widget.
  const TableExample({super.key});

  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  late final ScrollController _verticalController = ScrollController();
  final int rowCount = 29;
  final int columnCount = 20;
  late final int total =rowCount * columnCount;
  late final List<bool> ary = List.generate(total, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: TableView.builder(
        verticalDetails:
        ScrollableDetails.vertical(controller: _verticalController),
        cellBuilder: _buildCell,
        columnCount: columnCount,
        columnBuilder: _buildColumnSpan,
        rowCount: rowCount,
        rowBuilder: _buildRowSpan,
      ),
    );
  }

  Widget _buildCell(BuildContext context, TableVicinity vicinity) {
    final x = vicinity.column;
    final y = vicinity.row;
    final isSelect = ary[x * columnCount + y];
    return GestureDetector(
      onTap: () {
        setState(() {
          ary[x * columnCount + y] = !isSelect;
        });
        print("$x, $y click!");
      },
      child: SeatItem(
        row: y,
        column: x,
        seatState: isSelect ? SeatState.reserved : SeatState.available,
      ),
    );
  }

  TableSpan _buildColumnSpan(int index) {
    return const TableSpan(
      extent: FixedTableSpanExtent(50),
    );
  }

  TableSpan _buildRowSpan(int index) {
    return const TableSpan(
      extent: FixedTableSpanExtent(50),
    );

  }
}

class SeatItem extends StatelessWidget {
  final int row;
  final int column;
  final SeatState seatState;
  const SeatItem({
    super.key,
    required this.row,
    required this.column,
    required this.seatState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 30,
      height: 30,
      color: seatState.color,
      child: Center(child: Text(DataUtils.convertXYToAlphabet(row, column))),
    );
  }
}
