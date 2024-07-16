// import 'dart:math';

// import 'package:audioplayers/audioplayers.dart';

// final Map<String, double> padding = {'top': 50, 'right': 100, 'bottom': 50, 'left': 100};
// final double w = 800 - padding['left']! - padding['right']!;
// final double h = 800 - padding['top']! - padding['bottom']!;
// final double r = min(w, h) / 2;
// double initialrotation = 0;
// double rotation = 0;
// double oldrotation = 0;
// int picked = 100000;
// List<int> oldpick = [];
// final ColorScale color = D3.scale.category20();

// // Loads the tick audio sound into an audio object.
// final AudioPlayer audio = AudioPlayer();
// final String ROULETTE_MEDIA = 'path/to/audio/file.mp3';

// final Selection svg = D3.select('#chart')
//     .append("svg")
//     .data([prizes])
//     .attr("viewBox", "0 0 800 800");

// final Selection container = svg.append("g")
//     .attr("class", "chartholder")
//     .attr("transform", "translate(${w / 2 + padding['left']},${h / 2 + padding['top']})");

// final Selection vis = container.append("g");

// final Selection myimage = vis.append('image')
//     .attr('xlink:href', WHEEL_IMG)
//     .attr('width', 800)
//     .attr('height', 800)
//     .attr('x', -400)
//     .attr('y', -400);

// final Selection outwheel = svg.append('image')
//     .attr('xlink:href', OUT_WHEEL_IMG)
//     .attr('width', 800)
//     .attr('height', 800);

// final Pie pie = D3.layout.pie().value((d) => 1);

// // declare an arc generator function
// final Arc arc = D3.svg.arc().outerRadius(r);

// // select paths, use arc generator to draw
// final Selection arcs = vis.selectAll("g.slice")
//     .data(pie)
//     .enter()
//     .append("g")
//     .append("text")
//         .attr("x", -110)
//         .attr("y", 5)
//         .attr("class", "wheelText")
//         .attr("text-anchor", "middle")
//         .attr("text-rendering", "optimizeLegibility")
//         .text((d, i) => prizes[i].label)
//         .attr("transform", (d) {
//             d.innerRadius = 0;
//             d.outerRadius = r;
//             d.angle = (d.startAngle + d.endAngle) / 2;
//             return "rotate(${(d.angle * 180 / pi - 90)})translate(${d.outerRadius - 10})";
//         });

// arcs.append("path")
//     .attr("fill-opacity", "0.0")
//     .attr("fill", (d, i) => color(i))
//     .attr("d", (d) => arc(d));

// void spinToResult(double r) {
//     initialrotation = r;
//     vis.transition()
//         .duration(0)
//         .ease("linear")
//         .attrTween("transform", rotInitial);
// }

// void introRotation(bool much) {
//   vis.transition().duration(4000)
//     .attr('transform', ' rotate(${much ? 10 : 200})')
//     .each('end', () {
//       Future.delayed(Duration(milliseconds: 4000), () {
//           introRotation(!much);
//       });
//     });
// }

// void spin(String url, double r) {
//     container.on("click", null);

//     if (oldpick.length == prizes.length) {
//         print("done");
//         container.on("click", null);
//         return;
//     }
//     double ps = 360 / prizes.length;
//     print("ps: $ps");

//     double result = r;
//     print("result: $result");

//     result += rotation;
//     picked = prizes.length - ((result % 360) / ps).ceil();
//     print("picked+1: ${picked + 1}");

//     if (oldpick.contains(picked)) {
//         spin(url, r);
//         return;
//     } else {
//         oldpick.add(picked);
//     }

//     rotation = result;
//     playSound();

//     vis.transition()
//         .duration(9000)
//         .attrTween("transform", rotTween)
//         .each("end", () {
//             D3.select(".slice:nth-child(${picked + 2}) path")
//                 .attr("fill-opacity", "0.5")
//                 .attr("fill", "#e9e9e9");

//             oldrotation = rotation;
//             print('finished! $rotation');
//             // Navigate to the URL (implementation depends on your Flutter navigation setup)
//             // Navigator.pushNamed(context, url);
//         });
// }

// // This function is called when the sound is to be played.
// void playSound() {
//     // Stop and rewind the sound if it already happens to be playing.
//     audio.stop();
//     audio.seek(Duration.zero);

//     // Play the sound.
//     audio.play(AssetSource(ROULETTE_MEDIA));
// }

// String Function(double) rotTween(double to) {
//     Interpolate i = D3.interpolate(oldrotation % 360, rotation);
//     return (t) => "rotate(${i(t)})";
// }

// String Function(double) rotInitial(double to) {
//     Interpolate i = D3.interpolate(0, initialrotation);
//     return (t) => "rotate(${i(t)})";
// }

