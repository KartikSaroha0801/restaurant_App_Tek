import 'package:flutter/material.dart';
class CustomSearchPage extends StatefulWidget {
  final TextEditingController searchController;
  final String filledColor;
  final String hintText;  
  final Function(String) onSearch;

  CustomSearchPage({
    super.key,
    required this.searchController,
    required this.filledColor,
    required this.hintText,  
    required this.onSearch,
  });

  @override
  State<CustomSearchPage> createState() => _CustomSearchPageState();
}

class _CustomSearchPageState extends State<CustomSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.searchController,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          hintText: widget.hintText,  // Use custom hintText
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Color(int.parse(widget.filledColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
