import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Generated/assets.dart';

class Cards {
  buildEventCard({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesList), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 20.r,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25.r),
          ),
        ),
      ),
    );
  }

  eventCard({required String title, required String images}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: ListTile(
          leading: images.isEmpty
              ? SizedBox()
              : CachedNetworkImage(
                  imageUrl: images,
                  placeholder: (context, url) =>
                      LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.grey,
                    size: 20.r,
                  ),
                ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'VarelaRound',
              fontSize: 16.r,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  descriptionCard({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  tEventCard({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  tDataCard(
      {required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
