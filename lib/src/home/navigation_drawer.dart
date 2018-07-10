import 'package:flutter/material.dart';
import 'package:yuefou_flutter/src/common/text.dart';
import 'package:yuefou_flutter/src/graphql/activities.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key key, this.activeRouteName, this.onSelected})
      : super(key: key);

  final String activeRouteName;
  final Function onSelected;

  final _avatarUrl =
      'https://yuefou-prod-cos-1256165069.cos.ap-beijing.myqcloud.com/cjgork39i3spq0120xk2d95a8/4612dcd6-6bde-4220-97eb-ed23dcbb507b-超级长超级长超级长超级长超级长超级长超级长超级长超级长超级长超级长超级长超级长超级长.jpg';

  @override
  State<StatefulWidget> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget _buildListTile(BuildContext ctx,
      {String title, String routeName, Icon icon}) {
    final isActive = widget.activeRouteName == routeName;

    return Container(
      decoration: BoxDecoration(
        color: isActive ? Colors.black12 : Colors.white,
      ),
      child: ListTile(
        selected: isActive,
        leading: icon,
        title: Text(title),
        onTap: () {
          ActivitiesService.instance.list().then((res) {
            print(res.activities.collection[0].id.value);
          });

          widget.onSelected(routeName);

          Navigator.pushReplacementNamed(ctx, routeName);
        },
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext ctx) {
    return DrawerHeader(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(widget._avatarUrl),
                  backgroundColor: Colors.white,
                  radius: 48.0,
                )
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      // margin: EdgeInsets.only(top: 16.0),
                      child: MajorText(
                        'Fine, thank you, and you.',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 18.0,
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      // TODO redirect to profile page
                      Navigator.pushReplacementNamed(ctx, '/settings');
                      // _redirectProfilePage(ctx);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    List<Widget> drawerChildren = [
      _buildDrawerHeader(ctx),
      _buildListTile(ctx,
          title: '动态', routeName: '/', icon: const Icon(Icons.face)),
      _buildListTile(ctx,
          title: '活动',
          routeName: '/activity',
          icon: const Icon(Icons.schedule)),
      _buildListTile(ctx,
          title: '任务', routeName: '/task', icon: const Icon(Icons.event_note)),
      _buildListTile(ctx,
          title: '菜式',
          routeName: '/recipe',
          icon: const Icon(Icons.restaurant_menu)),
    ];

    return new Drawer(
      child: ListView(padding: EdgeInsets.zero, children: drawerChildren),
    );
  }
}
