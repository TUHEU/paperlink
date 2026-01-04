import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io'; // 🔥 ADD THIS
import 'package:image_picker/image_picker.dart'; // 🔥 ADD THIS

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

// 🔥 STORAGE MANAGER FOR IMAGES
class ImageStorageManager {
  static final ImageStorageManager _instance = ImageStorageManager._internal();

  factory ImageStorageManager() {
    return _instance;
  }

  ImageStorageManager._internal();

  // Store images with their paper IDs
  Map<String, File> _imageStorage = {};
  Map<String, String> _imagePaths = {};

  // Store image
  void storeImage(String paperId, File imageFile) {
    _imageStorage[paperId] = imageFile;
    _imagePaths[paperId] = imageFile.path;
  }

  // Get image
  File? getImage(String paperId) {
    return _imageStorage[paperId];
  }

  // Get image path
  String? getImagePath(String paperId) {
    return _imagePaths[paperId];
  }

  // Remove image
  void removeImage(String paperId) {
    _imageStorage.remove(paperId);
    _imagePaths.remove(paperId);
  }

  // Check if image exists
  bool hasImage(String paperId) {
    return _imageStorage.containsKey(paperId);
  }
}

// 🔥 GLOBAL DATA MANAGEMENT
class PaperDataManager {
  static final PaperDataManager _instance = PaperDataManager._internal();

  factory PaperDataManager() {
    return _instance;
  }

  PaperDataManager._internal();

  // Image storage manager
  final ImageStorageManager imageStorage = ImageStorageManager();

  // 🔥 SHARED PAPERS LIST - Both Admin and Student can access
  List<Map<String, dynamic>> allPapers = [
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
          'This paper explores the fundamentals of machine learning algorithms.',
      'uploadedBy': 'student',
      'isPublic': false,
      'hasImage': true,
    },
    {
      'id': '2',
      'title': 'Quantum Physics Research',
      'studentId': 'STU2024002',
      'studentName': 'Jane Smith',
      'subject': 'Physics',
      'date': '2024-01-10',
      'fileSize': '8MB',
      'status': 'approved',
      'fileType': 'PDF',
      'abstract': 'Research on quantum mechanics principles.',
      'grade': 'A',
      'feedback': 'Excellent research work',
      'uploadedBy': 'student',
      'isPublic': true,
      'hasImage': true,
    },
    {
      'id': '3',
      'title': 'Advanced Mathematics Paper',
      'studentId': 'ADMIN',
      'studentName': 'Admin Fahdil',
      'subject': 'Mathematics',
      'date': '2024-01-20',
      'fileSize': '5MB',
      'status': 'approved',
      'fileType': 'PDF',
      'abstract': 'Admin uploaded mathematics paper for students.',
      'grade': 'A',
      'feedback': 'Uploaded by admin',
      'uploadedBy': 'admin',
      'isPublic': true,
      'hasImage': true,
    },
  ];

  // 🔥 NOTIFICATIONS FOR ADMIN
  List<Map<String, dynamic>> adminNotifications = [
    {
      'id': '1',
      'title': 'New Paper Submission',
      'message': 'John Doe submitted "Introduction to Machine Learning"',
      'time': '2 hours ago',
      'read': false,
    },
  ];

  // 🔥 Add new paper
  void addPaper(Map<String, dynamic> paper, {File? imageFile}) {
    allPapers.add(paper);
    if (imageFile != null) {
      imageStorage.storeImage(paper['id'], imageFile);
    }
  }

  // 🔥 Update paper status
  void updatePaperStatus(
    String paperId,
    String status, {
    String? grade,
    String? feedback,
  }) {
    final index = allPapers.indexWhere((paper) => paper['id'] == paperId);
    if (index != -1) {
      allPapers[index]['status'] = status;
      if (grade != null) {
        allPapers[index]['grade'] = grade;
      }
      if (feedback != null) {
        allPapers[index]['feedback'] = feedback;
      }
      if (status == 'approved') {
        allPapers[index]['isPublic'] = true;
      }
    }
  }

  // 🔥 Add notification for admin
  void addNotification(String title, String message) {
    adminNotifications.insert(0, {
      'id': 'NT${DateTime.now().millisecondsSinceEpoch}',
      'title': title,
      'message': message,
      'time': 'Just now',
      'read': false,
    });
  }

  // 🔥 Get pending papers
  List<Map<String, dynamic>> getPendingPapers() {
    return allPapers.where((paper) => paper['status'] == 'pending').toList();
  }

  // 🔥 Get approved papers (public)
  List<Map<String, dynamic>> getApprovedPapers() {
    return allPapers.where((paper) => paper['status'] == 'approved').toList();
  }

  // 🔥 Get all public papers
  List<Map<String, dynamic>> getPublicPapers() {
    return allPapers.where((paper) => paper['isPublic'] == true).toList();
  }

  // 🔥 Remove paper completely
  void removePaper(String paperId) {
    allPapers.removeWhere((paper) => paper['id'] == paperId);
    imageStorage.removeImage(paperId);
  }

  // 🔥 Get image for paper
  File? getPaperImage(String paperId) {
    return imageStorage.getImage(paperId);
  }

  // 🔥 Check if paper has image
  bool paperHasImage(String paperId) {
    return imageStorage.hasImage(paperId);
  }
}

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final PaperDataManager _dataManager = PaperDataManager();

  // 🔥 FILE PICKER STATE FOR ADMIN
  File? _selectedAdminFile;
  final ImagePicker _picker = ImagePicker();

  // 🔥 FUNCTION TO PICK FILE FOR ADMIN
  Future<void> _pickAdminFile(ImageSource source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (file != null) {
      setState(() {
        _selectedAdminFile = File(file.path);
      });
    }
  }

  void _acceptPaper(String paperId, String grade, String feedback) {
    setState(() {
      _dataManager.updatePaperStatus(
        paperId,
        'approved',
        grade: grade,
        feedback: feedback,
      );
    });
  }

  void _rejectPaper(String paperId, String reason) {
    setState(() {
      final index = _dataManager.allPapers.indexWhere(
        (paper) => paper['id'] == paperId,
      );
      if (index != -1) {
        _dataManager.allPapers[index]['status'] = 'rejected';
        _dataManager.allPapers[index]['rejectionReason'] = reason;
        _dataManager.allPapers[index]['reviewedDate'] = DateTime.now()
            .toString()
            .split(' ')[0];
      }
    });
  }

  // 🔥 REMOVE PAPER COMPLETELY (EVEN IF APPROVED)
  void _removePaper(String paperId) {
    setState(() {
      _dataManager.removePaper(paperId);
    });
  }

  void _uploadPaperAsAdmin(Map<String, dynamic> paperData) {
    setState(() {
      final newPaper = {
        ...paperData,
        'id': 'ADM${DateTime.now().millisecondsSinceEpoch}',
        'uploadedBy': 'Admin Fahdil',
        'uploadDate': DateTime.now().toString().split(' ')[0],
        'status': 'approved',
        'isPublic': true,
        'grade': 'A',
        'feedback': 'Uploaded by admin',
        'hasImage': _selectedAdminFile != null,
      };

      _dataManager.addPaper(newPaper, imageFile: _selectedAdminFile);
      _dataManager.addNotification(
        'Admin Upload',
        'Admin uploaded "${paperData['title']}"',
      );
    });

    // Reset file selection
    setState(() {
      _selectedAdminFile = null;
    });
  }

  // 🔥 MARK NOTIFICATION AS READ
  void _markNotificationAsRead(String notificationId) {
    setState(() {
      final index = _dataManager.adminNotifications.indexWhere(
        (notification) => notification['id'] == notificationId,
      );
      if (index != -1) {
        _dataManager.adminNotifications[index]['read'] = true;
      }
    });
  }

  // 🔥 GET UNREAD NOTIFICATIONS COUNT
  int getUnreadNotificationsCount() {
    return _dataManager.adminNotifications
        .where((n) => n['read'] == false)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final pendingPapers = _dataManager.getPendingPapers();
    final approvedPapers = _dataManager.getApprovedPapers();
    final unreadCount = getUnreadNotificationsCount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Management'),
        actions: [
          // 🔥 NOTIFICATION BELL WITH BADGE
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => _showNotifications(context),
                tooltip: 'Notifications',
              ),
              if (unreadCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
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
                    icon: Icons.notifications,
                    title: 'Notifications',
                    color: Colors.red,
                    count: unreadCount,
                    onTap: () {
                      _showNotifications(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.upload_file,
                    title: 'Upload Paper',
                    color: Colors.purple,
                    onTap: () {
                      _showAdminUploadDialog(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.analytics,
                    title: 'Analytics',
                    color: Colors.teal,
                    onTap: () {
                      _showAnalyticsScreen(context);
                    },
                  ),
                  _buildAdminFeatureCard(
                    icon: Icons.delete,
                    title: 'Manage Files',
                    color: Colors.red,
                    onTap: () {
                      _showFileManagementScreen(context);
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
    final pendingPapers = _dataManager.getPendingPapers();

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
                          'Paper "${paper['title']}" approved with grade $selectedGrade',
                        ),
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      ),
                    );

                    // 🔥 ADD NOTIFICATION
                    _dataManager.addNotification(
                      'Paper Approved',
                      'You approved "${paper['title']}" with grade $selectedGrade',
                    );

                    setState(() {});
                  },
                  child: const Text('Approve Paper'),
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

                // 🔥 ADD NOTIFICATION
                _dataManager.addNotification(
                  'Paper Rejected',
                  'You rejected "${paper['title']}"',
                );

                setState(() {});
              },
              child: const Text('Reject Paper'),
            ),
          ],
        );
      },
    );
  }

  void _viewPaperDetails(BuildContext context, Map<String, dynamic> paper) {
    final hasImage = _dataManager.paperHasImage(paper['id']);
    final imageFile = _dataManager.getPaperImage(paper['id']);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          paper['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔥 IMAGE PREVIEW SECTION
                  if (hasImage && imageFile != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Uploaded Image:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.broken_image,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10),
                                    Text('Unable to load image'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                  // Paper Details
                  const Text(
                    'Paper Details:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  _buildDetailRow('Student:', paper['studentName']),
                  _buildDetailRow('Student ID:', paper['studentId']),
                  _buildDetailRow('Subject:', paper['subject']),
                  _buildDetailRow('Submitted:', paper['date']),
                  _buildDetailRow('File Size:', paper['fileSize']),
                  _buildDetailRow('Format:', paper['fileType']),
                  _buildDetailRow('Status:', paper['status']),

                  if (paper['grade'] != null)
                    _buildDetailRow('Grade:', paper['grade']),

                  const SizedBox(height: 20),

                  const Text(
                    'Abstract:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(paper['abstract'] ?? 'No abstract available'),

                  if (paper['feedback'] != null &&
                      paper['feedback'].isNotEmpty) ...[
                    const SizedBox(height: 20),
                    const Text(
                      'Feedback:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(paper['feedback']),
                  ],

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  void _showApprovedPapersScreen(BuildContext context) {
    final approvedPapers = _dataManager.getApprovedPapers();

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
                'Approved Papers (Public)',
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
    final hasImage = _dataManager.paperHasImage(paper['id']);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Stack(
          children: [
            const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
            if (hasImage)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 12, color: Colors.white),
                ),
              ),
          ],
        ),
        title: Text(
          paper['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Student: ${paper['studentName']} (${paper['studentId']})'),
            Text('Subject: ${paper['subject']}'),
            Text('Date: ${paper['date']} • Grade: ${paper['grade'] ?? 'N/A'}'),
            if (paper['feedback'] != null && paper['feedback'].isNotEmpty)
              Text('Feedback: ${paper['feedback']}'),
            Wrap(
              spacing: 4,
              children: [
                Chip(
                  label: const Text('Public'),
                  backgroundColor: Colors.green[100],
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                if (hasImage)
                  Chip(
                    label: const Text('Has Image'),
                    backgroundColor: Colors.blue[100],
                    labelStyle: const TextStyle(fontSize: 10),
                  ),
              ],
            ),
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
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteApprovedPaperDialog(context, paper);
              },
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteApprovedPaperDialog(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Approved Paper'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to delete "${paper['title']}"?'),
              const SizedBox(height: 10),
              const Text(
                '⚠️ This action cannot be undone. The paper will be permanently removed from the system.',
                style: TextStyle(color: Colors.red, fontSize: 12),
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
                _removePaper(paper['id']);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Paper "${paper['title']}" deleted permanently',
                    ),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );

                // 🔥 ADD NOTIFICATION
                _dataManager.addNotification(
                  'Paper Deleted',
                  'You deleted "${paper['title']}" from the system',
                );

                setState(() {});
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete Permanently'),
            ),
          ],
        );
      },
    );
  }

  void _viewApprovedPaperDetails(
    BuildContext context,
    Map<String, dynamic> paper,
  ) {
    final hasImage = _dataManager.paperHasImage(paper['id']);
    final imageFile = _dataManager.getPaperImage(paper['id']);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          paper['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔥 IMAGE PREVIEW SECTION
                  if (hasImage && imageFile != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Uploaded Image Content:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 350,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.broken_image,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Unable to load image'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                  // Paper Details
                  const Text(
                    'Paper Details:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  _buildDetailRow('Student:', paper['studentName']),
                  _buildDetailRow('Student ID:', paper['studentId']),
                  _buildDetailRow('Subject:', paper['subject']),
                  _buildDetailRow('Submitted:', paper['date']),
                  _buildDetailRow(
                    'Approved on:',
                    paper['reviewedDate'] ?? 'N/A',
                  ),
                  _buildDetailRow('Grade:', paper['grade'] ?? 'N/A'),
                  _buildDetailRow('File Size:', paper['fileSize']),

                  const SizedBox(height: 20),

                  if (paper['feedback'] != null &&
                      paper['feedback'].isNotEmpty) ...[
                    const Text(
                      'Feedback:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(paper['feedback']),
                    const SizedBox(height: 20),
                  ],

                  const Text(
                    'Abstract:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(paper['abstract'] ?? 'No abstract available'),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.public, color: Colors.green, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'This paper is publicly available to all students',
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _downloadPaper(paper);
                          },
                          child: const Text('Download'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showDeleteApprovedPaperDialog(context, paper);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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

  void _showNotifications(BuildContext context) {
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
                'Admin Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _dataManager.adminNotifications.isEmpty
                    ? const Center(
                        child: Text(
                          'No notifications',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _dataManager.adminNotifications.length,
                        itemBuilder: (context, index) {
                          final notification =
                              _dataManager.adminNotifications[index];
                          return _buildNotificationItem(notification, context);
                        },
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Mark all as read
                  for (var notification in _dataManager.adminNotifications) {
                    notification['read'] = true;
                  }
                  setState(() {});
                  Navigator.pop(context);
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
    Map<String, dynamic> notification,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: notification['read'] ? Colors.white : Colors.blue[50],
      child: ListTile(
        leading: notification['read']
            ? const Icon(Icons.notifications_none, color: Colors.grey)
            : const Icon(Icons.notifications_active, color: Colors.blue),
        title: Text(
          notification['title'],
          style: TextStyle(
            fontWeight: notification['read']
                ? FontWeight.normal
                : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['message']),
            const SizedBox(height: 4),
            Text(
              notification['time'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: notification['read']
            ? null
            : IconButton(
                icon: const Icon(Icons.check, size: 20),
                onPressed: () {
                  _markNotificationAsRead(notification['id']);
                },
                tooltip: 'Mark as read',
              ),
        onTap: () {
          _markNotificationAsRead(notification['id']);
        },
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

                    // 🔥 FILE PICKER SECTION
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _selectedAdminFile == null
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text('No file selected'),
                                  Text(
                                    'Select an image to upload',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: Image.file(
                                    _selectedAdminFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _selectedAdminFile!.path.split('/').last,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 12),

                    // 🔥 CAMERA/GALLERY BUTTONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _pickAdminFile(ImageSource.camera),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _pickAdminFile(ImageSource.gallery),
                          icon: const Icon(Icons.photo),
                          label: const Text('Gallery'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
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

                              if (_selectedAdminFile == null) {
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
                                    '${_selectedAdminFile!.lengthSync() ~/ 1024}KB',
                                'date': DateTime.now().toString().split(' ')[0],
                                'studentId': 'ADMIN',
                                'studentName': 'Admin Fahdil',
                                'abstract':
                                    descriptionController.text.isNotEmpty
                                    ? descriptionController.text
                                    : 'Paper uploaded by admin',
                              };

                              _uploadPaperAsAdmin(paperData);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Paper uploaded and published publicly!',
                                  ),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            child: const Text('Upload & Publish'),
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

  void _showFileManagementScreen(BuildContext context) {
    final approvedPapers = _dataManager.getApprovedPapers();

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
                'File Management',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Manage and delete approved papers',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: approvedPapers.isEmpty
                    ? const Center(
                        child: Text(
                          'No approved papers to manage',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: approvedPapers.length,
                        itemBuilder: (context, index) {
                          final paper = approvedPapers[index];
                          return _buildFileManagementItem(paper, context);
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

  Widget _buildFileManagementItem(
    Map<String, dynamic> paper,
    BuildContext context,
  ) {
    final hasImage = _dataManager.paperHasImage(paper['id']);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: hasImage
            ? const Icon(Icons.image, color: Colors.blue, size: 40)
            : const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
        title: Text(
          paper['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('By: ${paper['studentName']}'),
            Text('Subject: ${paper['subject']}'),
            Text('Date: ${paper['date']} • Size: ${paper['fileSize']}'),
            Wrap(
              spacing: 4,
              children: [
                Chip(
                  label: Text(paper['status']),
                  backgroundColor: Colors.green[100],
                  labelStyle: const TextStyle(fontSize: 10),
                ),
                if (hasImage)
                  Chip(
                    label: const Text('Has Image'),
                    backgroundColor: Colors.blue[100],
                    labelStyle: const TextStyle(fontSize: 10),
                  ),
              ],
            ),
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
              tooltip: 'View',
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteApprovedPaperDialog(context, paper);
              },
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  void _showAnalyticsScreen(BuildContext context) {
    final pendingPapers = _dataManager.getPendingPapers();
    final approvedPapers = _dataManager.getApprovedPapers();
    final publicPapers = _dataManager.getPublicPapers();

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
                  'Total Papers',
                  '${_dataManager.allPapers.length}',
                ),
                _buildAnalyticsItem(
                  'Papers Pending Review',
                  '${pendingPapers.length}',
                ),
                _buildAnalyticsItem(
                  'Papers Approved',
                  '${approvedPapers.length}',
                ),
                _buildAnalyticsItem('Public Papers', '${publicPapers.length}'),
                _buildAnalyticsItem(
                  'Papers with Images',
                  '${_dataManager.allPapers.where((p) => p['hasImage'] == true).length}',
                ),
                _buildAnalyticsItem(
                  'Admin Notifications',
                  '${_dataManager.adminNotifications.length}',
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Approved papers are automatically published and available to all students',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
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
}

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
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

  // 🔥 FILE PICKER STATE FOR STUDENT
  File? _selectedStudentFile;
  final ImagePicker _studentPicker = ImagePicker();

  // 🔥 DATA MANAGER
  final PaperDataManager _dataManager = PaperDataManager();

  // 🔥 FUNCTION TO PICK FILE FOR STUDENT
  Future<void> _pickStudentFile(ImageSource source) async {
    final XFile? file = await _studentPicker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (file != null) {
      setState(() {
        _selectedStudentFile = File(file.path);
      });
    }
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🔥 GET USER'S PENDING SUBMISSIONS
    final userPendingSubmissions = _dataManager.allPapers
        .where(
          (paper) =>
              paper['status'] == 'pending' && paper['studentId'] == 'STU001',
        )
        .toList();

    // 🔥 GET PUBLIC PAPERS (APPROVED PAPERS)
    final publicPapers = _dataManager.getPublicPapers();

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
                // 🔥 SHOW BADGE IF USER HAS PENDING PAPERS
                if (userPendingSubmissions.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        userPendingSubmissions.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
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
          return _buildBody(index, userPendingSubmissions, publicPapers);
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
                label: 'Public Papers',
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

  Widget _buildBody(
    int index,
    List<Map<String, dynamic>> pendingSubmissions,
    List<Map<String, dynamic>> publicPapers,
  ) {
    switch (index) {
      case 0:
        return _buildDashboard(pendingSubmissions, publicPapers);
      case 1:
        return _buildPublicPapersList(publicPapers);
      case 2:
        return _buildAIExercises();
      case 3:
        return _buildProfile(pendingSubmissions);
      default:
        return _buildDashboard(pendingSubmissions, publicPapers);
    }
  }

  Widget _buildDashboard(
    List<Map<String, dynamic>> pendingSubmissions,
    List<Map<String, dynamic>> publicPapers,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickStats(pendingSubmissions, publicPapers),
          const SizedBox(height: 24),
          if (pendingSubmissions.isNotEmpty) ...[
            _buildPendingSubmissions(pendingSubmissions),
            const SizedBox(height: 24),
          ],
          _buildPublicPapersPreview(publicPapers),
          const SizedBox(height: 24),
          _buildAIExerciseCard(),
        ],
      ),
    );
  }

  Widget _buildQuickStats(
    List<Map<String, dynamic>> pendingSubmissions,
    List<Map<String, dynamic>> publicPapers,
  ) {
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
            Icons.pending,
            '${pendingSubmissions.length}',
            'Pending',
            Colors.orange,
          ),
          _buildStatItem(
            Icons.check_circle,
            '${publicPapers.length}',
            'Approved',
            Colors.green,
          ),
          _buildStatItem(
            Icons.upload_file,
            '${pendingSubmissions.length + publicPapers.where((p) => p['studentId'] == 'STU001').length}',
            'My Uploads',
            Colors.blue,
          ),
          _buildStatItem(
            Icons.public,
            '${publicPapers.length}',
            'Public Papers',
            Colors.purple,
          ),
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

  Widget _buildPendingSubmissions(
    List<Map<String, dynamic>> pendingSubmissions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Pending Submissions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...pendingSubmissions.map(
          (paper) => _buildPaperCard(paper, isPending: true),
        ),
      ],
    );
  }

  Widget _buildPublicPapersPreview(List<Map<String, dynamic>> publicPapers) {
    final recentPapers = publicPapers.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Public Papers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _selectedIndex.value = 1,
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (recentPapers.isEmpty)
          const Center(
            child: Text(
              'No public papers available yet',
              style: TextStyle(color: Colors.grey),
            ),
          )
        else
          ...recentPapers.map((paper) => _buildPaperCard(paper)),
      ],
    );
  }

  Widget _buildPaperCard(Map<String, dynamic> paper, {bool isPending = false}) {
    final hasImage = _dataManager.paperHasImage(paper['id']);

    return GestureDetector(
      onTap: () {
        _showPaperDetails(paper);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Stack(
            children: [
              Container(
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
              if (hasImage)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
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
              Text('Subject: ${paper['subject']}'),
              const SizedBox(height: 4),
              Text(
                'By: ${paper['studentName']} • ${paper['date']}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              if (paper['grade'] != null)
                Text(
                  'Grade: ${paper['grade']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
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
              isPending ? 'Pending' : 'Public',
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

  Widget _buildPublicPapersList(List<Map<String, dynamic>> publicPapers) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: publicPapers.length,
      itemBuilder: (context, index) {
        final paper = publicPapers[index];
        final hasImage = _dataManager.paperHasImage(paper['id']);

        return GestureDetector(
          onTap: () {
            _showPaperDetails(paper);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Stack(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red, size: 35),
                  if (hasImage)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.image,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
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
                  Text('Subject: ${paper['subject']}'),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    children: [
                      if (paper['grade'] != null)
                        Chip(
                          label: Text('Grade: ${paper['grade']}'),
                          backgroundColor: Colors.green[50],
                          labelStyle: const TextStyle(fontSize: 12),
                        ),
                      Chip(
                        label: const Text('Public'),
                        backgroundColor: Colors.blue[50],
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                      if (hasImage)
                        Chip(
                          label: const Text('Has Image'),
                          backgroundColor: Colors.purple[50],
                          labelStyle: const TextStyle(fontSize: 12),
                        ),
                      if (paper['uploadedBy'] == 'admin')
                        Chip(
                          label: const Text('Admin'),
                          backgroundColor: Colors.orange[50],
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

  Widget _buildProfile(List<Map<String, dynamic>> pendingSubmissions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            'Student Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'ID: STU001',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 32),

          // Pending submissions status
          if (pendingSubmissions.isNotEmpty) ...[
            Card(
              color: Colors.orange[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.pending, color: Colors.orange),
                        SizedBox(width: 10),
                        Text(
                          'Pending Submissions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'You have ${pendingSubmissions.length} paper(s) waiting for admin approval',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],

          _buildProfileMenuItem(Icons.history, 'My Submission History', () {
            _showSubmissionHistory(context);
          }),
          _buildProfileMenuItem(
            Icons.library_books,
            'Browse Public Papers',
            () {
              _selectedIndex.value = 1;
            },
          ),
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
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description/Abstract (Optional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🔥 FILE PICKER SECTION
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _selectedStudentFile == null
                          ? const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text('No file selected'),
                                  Text(
                                    'Select an image to upload',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: Image.file(
                                    _selectedStudentFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _selectedStudentFile!.path.split('/').last,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 12),

                    // 🔥 CAMERA/GALLERY BUTTONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _pickStudentFile(ImageSource.camera),
                          icon: const Icon(Icons.camera_alt),
                          label: const Text('Camera'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () =>
                              _pickStudentFile(ImageSource.gallery),
                          icon: const Icon(Icons.photo),
                          label: const Text('Gallery'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
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

                              // 🔥 CREATE NEW PAPER WITH PENDING STATUS
                              final newPaper = {
                                'id':
                                    'STU${DateTime.now().millisecondsSinceEpoch}',
                                'title': titleController.text,
                                'subject': selectedSubject!,
                                'fileType': selectedFileType!,
                                'description': descriptionController.text,
                                'fileSize':
                                    '${_selectedStudentFile!.lengthSync() ~/ 1024}KB',
                                'date': DateTime.now().toString().split(' ')[0],
                                'studentId': 'STU001',
                                'studentName': 'Current Student',
                                'abstract':
                                    descriptionController.text.isNotEmpty
                                    ? descriptionController.text
                                    : 'Paper submitted by student',
                                'status': 'pending',
                                'uploadedBy': 'student',
                                'isPublic': false,
                                'hasImage': true,
                              };

                              // 🔥 ADD TO GLOBAL DATA MANAGER WITH IMAGE
                              _dataManager.addPaper(
                                newPaper,
                                imageFile: _selectedStudentFile,
                              );

                              // 🔥 ADD NOTIFICATION FOR ADMIN
                              _dataManager.addNotification(
                                'New Paper Submission',
                                'Student submitted "${titleController.text}" for review',
                              );

                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Paper submitted successfully! It will be reviewed by admin.',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Reset file selection
                              setState(() {
                                _selectedStudentFile = null;
                              });

                              // Update UI
                              setState(() {});
                            },
                            child: const Text('Submit for Review'),
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
    final userPendingSubmissions = _dataManager.allPapers
        .where(
          (paper) =>
              paper['status'] == 'pending' && paper['studentId'] == 'STU001',
        )
        .toList();

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
                'My Submissions Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: userPendingSubmissions.isEmpty
                    ? const Center(
                        child: Text(
                          'No pending submissions',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView(
                        children: userPendingSubmissions.map((paper) {
                          return ListTile(
                            leading: const Icon(
                              Icons.pending,
                              color: Colors.orange,
                            ),
                            title: Text(paper['title']),
                            subtitle: Text('Submitted: ${paper['date']}'),
                            trailing: Chip(
                              label: const Text('Pending'),
                              backgroundColor: Colors.orange[100],
                            ),
                          );
                        }).toList(),
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showUploadDialog();
                },
                child: const Text('Submit New Paper'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPaperDetails(Map<String, dynamic> paper) {
    final hasImage = _dataManager.paperHasImage(paper['id']);
    final imageFile = _dataManager.getPaperImage(paper['id']);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          paper['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔥 IMAGE PREVIEW SECTION - Students can see approved paper images
                  if (hasImage &&
                      imageFile != null &&
                      paper['status'] == 'approved')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Uploaded Image Content:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 350,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.broken_image,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Unable to load image'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                  // 🔥 FOR PENDING PAPERS, SHOW UPLOADED IMAGE (ONLY OWNER CAN SEE)
                  if (hasImage &&
                      imageFile != null &&
                      paper['status'] == 'pending' &&
                      paper['studentId'] == 'STU001')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your Uploaded Image:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.broken_image,
                                        size: 60,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Unable to load image'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'This image is only visible to you until the paper is approved',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),

                  // Paper Details
                  const Text(
                    'Paper Details:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  _buildDetailRow('By:', paper['studentName']),
                  _buildDetailRow('Student ID:', paper['studentId']),
                  _buildDetailRow('Subject:', paper['subject']),
                  _buildDetailRow('Submitted:', paper['date']),
                  _buildDetailRow('Status:', paper['status']),
                  _buildDetailRow('File Size:', paper['fileSize']),

                  if (paper['grade'] != null)
                    _buildDetailRow('Grade:', paper['grade']),

                  if (paper['feedback'] != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Feedback:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(paper['feedback']),
                      ],
                    ),

                  const SizedBox(height: 20),

                  const Text(
                    'Abstract:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(paper['abstract'] ?? 'No abstract available'),

                  const SizedBox(height: 20),

                  if (paper['isPublic'] == true)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.public, color: Colors.green, size: 16),
                          SizedBox(width: 8),
                          Text(
                            'This paper is publicly available',
                            style: TextStyle(fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _downloadPaper(paper);
                            Navigator.pop(context);
                          },
                          child: const Text('Download'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
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
        duration: const Duration(seconds: 2),
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
    final userPapers = _dataManager.allPapers
        .where((paper) => paper['studentId'] == 'STU001')
        .toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('My Submission History'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView(
              children: [
                if (userPapers.isEmpty)
                  const Center(
                    child: Text(
                      'No submissions yet',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                else
                  ...userPapers.map(
                    (paper) => ListTile(
                      leading: Icon(
                        paper['status'] == 'approved'
                            ? Icons.check_circle
                            : Icons.pending,
                        color: paper['status'] == 'approved'
                            ? Colors.green
                            : Colors.orange,
                      ),
                      title: Text(paper['title']),
                      subtitle: Text(
                        '${paper['date']} • ${paper['status']} • ${paper['grade'] ?? ''}',
                      ),
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
