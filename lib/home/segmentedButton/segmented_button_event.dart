part of 'segmented_button_bloc.dart';

abstract class SegmentedButtonEvent extends Equatable{
 const SegmentedButtonEvent();
@override
List<Object> get props => [];
}

class loadindex extends SegmentedButtonEvent {
  const loadindex(int index);
}
