import 'package:demoapp/Model/post.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HeroDemo extends StatefulWidget {
  const HeroDemo({super.key});

  @override
  State<HeroDemo> createState() => _HeroDemoState();
}

class _HeroDemoState extends State<HeroDemo> {

  final List<Post> _posts = [
  Post(
    title: "title11", 
    author: "author11", 
    imageUrl: "https://pic.rmb.bdstatic.com/bjh/news/0fc6b71c59a69f39cf2e1244d10eaedc.jpeg",
    description: "《易水歌》是战国时期刺客荆轲赴秦刺杀秦王时在易水与燕太子丹等人饯别之际所唱的歌辞。歌辞前句通过描写秋风萧瑟，易水寒冽，极天地愁惨之状，渲染了苍凉悲壮的肃杀气氛，渗透出歌者激越澎湃的感情；后句表现主人公大义凛然、义无反顾、抱定必死决心深入虎穴的献身精神。全辞语言平易简练，借景抒情，情景交融，通过对风声萧萧、易水寒凉的外界景物的渲染烘托，表现了荆轲去刺杀秦王时的悲壮情怀和不完成任务誓不回还的坚定意志。"
  ),
  Post(
    title: "title222", 
    author: "author22", 
    imageUrl: "https://img1.baidu.com/it/u=1368815763,3761060632&fm=253&fmt=auto&app=138&f=JPEG?w=760&h=434",
    description: "《易水歌》是战国时期刺客荆轲赴秦刺杀秦王时在易水与燕太子丹等人饯别之际所唱的歌辞。歌辞前句通过描写秋风萧瑟，易水寒冽，极天地愁惨之状，渲染了苍凉悲壮的肃杀气氛，渗透出歌者激越澎湃的感情；后句表现主人公大义凛然、义无反顾、抱定必死决心深入虎穴的献身精神。全辞语言平易简练，借景抒情，情景交融，通过对风声萧萧、易水寒凉的外界景物的渲染烘托，表现了荆轲去刺杀秦王时的悲壮情怀和不完成任务誓不回还的坚定意志。"
  ),
  Post(
    title: "title3333", 
    author: "author33", 
    imageUrl: "https://i-blog.csdnimg.cn/blog_migrate/41635df939e6dd13c6d5e2af785d358b.jpeg",
    description: "《易水歌》是战国时期刺客荆轲赴秦刺杀秦王时在易水与燕太子丹等人饯别之际所唱的歌辞。歌辞前句通过描写秋风萧瑟，易水寒冽，极天地愁惨之状，渲染了苍凉悲壮的肃杀气氛，渗透出歌者激越澎湃的感情；后句表现主人公大义凛然、义无反顾、抱定必死决心深入虎穴的献身精神。全辞语言平易简练，借景抒情，情景交融，通过对风声萧萧、易水寒凉的外界景物的渲染烘托，表现了荆轲去刺杀秦王时的悲壮情怀和不完成任务誓不回还的坚定意志。"
  )];

  Widget _buildList(context, index) {
    final imageUrl = _posts[index].imageUrl;
    final imageUrls = _posts.map((post){
      return post.imageUrl;
    }).toList();
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HeroMutipleDetailDemo(selectIndex: index, imageUrls: imageUrls);
        }));
      },
      // 用Hero 组件包装一下，才能实现效果
      child: Hero(
        // 需要添加唯一的tag
        tag: imageUrl, 
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    final singleImageUrl = "https://img2.baidu.com/it/u=1337068678,3064275007&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=750";

    return Scaffold(
      appBar: AppBar(
        title: Text("HeroDemo"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HeroDetailDemo(imageUrl: singleImageUrl);
                }));
              },
              child: Hero(
                tag: singleImageUrl, 
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(singleImageUrl, fit: BoxFit.cover),
                )
              ),
            ),

            Expanded(child: GridView.builder(
              itemCount: _posts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 16 / 9
              ), 
              itemBuilder: _buildList
            ))
          ],
        ),
      ),
    );
  }
}

// =============单张图片的预览===========
class HeroDetailDemo extends StatefulWidget {
  final String imageUrl;

  const HeroDetailDemo({super.key, required this.imageUrl});

  @override
  State<HeroDetailDemo> createState() => _HeroDetailDemoState();
}

class _HeroDetailDemoState extends State<HeroDetailDemo> {
  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageUrl;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Hero(
            tag: imageUrl, 
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
            )
          ),
        )
      )
    );
  }
}


// =============多张图片的预览===========
class HeroMutipleDetailDemo extends StatefulWidget {
  final int selectIndex;
  final List<String> imageUrls;

  const HeroMutipleDetailDemo({super.key, required this.selectIndex, required this.imageUrls});

  @override
  State<HeroMutipleDetailDemo> createState() => _HeroMutipleDetailDemoState();
}

class _HeroMutipleDetailDemoState extends State<HeroMutipleDetailDemo> {

  late PageController _pageController;
  late int _selectIndex;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget.selectIndex
    );
    _selectIndex = widget.selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    final imageurls = widget.imageUrls;
    return Hero(
      tag: imageurls[_selectIndex], 
      child: Scaffold(
        body: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.black,
            child: PhotoViewGallery.builder(
              pageController: _pageController,
              onPageChanged: (index){
                setState(() {
                  _selectIndex = index;
                });
              },
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                final currentImageUrl = imageurls[index];
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(currentImageUrl),
                  initialScale: PhotoViewComputedScale.contained,
                  // heroAttributes: PhotoViewHeroAttributes(tag: currentImageUrl),
                );
              },
              itemCount: imageurls.length,
            )
          ),
        ),
      )
    );
  }
}