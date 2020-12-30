import 'package:flutter/material.dart';

/*
Observer class is a stream handler
 */

class Observer<T> extends StatelessWidget {
  @required
  final Stream stream;

  @required
  final Function onSuccess;

  final Function onError;

  final Function onLoading;

  Function get _defaultLoading =>
      (context) => Center(child: CircularProgressIndicator());

  Function get _defaultError => (context, error) => Center(child: Text(error));

  const Observer({this.stream, this.onSuccess, this.onError, this.onLoading});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return onError != null
              ? onError(context, snapshot.error)
              : _defaultError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          return onSuccess(context, snapshot.data);
        } else {
          return onLoading != null ? onLoading(context) : _defaultLoading(context);
        }
      },
    );
  }
}
