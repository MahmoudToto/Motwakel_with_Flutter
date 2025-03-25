import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTextField.dart';

import '../otp/OTPScreen.dart'; // Import the new AuthCubit

class SinUpCubit extends Cubit<String?> {
  SinUpCubit() : super(null);

  void selectCategory(String category) {
    emit(category);
  }

  void sendOTP(String phoneNumber) {
    // Add your OTP sending logic here
    print('OTP sent to $phoneNumber');
  }
}

class SinUpPadge extends StatefulWidget {
  final Function(String) onAccountTypeSelected;
  final Function(String) onSendOTP;
  SinUpPadge({
    required this.onAccountTypeSelected,
    required this.onSendOTP,
  });

  @override
  _SinUpPadgeState createState() => _SinUpPadgeState();
}

class _SinUpPadgeState extends State<SinUpPadge>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> categories = [
    "ماركت أو لبان",
    "علافة أو عطارة",
    "تموين",
    "منظفات",
    "جمعية",
    "مقلة",
    "مخبز أو حلواني",
    "مطعم / كافيه / بوفية",
    "مدرسة أو حضانة",
    "صيدلية أو مستشفى",
    "منفذ جيش أو شرطة",
    "توريدات",
    "جملة أو توزيع",
    "سرجة",
    "كاتين",
    "كشك",
    "مجمدات",
    "كنيسة",
    "منزل",
    "مكتبة",
    "بنزينة",
    "محموعة محلات",
    "بقالة",
    "هايبر"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          height: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "اختر فئة العمل",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(categories[index]),
                      onTap: () {
                        context
                            .read<SinUpCubit>()
                            .selectCategory(categories[index]);
                        Navigator.pop(context);
                      },
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

  void _onNextPressed(BuildContext context) {
    final selectedCategory = context.read<SinUpCubit>().state;
    if (_tabController.index == 0) {
      // Store form
      if (selectedCategory != null) {
        widget.onAccountTypeSelected(selectedCategory);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              phoneNumber: '01117561394', // Replace with actual phone number
              onOTPVerified: (isVerified) {
                if (isVerified) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('الكود غير صحيح. حاول مرة أخرى.')),
                  );
                }
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى اختيار نوع الحساب.')),
        );
      }
    } else {
      // Customer form
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
            phoneNumber: '01117561394', // Replace with actual phone number
            onOTPVerified: (isVerified) {
              if (isVerified) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('الكود غير صحيح. حاول مرة أخرى.')),
                );
              }
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SinUpCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                tabs: [
                  Tab(text: 'متجر'),
                  Tab(text: 'مستهلك منزلي'),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: _buildFormStore(),
                    ),
                    SingleChildScrollView(
                      child: _buildFormCustomer(),
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

  Widget _buildFormStore() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(
              labelText: 'اسم المستخدم',
              isPassword: false,
              prefixIcon: Icons.person,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'اسم المحل',
              isPassword: false,
              prefixIcon: Icons.store,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'رقم الهاتف الأساسي',
              isPassword: false,
              prefixIcon: Icons.phone,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'رقم الهاتف (اختياري)',
              isPassword: false,
              prefixIcon: Icons.phone,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'كلمة المرور',
              isPassword: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'تأكيد كلمة المرور',
              isPassword: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              controller: null),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () => _showCategoryPicker(context),
            child: BlocBuilder<SinUpCubit, String?>(
              builder: (context, selectedCategory) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory ?? "اختر فئة العمل",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.green),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFormCustomer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(
              labelText: 'اسم المستخدم',
              isPassword: false,
              prefixIcon: Icons.person,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'اسم المحل',
              isPassword: false,
              prefixIcon: Icons.store,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'رقم الهاتف الأساسي',
              isPassword: false,
              prefixIcon: Icons.phone,
              controller: null),
          SizedBox(height: 16),
          CustomTextField(
              labelText: 'رقم الهاتف (اختياري)',
              isPassword: false,
              prefixIcon: Icons.phone,
              controller: null),
          SizedBox(height: 20),
          CustomTextField(
              labelText: 'كلمة المرور',
              isPassword: true,
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility,
              controller: null),
          SizedBox(height: 20),
          // Removed the "تحقق من OTP" button
        ],
      ),
    );
  }
}
