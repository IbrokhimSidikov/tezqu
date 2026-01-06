import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../data/models/expense_category_model.dart';
import '../cubit/expense_cubit.dart';
import '../cubit/expense_state.dart';
import '../widgets/add_expense_bottom_sheet.dart';
import '../widgets/expense_card.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> with TickerProviderStateMixin {
  TabController? _tabController;
  List<ExpenseCategoryModel> _categories = [];

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _updateTabController(List<ExpenseCategoryModel> categories) {
    if (_categories.length != categories.length) {
      _tabController?.dispose();
      _tabController = TabController(length: categories.length, vsync: this);
      _categories = categories;
    }
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExpenseCubit>()..loadExpenseCategories(),
      child: Scaffold(
        backgroundColor: AppColors.cxWhite,
        appBar: AppBar(
          backgroundColor: AppColors.cxWhite,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5F7F9),
              ),
              child: IconButton(
                iconSize: 29.sp,
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          title: Text('Chiqimlar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
          actions: [
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cxF5F7F9,
                    ),
                    child: IconButton(
                      iconSize: 29.sp,
                      icon: Icon(Icons.add),
                      color: AppColors.cx43C19F,
                      onPressed: () {
                        final cubit = context.read<ExpenseCubit>();
                        final state = cubit.state;
                        if (state is ExpenseCategoriesLoaded) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (bottomSheetContext) => BlocProvider.value(
                              value: cubit,
                              child: AddExpenseBottomSheet(
                                categories: state.categories,
                                currencies: state.currencies,
                                paymentMethods: state.paymentMethods,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ExpenseCubit, ExpenseState>(
          builder: (context, state) {
            if (state is ExpenseLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.cx43C19F,
                ),
              );
            }

            if (state is ExpenseError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                    SizedBox(height: 16.h),
                    Text(
                      'Xatolik yuz berdi',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      state.message,
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            if (state is ExpenseCategoriesLoaded) {
              _updateTabController(state.categories);

              if (state.categories.isEmpty) {
                return Center(
                  child: Text(
                    'Chiqim toifalari topilmadi',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                );
              }

              if (_tabController == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.cx43C19F,
                  ),
                );
              }

              return Column(
                children: [
                  Container(
                    color: AppColors.cxWhite,
                    child: TabBar(
                      controller: _tabController!,
                      isScrollable: true,
                      indicatorColor: AppColors.cx43C19F,
                      labelColor: AppColors.cx43C19F,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: state.categories.map((category) {
                        return Tab(
                          child: Row(
                            children: [
                              Text(category.icon),
                              SizedBox(width: 8.w),
                              Text(category.name),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController!,
                      children: state.categories.map((category) {
                        return _buildCategoryContent(category, state);
                      }).toList(),
                    ),
                  ),
                ],
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildCategoryContent(ExpenseCategoryModel category, ExpenseCategoriesLoaded state) {
    final expenses = state.expensesByCategory[category.id] ?? [];
    final hasLoadedExpenses = state.expensesByCategory.containsKey(category.id);

    return Builder(
      builder: (context) {
        if (!hasLoadedExpenses) {
          context.read<ExpenseCubit>().loadExpensesForCategory(category.id);
        }

        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chiqimlar ro\'yxati',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  Iconify(
                    Tabler.search,
                    size: 27.sp,
                    color: AppColors.cxDADADA,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: expenses.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category.icon,
                              style: TextStyle(fontSize: 48.sp),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Bu toifa uchun chiqimlar yo\'q',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final expense = expenses[index];
                          return ExpenseCard(
                            expense: expense,
                            categoryIcon: category.icon,
                            categoryColor: category.color,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
