import 'package:flutter/material.dart';
import 'package:motwakel/widgets/shared_widgets/CustomTextField.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  int _currentStep = 1;
  late TabController _tabController;
  String? selectedCategory;

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
  void _showCategoryPicker() {
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
                        setState(() {
                          selectedCategory = categories[index];
                        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'إنشاء حساب',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
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
            _buildStepper(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: _buildFormStore(),
                  ),
                  _buildFormCustomer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildFormStore() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(labelText: 'اسم المستخدم', isPassword: false, prefixIcon: Icons.person, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'اسم المحل', isPassword: false, prefixIcon: Icons.store, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'رقم الهاتف الأساسي', isPassword: false, prefixIcon: Icons.phone, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'رقم الهاتف (اختياري)', isPassword: false, prefixIcon: Icons.phone, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'كلمة المرور', isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.visibility, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'تأكيد كلمة المرور', isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.visibility, controller: null),
          SizedBox(height: 20),
          GestureDetector(
            onTap: _showCategoryPicker,
            child: Container(
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
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('التالي', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCustomer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(labelText: 'اسم المستخدم', isPassword: false, prefixIcon: Icons.person, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'اسم المحل', isPassword: false, prefixIcon: Icons.store, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'رقم الهاتف الأساسي', isPassword: false, prefixIcon: Icons.phone, controller: null),
          SizedBox(height: 16),
          CustomTextField(labelText: 'رقم الهاتف (اختياري)', isPassword: false, prefixIcon: Icons.phone, controller: null),
          SizedBox(height: 20),
          CustomTextField(labelText: 'كلمة المرور', isPassword: true, prefixIcon: Icons.lock, suffixIcon: Icons.visibility, controller: null),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('التالي', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Row(
          children: [
            CircleAvatar(
              backgroundColor: _currentStep >= index + 1 ? Colors.green : Colors.grey.shade300,
              radius: 12,
              child: _currentStep >= index + 1 ? Icon(Icons.check, size: 16, color: Colors.white) : Text('${index + 1}', style: TextStyle(color: Colors.black)),
            ),
            if (index < 3) Container(width: 20, height: 2, color: _currentStep > index + 1 ? Colors.green : Colors.grey.shade300),
          ],
        );
      }),
    );
  }
}
