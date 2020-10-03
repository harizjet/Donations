import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class Adopt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Adopt Our Animal "),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
      ),
      body: Lists(),
    );
  }
}

class AdoptItem {
  final String title;
  final String image;
  final String action;

  AdoptItem(this.title, this.image, this.action);
}

class Lists extends StatelessWidget {
  final List<AdoptItem> adopts = [
    AdoptItem(
        " Apoh",
        "https://images.t2u.io/upload/event/section/0c87db9e-7a67-4f5b-9970-7e7dd856b0c3.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/APOH.pdf"),
    AdoptItem(
        " Miko",
        "https://images.t2u.io/upload/event/section/050315a8-3985-49a4-8363-1f526119a894.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/MIKO.pdf"),
    AdoptItem(
        " White Tiger",
        "https://images.t2u.io/upload/event/section/742b840f-5889-4658-9668-506ec024d9f5.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/WHITE-TIGER.pdf"),
    AdoptItem(
        " Panjang",
        "https://images.t2u.io/upload/event/section/de35657b-304a-4fb4-8669-975374e13d83.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/PANJANG.pdf "),
    AdoptItem(
        " Giraffe",
        "https://images.t2u.io/upload/event/section/2a66a05d-4d90-420b-ab48-c6bacece1eea.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/GIRAFFE.pdf"),
    AdoptItem(
        " Samba",
        "https://images.t2u.io/upload/event/section/dfc972bb-57f5-4608-bc83-3b1217df7f4d.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/SAMBA.pdf"),
    AdoptItem(
        " Choki",
        "https://images.t2u.io/upload/event/section/61303ada-adea-4f99-8256-7993193fbc78.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/CHOKI.pdf"),
    AdoptItem(
        " Ben",
        "https://images.t2u.io/upload/event/section/8433ddc7-08fb-485d-ade8-dab9df4954a0.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/BEN.pdf"),
    AdoptItem(
        " Omi",
        "https://images.t2u.io/upload/event/section/55308b3d-0f10-41da-b6da-b037b0d868eb.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/OMI.pdf"),
    AdoptItem(
        " Scarface",
        "https://images.t2u.io/upload/event/section/8d63c8ec-9369-4835-bc6a-ec2080d8186b.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/SCARFACE.pdf "),
    AdoptItem(
        " Penguins",
        "https://images.t2u.io/upload/event/section/69620bd7-eae1-416b-9478-e7862b2c612b.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/PENGUINS.pdf"),
    AdoptItem(
        " Sibol",
        "https://images.t2u.io/upload/event/section/e2a14ae7-94df-458d-af1e-ec9f66800eb6.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/SIBOL.pdf"),
    AdoptItem(
        " Lela",
        "https://images.t2u.io/upload/event/section/adfd9c9e-81f1-47ad-b10b-6e4c6c766d99.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/LELA.pdf"),
    AdoptItem(
        " Jessy",
        "https://images.t2u.io/upload/event/section/d2c24fd3-9166-418f-aa70-7acd4a91debd.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/JESSY.pdf"),
    AdoptItem(
        " YiYi",
        "https://images.t2u.io/upload/event/section/36ff0369-b48f-4fd4-ade0-9237b44fa59c.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/YI-YI.pdf"),
    AdoptItem(
        " Peacock",
        "https://images.t2u.io/upload/event/section/75f88652-8710-4fc2-81f8-88a288a451a1.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/PEACOCK.pdf"),
    AdoptItem(
        " Kenyalang",
        "https://images.t2u.io/upload/event/section/01327296-7b5c-4a4a-a736-32cf00d1f2f5.jpeg",
        " https://www.zoonegaramalaysia.my/adoption2020/KENYALANG.pdf"),
    AdoptItem(
        " Jenny",
        "https://images.t2u.io/upload/event/section/7eea9940-eb40-4bcd-bde5-28ef02e33fa4.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/JENNY.pdf"),
    AdoptItem(
        " Otter",
        "https://images.t2u.io/upload/event/section/cf89df63-0abb-49a0-bcf9-17ad5b0bd125.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/OTTER.pdf"),
    AdoptItem(
        " Bornean Horned Frog",
        "https://images.t2u.io/upload/event/section/2e8822cc-aad4-41ea-8ed4-a8a9663af788.jpg",
        "https://www.zoonegaramalaysia.my/adoption2020/FROG.pdf"),
    AdoptItem(
        " Stag Beetle",
        "https://images.t2u.io/upload/event/section/db042602-152f-4755-8114-62a107c0d444.jpeg",
        "https://www.zoonegaramalaysia.my/adoption2020/STAG-BEETLE.pdf"),
    AdoptItem(
        " Manja Ella",
        "https://images.t2u.io/upload/event/section/19cfe43e-2638-453c-96b8-023c33749342.jpeg",
        " "),
    AdoptItem(
        " Jati",
        "https://images.t2u.io/upload/event/section/c7f876d3-d3c4-400c-827b-e74b2e2e8301.jpeg",
        " "),
    AdoptItem(
        " Dash",
        "https://images.t2u.io/upload/event/section/be63bd3f-86f1-4f56-b310-64a87ca7954a.jpeg",
        " "),
    AdoptItem(
        " Romeo",
        "https://images.t2u.io/upload/event/section/9965e809-64b0-4039-9abc-beff5414bb01.jpeg",
        " "),
    AdoptItem(
        " Capybaras",
        "https://images.t2u.io/upload/event/section/376dd171-865c-45f0-a611-a164f94293c3.jpeg",
        " "),
    AdoptItem(
        " Max",
        "https://images.t2u.io/upload/event/section/c4010721-fe6b-4526-a106-913e378de0a9.jpeg",
        " "),
    AdoptItem(
        " Mango",
        "https://images.t2u.io/upload/event/section/11b18398-8e27-49d7-a123-6db882ea6825.jpeg",
        " "),
    AdoptItem(
        " Yellow",
        "https://images.t2u.io/upload/event/section/f871cbd0-247e-4290-93ab-1b3ef144ea9c.jpeg",
        " "),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: adopts.length,
      itemBuilder: (BuildContext context, int index) {
        AdoptItem item = adopts[index];
        return Card(
            elevation: 3,
            child: MaterialButton(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 125,
                      width: 100,
                      padding: EdgeInsets.only(
                          left: 0, top: 10, bottom: 70, right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item.image),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.title,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onPressed: () => launch(item.action)));
      },
    );
  }
}
