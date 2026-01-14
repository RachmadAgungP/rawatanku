import 'package:flutter/material.dart';

class AnimatedGridButton extends StatefulWidget {
  final int initialItemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final Duration animationDuration;
  final Curve animationCurve;
  final double borderRadius;
  final double padding;

  const AnimatedGridButton({
    super.key,
    this.initialItemCount = 8,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 10.0,
    this.mainAxisSpacing = 10.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.borderRadius = 15.0,
    this.padding = 20.0,
  });

  @override
  _AnimatedGridButtonState createState() => _AnimatedGridButtonState();
}

class _AnimatedGridButtonState extends State<AnimatedGridButton> {
  late List<Map<String, dynamic>> items;
  int? expandedIndex;

  @override
  void initState() {
    super.initState();
    items = List.generate(
        widget.initialItemCount, (index) => _createGridItem(index));
  }

  Map<String, dynamic> _createGridItem(int index) {
    return {
      'id': index,
      'title': 'Item $index',
      'description': 'Short description for Item $index',
      'detailedInfo':
          'Detailed information for Item $index. This is a longer description that provides more context and details about the item.'
    };
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAspectRatio,
        crossAxisSpacing: widget.crossAxisSpacing,
        mainAxisSpacing: widget.mainAxisSpacing,
      ),
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == items.length) {
          return _buildAddButton();
        }
        return _buildGridItem(items[index], index);
      },
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item, int index) {
    bool isExpanded = expandedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          expandedIndex = isExpanded ? null : index;
        });
      },
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        padding: EdgeInsets.all(isExpanded ? 0 : widget.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
              ),
              if (!isExpanded)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sunny, size: 15, color: Colors.white),
                      SizedBox(height: 8),
                      Text(item['title'],
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 8),
                      Text(item['description'],
                          style: TextStyle(color: Colors.white)),
                      Spacer(),
                      _buildInfoButton(context, item),
                    ],
                  ),
                ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(Icons.close, size: 15, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      items.removeAt(index);
                      if (expandedIndex == index) {
                        expandedIndex = null;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoButton(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(item['title']),
              content: Text(item['detailedInfo']),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info, size: 30, color: Colors.white),
                // SizedBox(width: 8),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Text('More', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                //     Text('Tap', style: TextStyle(color: Colors.white, fontSize: 12)),
                //   ],
                // ),
              ],
            ),
          ),
          FittedBox(
            child: Container(
              height: 50,
              width: 70,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    // Tindakan jika pengguna memilih melanjutkan
                    Future.microtask(() {
                      setState(() {});
                    });
                  },
                  child: Center(
                      child: Icon(Icons.edit, size: 20, color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          items.add(_createGridItem(items.length));
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Icon(Icons.add, size: 40),
        ),
      ),
    );
  }
}
