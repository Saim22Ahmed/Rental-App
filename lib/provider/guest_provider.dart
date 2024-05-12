import 'package:flutter_riverpod/flutter_riverpod.dart';

class Guests {
  int adults;
  int children;
  int infants;

  Guests({required this.adults, required this.children, required this.infants});

  Guests copyWith({int? adults, int? children, int? infants}) {
    return Guests(
      adults: adults ?? this.adults,
      children: children ?? this.children,
      infants: infants ?? this.infants,
    );
  }
}

final guestsProvider = StateNotifierProvider<GuestsNotifier, Guests>((ref) {
  return GuestsNotifier();
});

class GuestsNotifier extends StateNotifier<Guests> {
  GuestsNotifier() : super(Guests(adults: 0, children: 0, infants: 0));

  void incrementAdults() {
    state = state.copyWith(adults: state.adults + 1);
  }

  void decrementAdults() {
    if (state.adults > 0) {
      state = state.copyWith(adults: state.adults - 1);
    }
  }

  void incrementChildren() {
    state = state.copyWith(children: state.children + 1);
  }

  void decrementChildren() {
    if (state.children > 0) {
      state = state.copyWith(children: state.children - 1);
    }
  }

  void incrementInfants() {
    state = state.copyWith(infants: state.infants + 1);
  }

  void decrementInfants() {
    if (state.infants > 0) {
      state = state.copyWith(infants: state.infants - 1);
    }
  }

  void clearAll() {
    state = Guests(adults: 0, children: 0, infants: 0);
  }
}
