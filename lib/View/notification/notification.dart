import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  final List<String> titles = [
    'Binance Futures Will Launch USDC-Margined LTC and NEAR Perpetual Contracts With Up to ...',
    'EGLD Locked Products: Enjoy Up to 12.9% APR in Rewards!',
    'Binance Will Support the Filecoin (FIL) Network Upgrade & Hard Fork',
    'Binance Adds Tensor (TNSR) on Earn, Convert, Margin & Futures',
    'Join the #HalvingWithBinance Daily Learning Challenge and Win Community Rewards! ',
    'Binance Updates Fiat Liquidity Provider Program (2024-04-10)',
    'Binance Will List Tensor (TNSR) with Seed Tag Applied',
    'VIP Invitation Program Promotion: Refer Users to Receive Up to 5,000 USDT and Binance ...',
    'Binance Adds USDT/CZK Trading Pair on Spot, with Trading Bots Services Enabled',
    'Binance Square: Share Binance Square Links & Complete Tasks to Unlock Over \$35,000 Worth ...',
    'Saga (SAGA) Listing Will Be Advanced',
    'Introducing "Discover" on Copy Trading: Join the Swipe and Trade Competition to Share 30,000 ...',
    'Word of the Day: Test Your Knowledge on the Bitcoin Halving Horizons Promo Series to Earn ...',
    'Binance Introduces Binance Options Enhanced Program',
    'Binance Completes Integration of 35 New dApps on Binance Web3 Wallet (March 2024)',
    'Binance Has Completed the NFPrompt (NFP) Contract Swap',
    'Binance Exchange Link: Mandatory Identity Verification (KYC) Requirements',
    'Binance Adds USDT/MXN Spot Trading Pair with Trading Bots Services Enabled',
    'Binance NFT: Update on Bitcoin NFTs',
    'Notice on New Trading Pairs & Trading Bots Services on Binance Spot - 2024-04-05',
  ];

  final List<String> subtitle = [
    'Fellow Binanclans, To expand the list of trading choices offered on Binance Futures and enhance users trading...',
    'This is a general announcement. Products and services referred to here may not be available in your region. ...',
    'Fellow Binancians, Starting at approximately 2024-04-11 13:00 (UTC), Binance will suspend the ...',
    'Fellow Binancians, Binance is excited to announce that Tensor (TNSR) has been added to Binance Simple Ear...',
    'Fellow Binancians, Binance is thrilled to present the #HalvingwithBinance Community Daily Learning ...',
    'Fellow Binancians, Binance will be updating its Fiat Liquidity Provider Program at 2024-04-10 00:00 (UTC). ...',
    'Note: Please do your own research before making any trades for the aforementioned token outside Binance t...',
    'This is a general announcement. Products and services referred to here may not be available in your region....',
    'Fellow Binancians, To expand the list of trading choices offered on Binance and enhance users trading ...',
    'This is a general announcement. Products and services referred to here may not be available in your region. ...',
    'Fellow Binancians, The trading start time for Saga (SAGA), originally set at 2024-04-09 14:00 (UTC), will ...',
    'This is a general announcement. Products and services referred to here may not be available in your region ...',
    'This is a general announcement. Products and services referred to here may not be available in your region ...',
    'Fellow Binancians, Binance is pleased to introduce the Binance Options Enhanced Program. Starting from ...',
    'This is a general announcement. Products and services referred to here may not be available in your region. ...',
    'Fellow Binancians, Binance has completed the NFPrompt (NFP) contract swap. Deposits and ...',
    'Fellow Binancians, Please kindly note that all sub- accounts created by Exchange Link account holders...',
    'TPIOIo1nRNezPlaHuS4L5iKz6JGb/dSnJLpPXSGqhoV/72FRj/...',
    'Fellow Binancians, As part of its ongoing efforts to streamline product offerings on the Binance NFT ...',
    'Fellow Binancians, To expand the list of trading choices offered on Binance Spot and enhance users trading ...',
  ];

  final List<String> date = [
    '04-09 09:00:25',
    '04-09 08:20:04',
    '04-09 07:01:20',
    '04-08 21:20:08',
    '04-08 18:01:15',
    '04-08 17:15:28',
    '04-08 16:44:17',
    '04-08 16:02:48',
    '04-08 14:55:21',
    '04-08 14:15:10',
    '04-08 13:00:27',
    '04-08 12:00:25',
    '04-08 08:16:47',
    '04-05 13:48:38',
    '04-05 12:41:30',
    '04-05 10:40:09',
    '04-05 08:24:45',
    '04-05 03:00:00',
    '04-04 15:22:37',
    '04-04 14:31:52',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            key: Key(titles[index]),
            startActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Iconsax.trash,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  icon: Iconsax.share,
                  label: 'Share',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: const [
                SlidableAction(
                  flex: 1,
                  onPressed: doNothing,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Iconsax.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  icon: Iconsax.save_2,
                  label: 'Save',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 11, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: SizedBox(
                          width: 30,
                          child: Image.asset('assets/image/logo2.png')),
                      ),
                    ],
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      subtitle[index],
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      date[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void doNothing(BuildContext context) {}
