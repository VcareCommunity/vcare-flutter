import 'package:chopper/chopper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_service.chopper.dart';
part 'config_service.g.dart';

@JsonSerializable()
class ConfigResp {
  String community;
  String version;

  ConfigResp({required this.community, required this.version});

  factory ConfigResp.fromJson(Map<String, dynamic> json) => _$ConfigRespFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigRespToJson(this);
}

@ChopperApi()
abstract class ConfigService extends ChopperService {
  static ConfigService create([ChopperClient? client]) =>
      _$ConfigService(client);

  @Get(path: "public/config/mobile")
  Future<Response<Map<String, dynamic>>> getVcareConfig();
}
