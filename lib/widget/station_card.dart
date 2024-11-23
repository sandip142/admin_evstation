import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StationCard extends StatelessWidget {
  final QueryDocumentSnapshot stationData;
  final bool isVerified;
  final VoidCallback onVerifyToggle;

  const StationCard({
    Key? key,
    required this.stationData,
    required this.isVerified,
    required this.onVerifyToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.ev_station, color: Colors.green, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  stationData['stationName'] ?? 'Unnamed Station',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.blueGrey, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  stationData['ownerName'] ?? 'Unknown Owner',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.phone, color: Colors.blue, size: 20),
              const SizedBox(width: 4),
              Text(
                stationData['contactNumber'] ?? 'N/A',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.category, color: Colors.deepPurple, size: 20),
              const SizedBox(width: 8),
              Text(
                'Category: ${stationData['category'] ?? 'N/A'}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.power, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                'Charger: ${stationData['chargerType'] ?? 'N/A'}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1, color: Colors.grey),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  stationData['stationAddress'] ?? 'No Address',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: onVerifyToggle,
                icon: isVerified
                    ? const Icon(Icons.check_circle, color: Colors.white)
                    : const Icon(Icons.error, color: Colors.white),
                label: Text(
                  isVerified ? 'Verified' : 'Verify',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isVerified ? Colors.green : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Placeholder for edit functionality
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text('Edit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}