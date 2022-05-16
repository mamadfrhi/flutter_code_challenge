import 'package:flutter/material.dart';
import '../../../models/PersonView.dart';
import '../../details/Details.dart';

class PersonCard extends StatelessWidget {
  final PersonView person;
  final BuildContext grandParentCtx;
  const PersonCard(
      {Key? key, required this.person, required this.grandParentCtx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.gender.name.toString()),
        trailing: person.alive()
            ? null
            : const Icon(
                Icons.heart_broken,
                color: Colors.black,
              ),
        enabled: person.hasDetail(),
        onTap: () => _navigateToDetailPage(grandParentCtx, person),
      ),
    );
  }

  void _navigateToDetailPage(parentContext, person) async {
    Navigator.of(parentContext).push(
      MaterialPageRoute(
        builder: (_) => Details(
          person: person,
        ),
      ),
    );
  }
}
