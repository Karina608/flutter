import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostCreatePage extends StatefulWidget {
  const PostCreatePage({super.key});

  @override
  State<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends State<PostCreatePage> {
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a new post"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              final client = Supabase.instance.client;
              try {
                setState(() {
                  _isLoading = true;
                });
                await client.from("posts").insert({
                  "content": _contentController.text,
                });
                Fluttertoast.showToast(msg: "Post created successfully");
                Navigator.of(context).pop();
              } catch (e) {
                Fluttertoast.showToast(msg: e.toString());
              } finally {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child:_isLoading
            ?Center(child:CircularProgressIndicator)
             Text("publish"),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(padding: .all(12), child: Column()),
    );
  }
}
