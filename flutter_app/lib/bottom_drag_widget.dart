//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//
//class BottomDragWidget extends StatelessWidget {
//  final Widget body;
//  final DragContainer dragContainer;
//
//  BottomDragWidget({Key key, @required this.body, @required this.dragContainer})
//      : assert(body != null),
//        assert(dragContainer != null),
//        super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        body,
//        Align(
//          alignment: Alignment.bottomCenter,
//          child: dragContainer,
//        )
//      ],
//    );
//  }
//}
//
//typedef DragListener = void Function(double dragdistance, ScrollNotificationListener isDragEnd);
//
//class DragController {
//  DragListener _dragListener;
//
//  setDrag(DragListener l) {
//    _dragListener = l;
//  }
//
//  void updateDragDistance(double dragDistance, ScrollNotificationListener isDragEnd) {
//    if (_dragListener != null) {
//      _dragListener(dragDistance, isDragEnd);
//    }
//  }
//}
//
//enum ScrollNotificationListener { start, end, edge }
//
//DragController _controller;
//
//class DragContainer extends StatefulWidget {
//  final Widget drawer;
//  final double defaultShowHeight;
//  final double height;
//
//  DragContainer({Key key, @required this.drawer, @required this.defaultShowHeight, @required this.height})
//      : assert(drawer != null),
//        assert(defaultShowHeight != null),
//        assert(height != null),
//        super(key: key) {
//    _controller = DragController();
//  }
//
//  @override
//  _DragContainerState createState() => _DragContainerState();
//}
//
//class _DragContainerState extends State<DragContainer> with TickerProviderStateMixin {
//  AnimationController animalController;
//
//  double maxOffsetDistance;
//  bool onResetControllerValue = false;
//  double offsetDistance;
//  Animation<double> animation;
//  bool offstage = false;
//  bool _isFling = false;
//
//  double get defaultOffsetDistance => widget.height - widget.defaultShowHeight;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    animalController = AnimationController(vsync: this, duration: const Duration(microseconds: 250));
//    maxOffsetDistance = (widget.height + widget.defaultShowHeight) * 0.6;
//
//    _controller.setDrag((double value, ScrollNotificationListener notification) {
//      if (notification != ScrollNotificationListener.edge) {} else {
//        setState(() {
//          offsetDistance = offsetDistance + value;
//        });
//      }
//    });
//    super.initState();
//  }
//
//  GestureRecognizerFactoryWithHandlers<MyVerticalDragGestureRecognizer>
//  getRecognizer(){
//    return GestureRecognizerFactoryWithHandlers<
//    MyVerticalDragGestureRecognizer>(
//        () => MyVerticalDragGestureRecognizer(flingListener: (bool isFling) {
//          _isFling = isFling;
//        }),
//        (MyVerticalDragGestureRecognizer instance) {
//          instance..onStart = _handleDragStart
//              ..onUpdate = _handleDragUpdate
//              ..onEnd = _handleDragEnd;
//        },
//    );
//  }
//  @override
//  void dispose() {
//    animalController.dispose();
//    super.dispose();
//  }
//  @override
//  Widget build(BuildContext context) {
//    if (offsetDistance == null || onResetControllerValue) {
//      offsetDistance = defaultOffsetDistance;
//    }
//    offsetDistance = offsetDistance.clamp(0.0, defaultOffsetDistance);
//offstage = offsetDistance < maxOffsetDistance;
//return Transform.translate(offset: Offset(0.0, offsetDistance),
//child: RawGestureDetector(),
//);
//  }
//}
//
//typedef FlingListener = void Function(bool isFling);
//
/////MyVerticalDragGestureRecognizer 负责任务
/////1.监听child的位置更新
/////2.判断child在手松的那一刻是否是出于fling状态
//class MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
//  final FlingListener flingListener;
//
//  MyVerticalDragGestureRecognizer({Object debugOwner, this.flingListener})
//      : super(debugOwner: debugOwner);
//
//  final Map<int, VelocityTracker> _velocityTrackers = <int, VelocityTracker>{};
//
//  @override
//  void handleEvent(PointerEvent event) {
//    super.handleEvent(event);
//    if (!event.synthesized && (event is PointerDownEvent || event is PointerMoveEvent)) {
//      final VelocityTracker tracker = _velocityTrackers[event.pointer];
//      assert(tracker != null);
//      tracker.addPosition(event.timeStamp, event.position);
//    }
//  }
//
//  @override
//  void addPointer(PointerEvent event) {
//    super.addPointer(event);
//    _velocityTrackers[event.pointer] = VelocityTracker();
//  }
//
//  @override
//  void didStopTrackingLastPointer(int pointer) {
//    final double minVelocity = minFlingVelocity ?? kMinFlingVelocity;
//    final double minDistance = minFlingDistance ?? kTouchSlop;
//    final VelocityTracker tracker = _velocityTrackers[pointer];
//
//    final VelocityEstimate estimate = tracker.getVelocityEstimate();
//    bool isFling = false;
//    if (estimate != null && estimate.pixelsPerSecond != null) {
//      isFling = estimate.pixelsPerSecond.dy.abs() > minVelocity && estimate.offset.dy.abs() > minDistance;
//    }
//    _velocityTrackers.clear();
//    if (flingListener != null) {
//      flingListener(isFling);
//    }
//
//    // TODO: implement didStopTrackingLastPointer
//    super.didStopTrackingLastPointer(pointer);
//  }
//
//  @override
//  void dispose() {
//    _velocityTrackers.clear();
//    super.dispose();
//  }
//}
//
//typedef ScrollListener = void Function(
//    double dragDistance, ScrollNotificationListener notification);
//
//
//class OverscrollNotificationWidget extends StatefulWidget {
//  const OverscrollNotificationWidget({
//    Key key,
//    @required this.child,
//}) : assert(child != null),
//
//  @override
//  OverscrollNotificationWidgetState createState() => OverscrollNotificationWidgetState();
//}
//
//class OverscrollNotificationWidgetState extends State<OverscrollNotificationWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
