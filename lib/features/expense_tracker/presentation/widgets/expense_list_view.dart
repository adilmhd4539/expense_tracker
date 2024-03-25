import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/handlers/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../resorses/app_colors.dart';
import '../../../../resorses/app_textstyles.dart';
import '../../../../resorses/dimens.dart';
import '../../../../resorses/enums.dart';
import '../../domain/entities/expense_entity.dart';

class ExpenseListView extends StatelessWidget {
  final List<DateTime> dates;
  final List<Expense> expenseList;
  const ExpenseListView({
    super.key,
    required this.dates,
    required this.expenseList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10, bottom: 50),
      itemCount: dates.length,
      separatorBuilder: (context, index) => Dimens.constHeight,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('dd-MM-yyyy').format(dates[index]),
            style: AppTextStyles.largeBold,
          ),
          Dimens.constHeight,
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, subindex) => _buildExpesneTile(
                  expenseList
                      .where((element) =>
                          DateUtils.isSameDay(element.date, dates[index]))
                      .toList()[subindex],
                  context),
              separatorBuilder: (context, subindex) => Dimens.constHeight,
              itemCount: expenseList
                  .where((element) =>
                      DateUtils.isSameDay(element.date, dates[index]))
                  .toList()
                  .length)
        ],
      ),
    );
  }

  Widget _buildExpesneTile(Expense expense, BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(AddExpenseTrackerRoute(expense: expense));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.black, width: .5),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16)),
              child: SvgPicture.asset(
                  expense.category.categoryType == CategoryType.income
                      ? 'assets/icons/income.svg'
                      : 'assets/icons/expense.svg'),
            ),
            Dimens.constWidth,
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 0,
                        child: Text(
                          expense.category.categoryName,
                          style: AppTextStyles.bodyBold,
                        )),
                    const Spacer(),
                    Text(
                      '\$${expense.amount}',
                      style: AppTextStyles.extralargeBold.copyWith(
                        color:
                            expense.category.categoryType == CategoryType.income
                                ? AppColors.green
                                : AppColors.red,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(flex: 0, child: Text(expense.notes)),
                    const Spacer(),
                    Text(DateFormat('hh:mm a').format(expense.date))
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
