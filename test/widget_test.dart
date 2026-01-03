import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart'; // Added file_picker import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const PaperLinkApp());
}

class PaperLinkApp extends StatelessWidget {
  const PaperLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaperLink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1565C0), Color(0xFF4A148C)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, size: 100, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'PaperLink',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Educational Portal',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 50),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () => _navigateToAdmin(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.admin_panel_settings),
                        SizedBox(width: 10),
                        Text(
                          'Admin Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () => _navigateToStudent(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text(
                          'Student Access',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Educational portal',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const Text(
                  'Manage Student Papers',
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToAdmin(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AdminLoginPage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }

  void _navigateToStudent(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const StudentHomePage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 200),
      ),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _isPasswordVisible.dispose();
    _isLoading.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Admin Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.admin_panel_settings,
                size: 80,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Admin Portal',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Password-based secure access',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _usernameController,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
              decoration: InputDecoration(
                labelText: 'Admin Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: _isPasswordVisible,
              builder: (context, isVisible, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !isVisible,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _loginAsAdmin(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        _isPasswordVisible.value = !_isPasswordVisible.value;
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _showForgotPasswordDialog(context);
                },
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 30),
            ValueListenableBuilder<bool>(
              valueListenable: _isLoading,
              builder: (context, isLoading, child) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _loginAsAdmin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const StudentHomePage(),
                      transitionsBuilder: (_, animation, __, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  );
                },
                child: const Text('Switch to Student Access'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loginAsAdmin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Check for correct credentials
    if (username != 'Fahdil' || password != 'Fahdil@1') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    _isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    _isLoading.value = false;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AdminHomePage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();
    final focusNode = FocusNode();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter your admin email to receive reset instructions',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                focusNode: focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Admin Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onFieldSubmitted: (_) {
                  _processPasswordReset(context, emailController.text.trim());
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _processPasswordReset(context, emailController.text.trim());
              },
              child: const Text('Send Instructions'),
            ),
          ],
        );
      },
    ).then((_) {
      emailController.dispose();
      focusNode.dispose();
    });
  }

  void _processPasswordReset(BuildContext context, String email) {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset instructions sent to your email'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Map<String, dynamic>> pendingPapers = [
    {
      'id': '1',
      'title': 'Introduction to Machine Learning',
      'studentId': 'STU2024001',
      'studentName': 'John Doe',
      'subject': 'Computer Science',
      'date': '2024-01-15',
      'fileSize': '12MB',
      'status': 'pending',
      'fileType': 'PDF',
      'abstract':
          'This paper explores the fundamentals of machine learning algorithms and their applications in modern technology.',
    },
    {
      'id': '2',
      'title': 'Quantum Physics Research',
      'studentId': 'STU2024002',
      'studentName': 'Jane Smith',
      'subject': 'Physics',
      'date': '2024-01-10',
      'fileSize': '8MB',
      'status': 'pending',
      'fileType': 'PDF',
      'abstract':
          'Research on quantum mechanics principles and experimental verifications.',
    },
    {
      'id': '3',
      'title': 'Modern Economic Theories',
      'studentId': 'STU2024003',
      'studentName': 'Bob Johnson',
      'subject': 'Economics',
      'date': '2024-01-05',
      'fileSize': '15MB',
      'status': 'pending',
      'fileType': 'DOCX',
      'abstract': 'Analysis of contemporary economic models and theories.',
    },
  ];

  List<Map<String, dynamic>> approvedPapers = [
    {
      'id': '101',
      'title': 'Data Structures Assignment',
      'studentId': 'STU2024004',
      'studentName': 'Alice Brown',
      'subject': 'Computer Science',
      'date': '2024-01-20',
      'fileSize': '5MB',
      'status': 'approved',
      'grade': 'A',
      'feedback': 'Excellent work with detailed explanations.',
    },
    {
      'id': '102',
      'title': 'Chemical Reactions Study',
      'studentId': 'STU2024005',
      'studentName': 'Charlie Wilson',
      'subject': 'Chemistry',
      'date': '2024-01-18',
      'fileSize': '10MB',
      'status': 'approved',
      'grade': 'B+',
      'feedback': 'Good research, needs more experimental data.',
    },
  ];

  List<Map<String, dynamic>> adminUploadedPapers = [];

  // For file picker
  PlatformFile? _selectedFile;
  String? _selectedFilePath;

  void _acceptPaper(String paperId, String grade, String feedback) {
    setState(() {
      final paperIndex = pendingPapers.indexWhere(
        (paper) => paper['id'] == paperId,
      );
      if (paperIndex != -1) {
        final paper = pendingPapers[paperIndex];
        paper['status'] = 'approved';
        paper['grade'] = grade;
        paper['feedback'] = feedback;
        paper['reviewedDate'] = DateTime.now().toString().split(' ')[0];
        paper['reviewedBy'] = 'Admin Fahdil';

        approvedPapers.add(paper);
        pendingPapers.removeAt(paperIndex);
      }
    });
  }

  void _rejectPaper(String paperId, String reason) {
    setState(() {
      final paperIndex = pendingPapers.indexWhere(
        (paper) => paper['id'] == paperId,
      );
      if (paperIndex != -1) {
        final paper = pendingPapers[paperIndex];
        paper['status'] = 'rejected';
        paper['rejectionReason'] = reason;
        paper['reviewedDate'] = DateTime.now().toString().split(' ')[0];

        // Move to rejected papers or keep in pending with rejected status
        // For simplicity, we'll just mark as rejected
      }
    });
  }

  void _uploadPaperAsAdmin(Map<String, dynamic> paperData) {
    setState(() {
      adminUploadedPapers.add({
        ...paperData,
        'id': 'ADM${DateTime.now().millisecondsSinceEpoch}',
        'uploadedBy': 'Admin Fahdil',
        'uploadDate': DateTime.now().toString().split(' ')[0],
        'status': 'admin_uploaded',
        'filePath': _selectedFilePath,
      });
      _selectedFile = null;
      _selectedFilePath = null;
    });
  }

  // File picker method for admin
  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'ppt', 'pptx', 'txt'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _selectedFile = result.files.first;
          _selectedFilePath = _selectedFile!.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking file: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () => _showAdminUploadDialog(context),
            tooltip: 'Upload Paper',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.admin_panel_settings,
                size: 150,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Fahdil',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Paper review & communication management',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 15, 10, 145),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 0,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                children: [
                  _buildAdminFeatureCard(
                    icon: Icons.pending_actions,
                    title: 'Pending Papers',
                    color: Colors.orange,
                    count: pendingPapers.length,
                    onTap: () {
                      _showPendingPapersScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.approval,
                    title: 'Approved Papers',
                    color: Colors.green,
                    count: approvedPapers.length,
                    onTap: () {
                      _showApprovedPapersScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.upload_file,
                    title: 'Admin Uploads',
                    color: Colors.purple,
                    count: adminUploadedPapers.length,
                    onTap: () {
                      _showAdminUploadsScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.reviews,
                    title: 'Paper Review',
                    color: Colors.blue,
                    onTap: () {
                      _showPaperReviewScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.chat,
                    title: 'Messages',
                    color: Colors.teal,
                    onTap: () {
                      _showAdminMessages(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.analytics,
                    title: 'Analytics',
                    color: Colors.red,
                    onTap: () {
                      _showAnalyticsScreen(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    int? count,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: color),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            if (count != null)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showPendingPapersScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  const Text(
                    'Pending Papers for Approval',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: pendingPapers.isEmpty
                        ? const Center(
                            child: Text(
                              'No pending papers',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: pendingPapers.length,
                            itemBuilder: (context, index) {
                              final paper = pendingPapers[index];
                              return _buildPendingPaperItem(paper, context);
                            },
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPendingPaperItem(
    Map<String, dynamic> paper,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
        title: Text(
          paper['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student: ${paper['studentName']} (${paper['studentId']})'),
            Text('Subject: ${paper['subject']}'),
            Text('Date: ${paper['date']} • Size: ${paper['fileSize']}'),
            Chip(
              label: Text(paper['fileType']),
              backgroundColor: Colors.grey[200],
              labelStyle: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check_circle, color: Colors.green),
              onPressed: () {
                _showAcceptPaperDialog(context, paper);
              },
              tooltip: 'Accept Paper',
            ),
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red),
              onPressed: () {
                _showRejectPaperDialog(context, paper);
              },
              tooltip: 'Reject Paper',
            ),
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.blue),
              onPressed: () {
                _viewPaperDetails(context, paper);
              },
              tooltip: 'View Details',
            ),
          ],
        ),
      ),
    );
  }

  void _showAcceptPaperDialog(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    final gradeController = TextEditingController();
    final feedbackController = TextEditingController();
    String selectedGrade = 'A';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Accept Paper'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Accepting: ${paper['title']}'),
                    Text('Student ID: ${paper['studentId']}'),
                    const SizedBox(height: 20),
                    const Text('Assign Grade:'),
                    DropdownButtonFormField<String>(
                      value: selectedGrade,
                      items: const [
                        DropdownMenuItem(value: 'A', child: Text('A')),
                        DropdownMenuItem(value: 'B+', child: Text('B+')),
                        DropdownMenuItem(value: 'B', child: Text('B')),
                        DropdownMenuItem(value: 'C+', child: Text('C+')),
                        DropdownMenuItem(value: 'C', child: Text('C')),
                        DropdownMenuItem(value: 'D', child: Text('D')),
                        DropdownMenuItem(value: 'F', child: Text('F')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGrade = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: feedbackController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Feedback (Optional)',
                        border: OutlineInputBorder(),
                        hintText: 'Enter your feedback here...',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedGrade.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a grade'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    _acceptPaper(
                      paper['id'],
                      selectedGrade,
                      feedbackController.text,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Paper "${paper['title']}" accepted with grade $selectedGrade',
                        ),
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text('Accept Paper'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showRejectPaperDialog(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reject Paper'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rejecting: ${paper['title']}'),
              Text('Student ID: ${paper['studentId']}'),
              const SizedBox(height: 20),
              TextField(
                controller: reasonController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Reason for rejection',
                  border: OutlineInputBorder(),
                  hintText: 'Enter the reason for rejection...',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (reasonController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please provide a reason for rejection'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                _rejectPaper(paper['id'], reasonController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Paper "${paper['title']}" rejected'),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Reject Paper'),
            ),
          ],
        );
      },
    );
  }

  void _viewPaperDetails(BuildContext context, Map<String, dynamic> paper) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(paper['title']),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Student: ${paper['studentName']}'),
                Text('Student ID: ${paper['studentId']}'),
                const SizedBox(height: 10),
                Text('Subject: ${paper['subject']}'),
                const SizedBox(height: 10),
                Text('Submitted: ${paper['date']}'),
                const SizedBox(height: 10),
                Text('File Size: ${paper['fileSize']}'),
                const SizedBox(height: 10),
                Text('Format: ${paper['fileType']}'),
                const SizedBox(height: 20),
                const Text(
                  'Abstract:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(paper['abstract'] ?? 'No abstract available'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Downloading paper...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _showApprovedPapersScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              const Text(
                'Approved Papers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: approvedPapers.isEmpty
                    ? const Center(
                        child: Text(
                          'No approved papers yet',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: approvedPapers.length,
                        itemBuilder: (context, index) {
                          final paper = approvedPapers[index];
                          return _buildApprovedPaperItem(paper, context);
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildApprovedPaperItem(
    Map<String, dynamic> paper,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green, size: 40),
        title: Text(
          paper['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student: ${paper['studentName']} (${paper['studentId']})'),
            Text('Subject: ${paper['subject']}'),
            Text('Date: ${paper['date']} • Grade: ${paper['grade']}'),
            if (paper['feedback'] != null && paper['feedback'].isNotEmpty)
              Text('Feedback: ${paper['feedback']}'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.blue),
              onPressed: () {
                _viewApprovedPaperDetails(context, paper);
              },
              tooltip: 'View Details',
            ),
            IconButton(
              icon: const Icon(Icons.download, color: Colors.green),
              onPressed: () {
                _downloadPaper(paper);
              },
              tooltip: 'Download',
            ),
          ],
        ),
      ),
    );
  }

  void _viewApprovedPaperDetails(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(paper['title']),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Student: ${paper['studentName']}'),
                Text('Student ID: ${paper['studentId']}'),
                const SizedBox(height: 10),
                Text('Subject: ${paper['subject']}'),
                const SizedBox(height: 10),
                Text('Submitted: ${paper['date']}'),
                const SizedBox(height: 10),
                Text('Approved on: ${paper['reviewedDate'] ?? 'N/A'}'),
                const SizedBox(height: 10),
                Text('Grade: ${paper['grade']}'),
                const SizedBox(height: 10),
                Text('File Size: ${paper['fileSize']}'),
                const SizedBox(height: 20),
                if (paper['feedback'] != null &&
                    paper['feedback'].isNotEmpty) ...[
                  const Text(
                    'Feedback:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(paper['feedback']),
                  const SizedBox(height: 20),
                ],
                const Text(
                  'Abstract:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(paper['abstract'] ?? 'No abstract available'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadPaper(paper);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _downloadPaper(Map<String, dynamic> paper) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading ${paper['title']}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showAdminUploadDialog(BuildContext context) {
    final titleController = TextEditingController();
    final subjectController = TextEditingController();
    final descriptionController = TextEditingController();
    String? selectedFileType = 'PDF';
    String? selectedSubject = 'Computer Science';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Paper as Admin',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select file type:'),
                    Wrap(
                      spacing: 8,
                      children: ['PDF', 'DOCX', 'PPT', 'TXT'].map((type) {
                        return ChoiceChip(
                          label: Text(type),
                          selected: selectedFileType == type,
                          onSelected: (selected) {
                            setState(() {
                              selectedFileType = type;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select subject:'),
                    DropdownButtonFormField<String>(
                      value: selectedSubject,
                      items: const [
                        DropdownMenuItem(
                          value: 'Computer Science',
                          child: Text('Computer Science'),
                        ),
                        DropdownMenuItem(
                          value: 'Mathematics',
                          child: Text('Mathematics'),
                        ),
                        DropdownMenuItem(
                          value: 'Physics',
                          child: Text('Physics'),
                        ),
                        DropdownMenuItem(
                          value: 'Chemistry',
                          child: Text('Chemistry'),
                        ),
                        DropdownMenuItem(
                          value: 'Economics',
                          child: Text('Economics'),
                        ),
                        DropdownMenuItem(
                          value: 'General',
                          child: Text('General'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Choose subject',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Paper Title',
                        border: OutlineInputBorder(),
                        hintText: 'Enter paper title',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description (Optional)',
                        border: OutlineInputBorder(),
                        hintText: 'Enter paper description or abstract',
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _pickFile,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedFile != null
                                ? Colors.blue
                                : Colors.grey,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: _selectedFile != null
                            ? Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _selectedFile!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${(_selectedFile!.size / 1024).toStringAsFixed(2)} KB',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    TextButton(
                                      onPressed: _pickFile,
                                      child: const Text('Change File'),
                                    ),
                                  ],
                                ),
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text('Tap to select file'),
                                  Text(
                                    'Supports: PDF, DOC, DOCX, PPT, PPTX, TXT',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _selectedFile = null;
                                _selectedFilePath = null;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a title'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              if (_selectedFile == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a file'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              final paperData = {
                                'title': titleController.text,
                                'subject': selectedSubject!,
                                'fileType': selectedFileType!,
                                'description': descriptionController.text,
                                'fileSize':
                                    '${(_selectedFile!.size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                'date': DateTime.now().toString().split(' ')[0],
                              };

                              _uploadPaperAsAdmin(paperData);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Paper uploaded successfully as Admin!',
                                  ),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            child: const Text('Upload'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showAdminUploadsScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              const Text(
                'Papers Uploaded by Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: adminUploadedPapers.isEmpty
                    ? const Center(
                        child: Text(
                          'No papers uploaded by admin yet',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: adminUploadedPapers.length,
                        itemBuilder: (context, index) {
                          final paper = adminUploadedPapers[index];
                          return _buildAdminUploadedPaperItem(paper, context);
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAdminUploadedPaperItem(
    Map<String, dynamic> paper,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(
          Icons.admin_panel_settings,
          color: Colors.purple,
          size: 40,
        ),
        title: Text(
          paper['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: ${paper['subject']}'),
            Text(
              'Uploaded: ${paper['uploadDate']} • Format: ${paper['fileType']}',
            ),
            if (paper['description'] != null && paper['description'].isNotEmpty)
              Text('Description: ${paper['description']}'),
            Chip(
              label: const Text('Admin Upload'),
              backgroundColor: Colors.purple[100],
              labelStyle: const TextStyle(fontSize: 10, color: Colors.purple),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.visibility, color: Colors.blue),
              onPressed: () {
                _viewAdminUploadDetails(context, paper);
              },
              tooltip: 'View Details',
            ),
            IconButton(
              icon: const Icon(Icons.download, color: Colors.green),
              onPressed: () {
                _downloadPaper(paper);
              },
              tooltip: 'Download',
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteAdminPaperDialog(context, paper);
              },
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  void _viewAdminUploadDetails(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(paper['title']),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Uploaded by: ${paper['uploadedBy']}'),
                const SizedBox(height: 10),
                Text('Subject: ${paper['subject']}'),
                const SizedBox(height: 10),
                Text('Upload Date: ${paper['uploadDate']}'),
                const SizedBox(height: 10),
                Text('File Type: ${paper['fileType']}'),
                const SizedBox(height: 10),
                Text('File Size: ${paper['fileSize']}'),
                const SizedBox(height: 20),
                if (paper['description'] != null &&
                    paper['description'].isNotEmpty) ...[
                  const Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(paper['description']),
                  const SizedBox(height: 20),
                ],
                const Text(
                  'Status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: const Text('Admin Uploaded'),
                  backgroundColor: Colors.purple[100],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadPaper(paper);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAdminPaperDialog(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Paper'),
          content: Text('Are you sure you want to delete "${paper['title']}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  adminUploadedPapers.removeWhere(
                    (p) => p['id'] == paper['id'],
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Paper "${paper['title']}" deleted'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showPaperReviewScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Paper Review Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: [
                    _buildReviewStatCard(
                      'Pending',
                      pendingPapers.length,
                      Colors.orange,
                      Icons.pending_actions,
                    ),
                    _buildReviewStatCard(
                      'Approved',
                      approvedPapers.length,
                      Colors.green,
                      Icons.check_circle,
                    ),
                    _buildReviewStatCard(
                      'Admin Uploads',
                      adminUploadedPapers.length,
                      Colors.purple,
                      Icons.upload_file,
                    ),
                    _buildReviewStatCard(
                      'Total',
                      pendingPapers.length +
                          approvedPapers.length +
                          adminUploadedPapers.length,
                      Colors.blue,
                      Icons.library_books,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReviewStatCard(
    String title,
    int count,
    Color color,
    IconData icon,
  ) {
    return Card(
      color: color.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(title, style: TextStyle(fontSize: 14, color: color)),
        ],
      ),
    );
  }

  void _showAdminMessages(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Admin Messages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    MessageBubble(
                      text: 'Hello Admin, when will my paper be reviewed?',
                      isMe: false,
                      time: '10:30 AM',
                    ),
                    MessageBubble(
                      text:
                          'Your paper is in the queue, will be reviewed within 24 hours.',
                      isMe: true,
                      time: '10:35 AM',
                    ),
                    MessageBubble(
                      text: 'Thank you!',
                      isMe: false,
                      time: '10:36 AM',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your reply...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAnalyticsScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Analytics Dashboard'),
          content: SizedBox(
            height: 400,
            child: Column(
              children: [
                _buildAnalyticsItem(
                  'Total Papers Submitted',
                  '${pendingPapers.length + approvedPapers.length + adminUploadedPapers.length}',
                ),
                _buildAnalyticsItem(
                  'Papers Pending Review',
                  '${pendingPapers.length}',
                ),
                _buildAnalyticsItem(
                  'Papers Approved',
                  '${approvedPapers.length}',
                ),
                _buildAnalyticsItem(
                  'Admin Uploaded Papers',
                  '${adminUploadedPapers.length}',
                ),
                _buildAnalyticsItem('Average Review Time', '2.3 days'),
                _buildAnalyticsItem(
                  'Approval Rate',
                  '${approvedPapers.length > 0 ? ((approvedPapers.length / (pendingPapers.length + approvedPapers.length)) * 100).toStringAsFixed(1) : '0'}%',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Detailed analytics opened'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('View Detailed Report'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAnalyticsItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Map<String, dynamic>> _approvedPapers = [
    {
      'id': '1',
      'title': 'Introduction to Machine Learning',
      'subject': 'Computer Science',
      'date': '2024-01-15',
      'status': 'Approved',
      'grade': 'A',
    },
    {
      'id': '2',
      'title': 'Quantum Physics Research',
      'subject': 'Physics',
      'date': '2024-01-10',
      'status': 'Approved',
      'grade': 'B+',
    },
    {
      'id': '3',
      'title': 'Modern Economic Theories',
      'subject': 'Economics',
      'date': '2024-01-05',
      'status': 'Approved',
      'grade': 'A-',
    },
  ];

  final List<Map<String, dynamic>> _pendingSubmissions = [
    {
      'id': '1',
      'title': 'Data Structures Assignment',
      'subject': 'Computer Science',
      'date': '2024-01-20',
      'status': 'Pending Review',
    },
  ];

  final List<String> _selectedSubjects = ['Computer Science', 'Physics'];
  final List<Map<String, dynamic>> _exercises = [
    {
      'id': '1',
      'title': 'Machine Learning Problem Set',
      'subject': 'Computer Science',
      'date': '2 hours ago',
      'completed': false,
    },
    {
      'id': '2',
      'title': 'Quantum Mechanics Exercises',
      'subject': 'Physics',
      'date': '1 day ago',
      'completed': true,
    },
  ];

  // For file picker
  PlatformFile? _selectedStudentFile;
  String? _selectedStudentFilePath;

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  // File picker method for student
  Future<void> _pickStudentFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _selectedStudentFile = result.files.first;
          _selectedStudentFilePath = _selectedStudentFile!.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking file: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Dear Student',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Colors.grey,
                  size: 22,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              _showNotifications(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.grey,
              size: 22,
            ),
            onPressed: _openMessages,
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 20),
                    SizedBox(width: 10),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                );
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return _buildBody(index);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showUploadDialog,
        icon: const Icon(Icons.upload, size: 20),
        label: const Text('Upload Paper', style: TextStyle(fontSize: 14)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) => _selectedIndex.value = newIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard, size: 22),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books, size: 22),
                label: 'Papers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome, size: 22),
                label: 'AI Exercises',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 22),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildDashboard();
      case 1:
        return _buildPapersList();
      case 2:
        return _buildAIExercises();
      case 3:
        return _buildProfile();
      default:
        return _buildDashboard();
    }
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickStats(),
          const SizedBox(height: 24),
          _buildPendingSubmissions(),
          const SizedBox(height: 24),
          _buildRecentPapers(),
          const SizedBox(height: 24),
          _buildAIExerciseCard(),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.check_circle,
            '${_approvedPapers.length}',
            'Approved',
            Colors.green,
          ),
          _buildStatItem(
            Icons.pending,
            '${_pendingSubmissions.length}',
            'Pending',
            Colors.orange,
          ),
          _buildStatItem(
            Icons.upload_file,
            '${_approvedPapers.length + _pendingSubmissions.length}',
            'Total Uploads',
            Colors.blue,
          ),
          _buildStatItem(Icons.grade, 'A-', 'Avg Grade', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildPendingSubmissions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Submissions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ..._pendingSubmissions.map(
          (paper) => _buildPaperCard(paper, isPending: true),
        ),
      ],
    );
  }

  Widget _buildRecentPapers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Approved Papers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _selectedIndex.value = 1,
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ..._approvedPapers.take(2).map((paper) => _buildPaperCard(paper)),
      ],
    );
  }

  Widget _buildPaperCard(Map<String, dynamic> paper, {bool isPending = false}) {
    return GestureDetector(
      onTap: () {
        _showPaperDetails(paper);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getSubjectIcon(paper['subject']),
              color: Colors.blue,
              size: 24,
            ),
          ),
          title: Text(
            paper['title'],
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(paper['subject']),
              const SizedBox(height: 4),
              Text(
                'Submitted: ${paper['date']}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPending ? Colors.orange[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              paper['status'],
              style: TextStyle(
                color: isPending ? Colors.orange[800] : Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAIExerciseCard() {
    return GestureDetector(
      onTap: () => _selectedIndex.value = 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1565C0), Color(0xFF4A148C)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AI Exercise Generator',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Get personalized exercises based on your selected subjects',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _selectedIndex.value = 2,
                    icon: const Icon(Icons.auto_awesome, size: 16),
                    label: const Text('Generate Exercises'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1565C0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.auto_awesome, size: 50, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildPapersList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _approvedPapers.length + _pendingSubmissions.length,
      itemBuilder: (context, index) {
        final allPapers = [..._approvedPapers, ..._pendingSubmissions];
        final paper = allPapers[index];
        final isPending = index >= _approvedPapers.length;

        return GestureDetector(
          onTap: () {
            _showPaperDetails(paper);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                paper['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(paper['subject']),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: [
                      if (paper['grade'] != null)
                        Chip(
                          label: Text(paper['grade']),
                          backgroundColor: Colors.green[50],
                          labelStyle: const TextStyle(fontSize: 12),
                        ),
                      Chip(
                        label: Text(paper['status']),
                        backgroundColor: isPending
                            ? Colors.orange[50]
                            : Colors.blue[50],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, size: 22),
                    onPressed: () {
                      _showPaperDetails(paper);
                    },
                    tooltip: 'View Details',
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, size: 22),
                    onPressed: () {
                      _downloadPaper(paper);
                    },
                    tooltip: 'Download',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAIExercises() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AI Exercise Generator',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Select subjects to generate personalized exercises',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          _buildSubjectSelection(),
          const SizedBox(height: 24),
          _buildGeneratedExercises(),
        ],
      ),
    );
  }

  Widget _buildSubjectSelection() {
    final subjects = [
      'Computer Science',
      'Mathematics',
      'Physics',
      'Economics',
      'Literature',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Subjects',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: subjects.map((subject) {
            final isSelected = _selectedSubjects.contains(subject);
            return FilterChip(
              label: Text(subject),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _selectedSubjects.add(subject);
                  } else {
                    _selectedSubjects.remove(subject);
                  }
                });
              },
              selectedColor: Colors.blue[100],
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              if (_selectedSubjects.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select at least one subject'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              }

              _generateExercises();
            },
            icon: const Icon(Icons.auto_awesome),
            label: const Text('Generate New Exercises'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGeneratedExercises() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Exercises',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ..._exercises.map((exercise) {
          return GestureDetector(
            onTap: () {
              _showExerciseDetails(exercise);
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: exercise['completed']
                      ? Colors.green[100]
                      : Colors.blue[100],
                  child: Icon(
                    exercise['completed'] ? Icons.check : Icons.quiz,
                    color: exercise['completed'] ? Colors.green : Colors.blue,
                  ),
                ),
                title: Text(exercise['title']),
                subtitle: Text(
                  '${exercise['subject']} • Generated ${exercise['date']}',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!exercise['completed'])
                      IconButton(
                        icon: const Icon(Icons.check, size: 20),
                        onPressed: () {
                          _markExerciseCompleted(exercise['id']);
                        },
                        tooltip: 'Mark as completed',
                      ),
                    IconButton(
                      icon: const Icon(Icons.download, size: 20),
                      onPressed: () {
                        _downloadExercise(exercise);
                      },
                      tooltip: 'Download',
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 32),
          _buildProfileMenuItem(Icons.history, 'Submission History', () {
            _showSubmissionHistory(context);
          }),
          _buildProfileMenuItem(Icons.help_outline, 'Help & Support', () {
            _showHelpSupport(context);
          }),
          _buildProfileMenuItem(Icons.logout, 'Logout', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          }, isLogout: true),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(
    IconData icon,
    String text,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey[700]),
      title: Text(
        text,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _showUploadDialog() {
    final titleController = TextEditingController();
    final subjectController = TextEditingController();
    String? selectedFileType = 'PDF';
    String? selectedSubject = 'Computer Science';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upload Document',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select file type:'),
                    Wrap(
                      spacing: 8,
                      children: ['PDF', 'DOCX', 'JPEG', 'PNG'].map((type) {
                        return ChoiceChip(
                          label: Text(type),
                          selected: selectedFileType == type,
                          onSelected: (selected) {
                            setState(() {
                              selectedFileType = type;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select subject:'),
                    DropdownButtonFormField<String>(
                      initialValue: selectedSubject,
                      items: const [
                        DropdownMenuItem(
                          value: 'Computer Science',
                          child: Text('Computer Science'),
                        ),
                        DropdownMenuItem(
                          value: 'Mathematics',
                          child: Text('Mathematics'),
                        ),
                        DropdownMenuItem(
                          value: 'Physics',
                          child: Text('Physics'),
                        ),
                        DropdownMenuItem(
                          value: 'Economics',
                          child: Text('Economics'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSubject = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Choose subject',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Document Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _pickStudentFile,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedStudentFile != null
                                ? Colors.blue
                                : Colors.grey,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: _selectedStudentFile != null
                            ? Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 48,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      _selectedStudentFile!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${(_selectedStudentFile!.size / 1024).toStringAsFixed(2)} KB',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    TextButton(
                                      onPressed: _pickStudentFile,
                                      child: const Text('Change File'),
                                    ),
                                  ],
                                ),
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text('Tap to select file'),
                                  Text(
                                    'Supports: PDF, DOC, DOCX, JPG, JPEG, PNG',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _selectedStudentFile = null;
                                _selectedStudentFilePath = null;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (titleController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a title'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              if (_selectedStudentFile == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a file'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Document uploaded successfully!',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Add to pending submissions
                              setState(() {
                                _pendingSubmissions.add({
                                  'id': '${_pendingSubmissions.length + 1}',
                                  'title': titleController.text,
                                  'subject': selectedSubject!,
                                  'date': DateTime.now().toString().split(
                                    ' ',
                                  )[0],
                                  'status': 'Pending Review',
                                  'fileSize':
                                      '${(_selectedStudentFile!.size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                  'filePath': _selectedStudentFilePath,
                                });

                                // Reset file selection
                                _selectedStudentFile = null;
                                _selectedStudentFilePath = null;
                              });
                            },
                            child: const Text('Upload'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _openMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext sheetContext) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: MediaQuery.of(sheetContext).size.height * 0.8,
          child: Column(
            children: [
              const Text(
                'Messages to Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    MessageBubble(
                      text: 'When will my paper be reviewed?',
                      isMe: true,
                      time: '10:30 AM',
                    ),
                    MessageBubble(
                      text:
                          'Your paper is in the queue, will be reviewed within 24 hours.',
                      isMe: false,
                      time: '10:35 AM',
                    ),
                    MessageBubble(
                      text: 'Can I submit a revised version?',
                      isMe: true,
                      time: 'Yesterday',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your message to admin...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotificationItem(
                      'Your paper has been approved!',
                      '2 hours ago',
                      Icons.check_circle,
                      Colors.green,
                    ),
                    _buildNotificationItem(
                      'New comment on your submission',
                      '5 hours ago',
                      Icons.comment,
                      Colors.blue,
                    ),
                    _buildNotificationItem(
                      'Reminder: Assignment due tomorrow',
                      '1 day ago',
                      Icons.notifications_active,
                      Colors.orange,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All notifications marked as read'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Mark All as Read'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(
    String title,
    String time,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(time),
      trailing: IconButton(
        icon: const Icon(Icons.close, size: 16),
        onPressed: () {},
      ),
      onTap: () {},
    );
  }

  void _showPaperDetails(Map<String, dynamic> paper) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(paper['title']),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Subject: ${paper['subject']}'),
                const SizedBox(height: 10),
                Text('Submitted: ${paper['date']}'),
                const SizedBox(height: 10),
                Text('Status: ${paper['status']}'),
                const SizedBox(height: 10),
                if (paper['grade'] != null) Text('Grade: ${paper['grade']}'),
                if (paper['feedback'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text('Feedback:'),
                      Text(paper['feedback']),
                    ],
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadPaper(paper);
                Navigator.pop(context);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _downloadPaper(Map<String, dynamic> paper) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading ${paper['title']}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _generateExercises() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Generating exercises...'),
        duration: Duration(seconds: 2),
      ),
    );

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _exercises.insert(0, {
          'id': '${_exercises.length + 1}',
          'title': 'New ${_selectedSubjects.first} Exercise',
          'subject': _selectedSubjects.first,
          'date': 'Just now',
          'completed': false,
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Exercises generated successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void _showExerciseDetails(Map<String, dynamic> exercise) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(exercise['title']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Subject: ${exercise['subject']}'),
              const SizedBox(height: 10),
              Text('Generated: ${exercise['date']}'),
              const SizedBox(height: 10),
              const Text('Exercise Content:'),
              const SizedBox(height: 10),
              const Text(
                '1. Solve the following problems:\n2. Explain the concepts:\n3. Apply to real-world scenarios:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                _downloadExercise(exercise);
                Navigator.pop(context);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  void _markExerciseCompleted(String id) {
    setState(() {
      final index = _exercises.indexWhere((e) => e['id'] == id);
      if (index != -1) {
        _exercises[index]['completed'] = true;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exercise marked as completed!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _downloadExercise(Map<String, dynamic> exercise) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading ${exercise['title']}...'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showSubmissionHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Submission History'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView(
              children: [
                ..._approvedPapers.map(
                  (paper) => ListTile(
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    title: Text(paper['title']),
                    subtitle: Text('${paper['date']} • ${paper['grade']}'),
                  ),
                ),
                ..._pendingSubmissions.map(
                  (paper) => ListTile(
                    leading: const Icon(Icons.pending, color: Colors.orange),
                    title: Text(paper['title']),
                    subtitle: Text('${paper['date']} • ${paper['status']}'),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showHelpSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help & Support'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('FAQs'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.contact_support),
                title: const Text('Contact Support'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Send Feedback'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {},
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  IconData _getSubjectIcon(String subject) {
    switch (subject) {
      case 'Computer Science':
        return Icons.computer;
      case 'Physics':
        return Icons.science;
      case 'Economics':
        return Icons.bar_chart;
      default:
        return Icons.book;
    }
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isMe) const CircleAvatar(child: Icon(Icons.person)),
          if (!isMe) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[50] : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, maxLines: 3, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 8),
          if (isMe) const CircleAvatar(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}
