import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../constants/app_color.dart';
import '../../calender_project_view_screen/widgets/comment_card.dart';
import '../widgets/item_video_play.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({super.key});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late YoutubePlayerController controller;
  void initState() {
    super.initState();
    const url = "https://www.youtube.com/watch?v=9VPq1JxMfkA";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false,
        loop: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;

    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              children: [
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Reviews here',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.send, color: AppColors.primaryColor),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Container(
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: AppColors.shadowWidget),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.textColor,
                size: 17.0,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: AppColors.shadowWidget,
              ),
              child: player,
            ),
            const SizedBox(height: 20),
            DieuHuong(),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(2, 0),
                    ),
                  ],
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18.0),
                                  Text(
                                    ' 4.8',
                                    style: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.people,
                                      color: AppColors.primaryColor,
                                      size: 18.0),
                                  Text(
                                    ' 4,499 views',
                                    style: const TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 5.0),
                      const ItemVideoPlay(
                          thumbNails: 'assets/images/course.png',
                          title: 'UI/UX Design',
                          time: '1:30:00',
                          check: true),
                      const SizedBox(height: 5.0),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'List Lessons Again',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryColor.withOpacity(0.5),
                                  AppColors.primaryColor.withOpacity(0.8),
                                ],
                              ),
                            ),
                            child: const Text(
                              '4/8',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const ItemVideoPlay(
                        thumbNails: 'assets/images/course.png',
                        title: 'UI/UX Design',
                        time: '1:30:00',
                        check: false,
                      ),
                      const ItemVideoPlay(
                        thumbNails: 'assets/images/course.png',
                        title: 'UI/UX Design',
                        time: '3:30:00',
                        check: false,
                      ),
                      const ItemVideoPlay(
                        thumbNails: 'assets/images/course.png',
                        title: 'UI/UX Design',
                        time: '2:30:00',
                        check: false,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "All Reviews",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'See More',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const SizedBox(height: 10.0),
                      const CommentCard(
                        name: 'Nguyen Minh Hung',
                        image: 'assets/images/person.png',
                        favCount: 300,
                        title:
                            'Doctors who are very skilled and fast in service',
                        day: 8,
                        star: 3,
                        checkLike: true,
                        check: 1,
                        hori: 0,
                      ),
                      const CommentCard(
                        name: 'Nguyen Minh Hung',
                        image: 'assets/images/person1.png',
                        favCount: 300,
                        title:
                            'Doctors who are very skilled and fast in service',
                        day: 8,
                        star: 3,
                        checkLike: true,
                        check: 1,
                        hori: 0,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DieuHuong extends StatelessWidget {
  const DieuHuong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            Colors.black26,
            Colors.black38,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.speaker, color: Colors.white),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.skip_previous, color: Colors.white),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.pause, color: Colors.white),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.skip_next_rounded, color: Colors.white),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
