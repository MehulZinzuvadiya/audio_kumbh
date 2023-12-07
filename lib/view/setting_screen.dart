// import 'package:audio_kumbh/provider/home_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../generated/l10n.dart';
//
// class Settings extends StatelessWidget {
//   const Settings({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var t = AppLocalizations.of(context);
//
//     var selectedLocale = Localizations.localeOf(context).toString();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(t.settings),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Consumer<HomeProvider>(
//               builder: (context, HomeProvider value, child) => DropdownButton(
//                 value: selectedLocale,
//                 items: [
//                   DropdownMenuItem(
//                     child: Text(t.pageSettingsInputLanguage("es")),
//                     value: "es",
//                   ),
//                   DropdownMenuItem(
//                     child: Text(t.pageSettingsInputLanguage("hi")),
//                     value: "hi",
//                   ),
//                   DropdownMenuItem(
//                     child: Text(t.pageSettingsInputLanguage("gu")),
//                     value: "gu",
//                   ),
//                 ],
//                 onChanged: (String? newValue) {
//                   if (newValue != null) {
//                     value.set(Locale(newValue));
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
