import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const url =
    'https://th.bing.com/th/id/OIP.VHe1DTnuwc6ZHYcAjUx0xQHaEo?rs=1&pid=ImgDetMain';
const des =
    '''Lorem ipsum odor amet, consectetuer adipiscing elit. Vulputate lectus aptent maecenas vel adipiscing nam in. Lorem taciti amet himenaeos rutrum potenti eget. Justo fusce convallis varius praesent posuere class. Tellus ullamcorper facilisi fusce porta neque; nascetur praesent ut. Phasellus nostra scelerisque fusce cras velit facilisi. Urna amet purus libero diam vulputate interdum nam porttitor facilisis.

Etiam venenatis dui viverra etiam taciti sapien natoque? Consectetur consectetur mollis dignissim sodales per eu. Dolor dui facilisis sed dictumst in, curae leo nec. Fringilla ligula placerat sit risus dui. Himenaeos efficitur montes eget dapibus consectetur. Fringilla et facilisi sodales luctus, mus accumsan mus. Amet auctor diam habitant venenatis rutrum porttitor commodo parturient enim.

Cursus a nec egestas aliquam feugiat aptent senectus. Habitasse luctus primis integer, class rutrum laoreet semper. Elit risus elementum malesuada dolor dui dapibus nam dolor. Nascetur nisl ante massa viverra interdum nunc tempor. Mus ultrices augue habitasse mollis elementum; ridiculus lacinia at? Potenti nulla amet id consectetur himenaeos tempor cubilia faucibus ligula. Praesent rhoncus dis accumsan facilisis aliquet vulputate.

Nullam laoreet netus cubilia, finibus cursus vitae. Euismod curabitur libero elit habitasse praesent. Nullam torquent viverra penatibus taciti mi nullam suscipit. Proin hac purus bibendum quisque arcu ac rhoncus. Mollis libero lacinia odio per lacinia morbi. Magnis nam ridiculus aliquam fusce erat ad in. Alobortis egestas; finibus elementum ridiculus egestas porta consequat. Aenean mollis massa eros vulputate eu. Vel tortor nostra erat suscipit blandit venenatis.

Cubilia tempor sapien ligula rhoncus montes nisi rhoncus. Tempor massa turpis hendrerit, quam suscipit senectus. Montes duis platea ullamcorper dictumst cursus blandit laoreet molestie. Dis eleifend habitant luctus in natoque interdum. Platea integer montes elementum sed pellentesque potenti elementum maecenas. Nascetur bibendum vulputate a placerat nascetur. Non praesent urna sit nibh dapibus netus. Cras ligula odio fermentum penatibus risus tristique consectetur varius. Velit vehicula sed tellus ultricies potenti lobortis platea at.''';

List<String> urls = [
  'https://th.bing.com/th/id/OIP.VHe1DTnuwc6ZHYcAjUx0xQHaEo?rs=1&pid=ImgDetMain',
  'https://tse1.mm.bing.net/th/id/OIP.RMulPLHrxn2tIOoMWGIN8gHaEh?rs=1&pid=ImgDetMain',
  // 'https://images.hdqwalls.com/wallpapers/bugatti-sport-car-77.jpg',
  'https://4.bp.blogspot.com/-Y7hDWJzTVug/Tw0yQTjroLI/AAAAAAAAADw/oczjCkCIClM/s1600/best_car_wallpapers+1.jpeg',
  'https://tse2.mm.bing.net/th/id/OIP.4gI4t9PcS3-YCduAIl35-wHaEo?rs=1&pid=ImgDetMain'
];

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarsection(context),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _bgrndimg(),

                if(index!=0)

                _previmg(),

                if(index!=urls.length-1)

                _nxtimg(),

              ],
            ),
            _Header(),
            _Icons(),
            _bodysection()
          ],
        ),
      ),
    );
  }

  AppBar _appbarsection(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
      ),
      title: Text(
        'Homepage',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

  Positioned _nxtimg() {
    return Positioned(
                bottom: -10,
                right: -10,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      index++;
                    });
                  },
                  icon: Icon(
                    Icons.navigate_next_sharp,size: 50,
                  ),
                ),
              );
  }

  Positioned _previmg() {
    return Positioned(
                bottom: -10,
                left: -10,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      index--;
                    });
                  },
                  icon: Icon(
                    Icons.navigate_before_sharp,size: 50,
                  ),
                ),
              );
  }

  Image _bgrndimg() {
    return Image.network(
                urls[index],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              );
  }

  Widget _bodysection() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Text(
        des,
        style: TextStyle(),
      ),
    );
  }

  Widget _Icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _callicon(),
        _routeicon(),
        _shareicon()
      ],
    );
  }

  Column _shareicon() {
    return Column(
        children: [
          Icon(
            Icons.share,
            color: Colors.blue,
          ),
          Text(
            'SHARE',
            style: TextStyle(color: Colors.blue),
          )
        ],
      );
  }

  Column _routeicon() {
    return Column(
        children: [
          Icon(
            Icons.navigation,
            color: Colors.blue,
          ),
          Text(
            'ROUTE',
            style: TextStyle(color: Colors.blue),
          )
        ],
      );
  }

  Column _callicon() {
    return Column(
        children: [
          Icon(
            Icons.call,
            color: Colors.blue,
          ),
          Text(
            'CALL',
            style: TextStyle(color: Colors.blue),
          )
        ],
      );
  }

  Widget _Header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _titlefield(),
        _rating()
      ],
    );
  }

  Padding _rating() {
    return Padding(
        padding: const EdgeInsets.only(
          right: 18.0,
        ),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange,
            ),
            Text('41')
          ],
        ),
      );
  }

  Padding _titlefield() {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oeschin Lake Campground',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              'Kandersteg, Switzerland',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      );
  }
}
