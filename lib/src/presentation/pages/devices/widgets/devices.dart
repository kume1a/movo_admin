import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/device.dart';
import '../state/devices_page_cubit.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesPageCubit, DataState<FetchFailure, List<Device>>>(
      builder: (_, DataState<FetchFailure, List<Device>> state) {
        return state.maybeWhen(
          success: (List<Device> data) => ListView.builder(
            itemBuilder: (_, int index) => _Item(device: data[index]),
            itemCount: data.length,
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.device,
  }) : super(key: key);

  final Device device;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => context.read<DevicesPageCubit>().onDevicePress(device),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    device.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    device.deviceId,
                    style: TextStyle(color: theme.secondaryHeaderColor),
                  ),
                ],
              ),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: device.isAuthorized ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
