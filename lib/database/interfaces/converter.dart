abstract class Converter<TModel> {
  TModel fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(TModel model);
}