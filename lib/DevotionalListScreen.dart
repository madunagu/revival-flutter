import 'package:devotion/DevotionalScreen.dart';
import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/models/Devotional.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevotionalListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Devotionals',
        rightIcon: Icons.filter,
      ),
      body: BlocProvider(
          create: (BuildContext context) => ListBloc(
                resource: '/devotionals',
                feedType: 'devotional',
              )..add(ListFetched()),
          child: DevotionalListWidget()),
    );
  }
}

class DevotionalListWidget extends StatefulWidget {
  DevotionalListWidget({Key key}) : super(key: key);

  @override
  _DevotionalListWidgetState createState() => _DevotionalListWidgetState();
}

class _DevotionalListWidgetState extends State<DevotionalListWidget> {
  List<dynamic> items = [];

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ListBloc _postBloc;

  Widget organiseStack(List<dynamic> items, BuildContext context) {
    List<Widget> output = [];
    Size size = MediaQuery.of(context).size;
    for (var i = 0; i < items.length; i++) {
      output.insert(
        0,
        Positioned(
          top: 195.0 * i,
          child: DevotionalItemWidget(devotional: items[i], size: size),
        ),
      );
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        height: 190.0 * items.length + 200,
        child: Stack(
          children: output,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<ListBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(ListFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is ListInitial) {
          return Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if (state is ListFailure) {
          return Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Text('failed to fetch devotionals'),
          );
        }
        if (state is ListSuccess) {
          if (state.models.isEmpty) {
            Size size = MediaQuery.of(context).size;
            return Container(
              width: size.width,
              height: size.height,
              child: Text('no devotionals'),
            );
          }
          return this.organiseStack(state.models, context);
        }
        return Container();
      },
    );
  }
}

class DevotionalItemWidget extends StatelessWidget {
  final Devotional devotional;
  final Size size;

  const DevotionalItemWidget({
    this.devotional,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DevotionalScreen(devotional: devotional),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: devotional.images != null
                ? NetworkImage(devotional.images[0].mediumUrl)
                : AssetImage('images/devotional.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
          ),
        ),
        height: 270,
        width: size.width,
        child: Container(
          padding: const EdgeInsets.only(top: 140,left: 24),
          width: size.width,
          child: Column(
            children: [
              Text(
                devotional.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 7),
              Text(
                '56 Topics - 2k articles',
                style: TextStyle(color: Color(0xb8ffffff)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
