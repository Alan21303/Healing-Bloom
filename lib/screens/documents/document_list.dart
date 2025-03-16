import 'package:flutter/material.dart';
import 'package:healingbloom/widgets/top_navigation_bar.dart';
import 'package:healingbloom/widgets/side_menu.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TopNavigationBar(
          userName: 'John Doe',
          onProfileTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: SideMenu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search documents...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual document count
              itemBuilder: (context, index) {
                return DocumentCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.picture_as_pdf), // Change based on file type
        title: Text('Document Title'),
        subtitle: Text('Uploaded on: 2023-10-01'),
        trailing: PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('View'),
              value: 'view',
            ),
            PopupMenuItem(
              child: Text('Delete'),
              value: 'delete',
            ),
          ],
          onSelected: (value) {
            if (value == 'view') {
              // Navigate to detailed document view
            } else if (value == 'delete') {
              // Logic to delete the document
            }
          },
        ),
      ),
    );
  }
} 