import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/accounts/account_screens_app_bar.dart';
import '../../components/layouts/main_layout.dart';

class HelpAndSupportScreen extends StatelessWidget {
  static const kRouteName = '/help-and-support';
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MainLayout(
      body: CustomScrollView(
        slivers: [
          AccountScreensAppBar(title: 'Help & Support'),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose a support option below',
                  style: TextStyle(
                    color: theme.hintColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),

                // Support Options
                _buildSupportCard(
                  context,
                  icon: Icons.question_answer_rounded,
                  title: 'FAQ Center',
                  subtitle: 'Find answers to common questions',
                  color: Colors.blue,
                  onTap: () => _navigateToFAQ(context),
                ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1),

                _buildSupportCard(
                  context,
                  icon: Icons.chat_bubble_outline,
                  title: 'Live Chat',
                  subtitle: 'Chat with our support team in real-time',
                  color: Colors.green,
                  onTap: () => _showComingSoon(context, 'Live Chat'),
                ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1),

                _buildSupportCard(
                  context,
                  icon: Icons.email_outlined,
                  title: 'Email Support',
                  subtitle: 'Send us an email and we\'ll get back to you',
                  color: Colors.orange,
                  onTap: () => _showComingSoon(context, 'Email Support'),
                ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.1),

                _buildSupportCard(
                  context,
                  icon: Icons.phone_in_talk_outlined,
                  title: 'Call Support',
                  subtitle: 'Talk directly to our support team',
                  color: Colors.purple,
                  onTap: () => _showComingSoon(context, 'Call Support'),
                ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),

                const SizedBox(height: 32),

                // Contact Info
                _buildContactCard(context),

                const SizedBox(height: 24),

                // Support Hours
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'We\'re here for you ',
                          style: TextStyle(
                            color: theme.hintColor,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: '24/7',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: ' 💙'),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor.withValues(alpha: 0.05),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CONTACT INFORMATION',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).hintColor,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildContactRow(
              context,
              icon: Icons.email_rounded,
              title: 'Email',
              value: 'support@hermesharbor.com',
              onTap: () => _launchEmail(context, 'support@hermesharbor.com'),
            ),
            const Divider(height: 24),
            _buildContactRow(
              context,
              icon: Icons.phone_rounded,
              title: 'Phone',
              value: '+1 (555) 123-4567',
              onTap: () => _callNumber(context, '+15551234567'),
            ),
            const Divider(height: 24),
            _buildContactRow(
              context,
              icon: Icons.location_on_rounded,
              title: 'Address',
              value: '123 Fashion Ave, New York, NY 10001',
              onTap: () => _openMaps(context, '123 Fashion Ave, New York'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Methods
  void _navigateToFAQ(BuildContext context) {
    // Implement FAQ navigation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('FAQ Center coming soon!')),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature coming soon!')),
    );
  }

  void _launchEmailSupport(BuildContext context) {
    // final Uri emailLaunchUri = Uri(
    //   scheme: 'mailto',
    //   path: 'support@hermesharbor.com',
    //   queryParameters: {'subject': 'Support Request'},
    // );
    // launchUrl(emailLaunchUri);
  }

  void _callSupport(BuildContext context) {
    // launchUrl(Uri.parse('tel:+15551234567'));
  }

  void _launchEmail(BuildContext context, String email) {
    // launchUrl(Uri.parse('mailto:$email'));
  }

  void _callNumber(BuildContext context, String phoneNumber) {
    // launchUrl(Uri.parse('tel:$phoneNumber'));
  }

  void _openMaps(BuildContext context, String address) {
    // final query = Uri.encodeComponent(address);
    // launchUrl(Uri.parse('https://www.google.com/maps/search/?api=1&query=$query'));
  }
}
