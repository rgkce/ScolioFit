import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.get(context, 'help_support'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.get(context, 'faq'),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            _buildFAQItem(
              context,
              AppStrings.get(context, 'faq_1_q'),
              AppStrings.get(context, 'faq_1_a'),
            ),
            _buildFAQItem(
              context,
              AppStrings.get(context, 'faq_2_q'),
              AppStrings.get(context, 'faq_2_a'),
            ),
            // _buildFAQItem(
            //   context,
            //   AppStrings.get(context, 'faq_3_q'),
            //   AppStrings.get(context, 'faq_3_a'),
            // ),
            const SizedBox(height: 48),
            // Center(
            //   child: Column(
            //     children: [
            //       Text(
            //         AppStrings.get(context, 'still_need_help'),
            //         style: const TextStyle(color: Colors.grey),
            //       ),
            //       const SizedBox(height: 12),
            //       ElevatedButton.icon(
            //         onPressed: () {
            //           // We could use url_launcher here but let's keep it simple
            //         },
            //         icon: const Icon(Icons.email_outlined),
            //         label: const Text('support@scoliofit.com'),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        childrenPadding: const EdgeInsets.all(16),
        expandedAlignment: Alignment.topLeft,
        children: [
          Text(answer, style: TextStyle(color: Colors.grey[700], height: 1.5)),
        ],
      ),
    );
  }
}
