part of 'news_page.dart';

Widget _newsList(context) {
  BlocProvider.of<NewsCubit>(context).fetchNews();
  return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
    if (!(state is NewsLoaded))
      return Center(child: CircularProgressIndicator());
    final newsList = (state).newsList;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
          return newsList.map((e) => _newsItem(e, context)).toList()[index];
        });
  });
}

Widget _newsItem(News newsItem, context) {
  return Row(
    children: [
      Text(newsItem.title),
      if (newsItem.image != null) ImageExternalWidget(url: newsItem.image!),
      HtmlWidget(data: newsItem.body)
    ],
  );
}
