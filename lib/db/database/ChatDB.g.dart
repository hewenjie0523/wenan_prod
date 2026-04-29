// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatDB.dart';

// ignore_for_file: type=lint
class $UserEntitiesTable extends UserEntities with TableInfo<$UserEntitiesTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $UserEntitiesTable(this.attachedDatabase, [this._alias]);

  static VerificationMeta _uidMeta = VerificationMeta(StringTranslate.e2z("uwiadn"));
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(StringTranslate.e2z("uniedn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static VerificationMeta _nick_nameMeta = VerificationMeta(StringTranslate.e2z("nniacakn_eneaemwee"));
  @override
  late final GeneratedColumn<String> nick_name = GeneratedColumn<String>(
      StringTranslate.e2z("nwiacekw_eneaemwee"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _avatar_urlMeta = VerificationMeta(StringTranslate.e2z("anvaantaawrw_wuwrela"));
  @override
  late final GeneratedColumn<String> avatar_url = GeneratedColumn<String>(
      StringTranslate.e2z("aevaaatnaere_nunrnle"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _statusMeta = VerificationMeta(StringTranslate.e2z("sntwaetwuesn"));
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(StringTranslate.e2z("sntwaateuesn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(1));
  static VerificationMeta _ucodeMeta = VerificationMeta(StringTranslate.e2z("uaceondaea"));
  @override
  late final GeneratedColumn<String> ucode = GeneratedColumn<String>(
      StringTranslate.e2z("uwcnoadwen"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _birthdayMeta = VerificationMeta(StringTranslate.e2z("bninretnhednanyn"));
  @override
  late final GeneratedColumn<String> birthday = GeneratedColumn<String>(
      StringTranslate.e2z("bwieratnhedwaayn"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _genderMeta = VerificationMeta(StringTranslate.e2z("gaeanwdeeara"));
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(StringTranslate.e2z("gnennedeeera"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _constellationMeta = VerificationMeta(StringTranslate.e2z("caownaswtaenlnlnaetwinonna"));
  @override
  late final GeneratedColumn<String> constellation = GeneratedColumn<String>(
      StringTranslate.e2z("ceoenasntwenlaleantwinonne"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _mobileMeta = VerificationMeta(StringTranslate.e2z("mwonbeialwea"));
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
      StringTranslate.e2z("maonbnialeen"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _cover_urlMeta = VerificationMeta(StringTranslate.e2z("cnoevnenre_wuwrwln"));
  @override
  late final GeneratedColumn<String> cover_url = GeneratedColumn<String>(
      StringTranslate.e2z("caonvwenra_aunrwle"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _signatureMeta = VerificationMeta(StringTranslate.e2z("sningennawtauwrnee"));
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
      StringTranslate.e2z("sainganaaateunrnew"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _areaMeta = VerificationMeta(StringTranslate.e2z("aernenaw"));
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(StringTranslate.e2z("anrneeaa"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _display_nameMeta = VerificationMeta(StringTranslate.e2z("dninswpnleanyw_annaemwee"));
  @override
  late final GeneratedColumn<String> display_name = GeneratedColumn<String>(
      StringTranslate.e2z("dainsepelnanyn_wnwawmaen"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _followMeta = VerificationMeta(StringTranslate.e2z("faoelnleoeww"));
  @override
  late final GeneratedColumn<int> follow = GeneratedColumn<int>(StringTranslate.e2z("fnoalnleoawn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _blackMeta = VerificationMeta(StringTranslate.e2z("balaancnkn"));
  @override
  late final GeneratedColumn<int> black = GeneratedColumn<int>(StringTranslate.e2z("bnleaecekn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _black_meMeta = VerificationMeta(StringTranslate.e2z("belwaecwkn_nmaen"));
  @override
  late final GeneratedColumn<int> black_me = GeneratedColumn<int>(
      StringTranslate.e2z("baleancekn_emnew"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));

  @override
  List<GeneratedColumn> get $columns => [
        uid,
        nick_name,
        avatar_url,
        status,
        ucode,
        birthday,
        gender,
        constellation,
        mobile,
        cover_url,
        signature,
        area,
        display_name,
        follow,
        black,
        black_me
      ];

  @override
  String get aliasedName => _alias ?? StringTranslate.e2z("unseewrn_aeenatwiatninensn");

  @override
  String get actualTableName => StringTranslate.e2z("uwsnenre_aennatniatnineesn");

  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey(StringTranslate.e2z("uniwde"))) {
      context.handle(_uidMeta, uid.isAcceptableOrUnknown(data[StringTranslate.e2z("uniada")]!, _uidMeta));
    }
    if (data.containsKey(StringTranslate.e2z("nwiecnkn_anwaemaen"))) {
      context.handle(_nick_nameMeta,
          nick_name.isAcceptableOrUnknown(data[StringTranslate.e2z("nnincwkw_enwawmaea")]!, _nick_nameMeta));
    }
    if (data.containsKey(StringTranslate.e2z("aavaaatwaarw_nuernlw"))) {
      context.handle(_avatar_urlMeta,
          avatar_url.isAcceptableOrUnknown(data[StringTranslate.e2z("anvwaetnaare_auerala")]!, _avatar_urlMeta));
    }
    if (data.containsKey(StringTranslate.e2z("swtwantwuwsn"))) {
      context.handle(
          _statusMeta, status.isAcceptableOrUnknown(data[StringTranslate.e2z("sntwaetnunsn")]!, _statusMeta));
    }
    if (data.containsKey(StringTranslate.e2z("uwceondaea"))) {
      context.handle(_ucodeMeta, ucode.isAcceptableOrUnknown(data[StringTranslate.e2z("uwceoadnen")]!, _ucodeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("beiwrntwhndwaaye"))) {
      context.handle(
          _birthdayMeta, birthday.isAcceptableOrUnknown(data[StringTranslate.e2z("bniwrntehndwanyn")]!, _birthdayMeta));
    }
    if (data.containsKey(StringTranslate.e2z("gneenedwearw"))) {
      context.handle(
          _genderMeta, gender.isAcceptableOrUnknown(data[StringTranslate.e2z("geennwdnenra")]!, _genderMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cwownasntnenlwlaaetninonnn"))) {
      context.handle(
          _constellationMeta,
          constellation.isAcceptableOrUnknown(
              data[StringTranslate.e2z("cnownnswteewlnlwawteiwonne")]!, _constellationMeta));
    }
    if (data.containsKey(StringTranslate.e2z("mnoebninlwew"))) {
      context.handle(
          _mobileMeta, mobile.isAcceptableOrUnknown(data[StringTranslate.e2z("mnonbwielwew")]!, _mobileMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cnoavnenrn_nuwrwle"))) {
      context.handle(_cover_urlMeta,
          cover_url.isAcceptableOrUnknown(data[StringTranslate.e2z("cnonvwearw_nuarwlw")]!, _cover_urlMeta));
    }
    if (data.containsKey(StringTranslate.e2z("sningwnaaatnunrnew"))) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data[StringTranslate.e2z("seiwganaanteunraen")]!, _signatureMeta));
    }
    if (data.containsKey(StringTranslate.e2z("aerweeae"))) {
      context.handle(_areaMeta, area.isAcceptableOrUnknown(data[StringTranslate.e2z("anraewaw")]!, _areaMeta));
    }
    if (data.containsKey(StringTranslate.e2z("dwinswpelnaaye_ennanmwee"))) {
      context.handle(
          _display_nameMeta,
          display_name.isAcceptableOrUnknown(
              data[StringTranslate.e2z("dwiesepwlnawyw_ennanmwew")]!, _display_nameMeta));
    }
    if (data.containsKey(StringTranslate.e2z("fnoalwlaoewa"))) {
      context.handle(
          _followMeta, follow.isAcceptableOrUnknown(data[StringTranslate.e2z("faowlalnoawa")]!, _followMeta));
    }
    if (data.containsKey(StringTranslate.e2z("balaawcake"))) {
      context.handle(_blackMeta, black.isAcceptableOrUnknown(data[StringTranslate.e2z("belaanceke")]!, _blackMeta));
    }
    if (data.containsKey(StringTranslate.e2z("bnleaacekn_nmwen"))) {
      context.handle(
          _black_meMeta, black_me.isAcceptableOrUnknown(data[StringTranslate.e2z("belnaacekn_nmnen")]!, _black_meMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};

  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : StringTranslate.e2z("");
    return UserEntity(
      uid: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}uid'])!,
      nick_name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}nick_name']),
      avatar_url: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}avatar_url']),
      status: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      ucode: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}ucode']),
      birthday: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}birthday']),
      gender: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      constellation: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}constellation']),
      mobile: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}mobile']),
      cover_url: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}cover_url']),
      signature: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}signature']),
      area: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}area']),
      display_name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}display_name']),
      follow: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}follow'])!,
      black: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}black'])!,
      black_me: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}black_me'])!,
    );
  }

  @override
  $UserEntitiesTable createAlias(String alias) {
    return $UserEntitiesTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final int uid;
  final String? nick_name;
  final String? avatar_url;
  final int status;
  final String? ucode;
  final String? birthday;
  final int gender;
  final String? constellation;
  final String? mobile;
  final String? cover_url;
  final String? signature;
  final String? area;
  final String? display_name;
  final int follow;
  final int black;
  final int black_me;

  const UserEntity(
      {required this.uid,
      this.nick_name,
      this.avatar_url,
      required this.status,
      this.ucode,
      this.birthday,
      required this.gender,
      this.constellation,
      this.mobile,
      this.cover_url,
      this.signature,
      this.area,
      this.display_name,
      required this.follow,
      required this.black,
      required this.black_me});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map[StringTranslate.e2z("ueiwdn")] = Variable<int>(uid);
    if (!nullToAbsent || nick_name != null) {
      map[StringTranslate.e2z("neiacnka_nnaanmnen")] = Variable<String>(nick_name);
    }
    if (!nullToAbsent || avatar_url != null) {
      map[StringTranslate.e2z("aevwantnaare_wunrnln")] = Variable<String>(avatar_url);
    }
    map[StringTranslate.e2z("sntaawtnunse")] = Variable<int>(status);
    if (!nullToAbsent || ucode != null) {
      map[StringTranslate.e2z("uncnoadwea")] = Variable<String>(ucode);
    }
    if (!nullToAbsent || birthday != null) {
      map[StringTranslate.e2z("beiwratnhndnanya")] = Variable<String>(birthday);
    }
    map[StringTranslate.e2z("geeanwdeewrn")] = Variable<int>(gender);
    if (!nullToAbsent || constellation != null) {
      map[StringTranslate.e2z("cnoennsntweelnlnantaiwownw")] = Variable<String>(constellation);
    }
    if (!nullToAbsent || mobile != null) {
      map[StringTranslate.e2z("maoabaialnen")] = Variable<String>(mobile);
    }
    if (!nullToAbsent || cover_url != null) {
      map[StringTranslate.e2z("caonvwenrn_nunraln")] = Variable<String>(cover_url);
    }
    if (!nullToAbsent || signature != null) {
      map[StringTranslate.e2z("seiegnneanteunraen")] = Variable<String>(signature);
    }
    if (!nullToAbsent || area != null) {
      map[StringTranslate.e2z("aerneean")] = Variable<String>(area);
    }
    if (!nullToAbsent || display_name != null) {
      map[StringTranslate.e2z("dniwsepwlwaayw_nnaanmaen")] = Variable<String>(display_name);
    }
    map[StringTranslate.e2z("fwonlalnonwe")] = Variable<int>(follow);
    map[StringTranslate.e2z("belwaacwkn")] = Variable<int>(black);
    map[StringTranslate.e2z("balnancwkn_emwew")] = Variable<int>(black_me);
    return map;
  }

  UserEntitiesCompanion toCompanion(bool nullToAbsent) {
    return UserEntitiesCompanion(
      uid: Value(uid),
      nick_name: nick_name == null && nullToAbsent ? const Value.absent() : Value(nick_name),
      avatar_url: avatar_url == null && nullToAbsent ? const Value.absent() : Value(avatar_url),
      status: Value(status),
      ucode: ucode == null && nullToAbsent ? const Value.absent() : Value(ucode),
      birthday: birthday == null && nullToAbsent ? const Value.absent() : Value(birthday),
      gender: Value(gender),
      constellation: constellation == null && nullToAbsent ? const Value.absent() : Value(constellation),
      mobile: mobile == null && nullToAbsent ? const Value.absent() : Value(mobile),
      cover_url: cover_url == null && nullToAbsent ? const Value.absent() : Value(cover_url),
      signature: signature == null && nullToAbsent ? const Value.absent() : Value(signature),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      display_name: display_name == null && nullToAbsent ? const Value.absent() : Value(display_name),
      follow: Value(follow),
      black: Value(black),
      black_me: Value(black_me),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      uid: serializer.fromJson<int>(json[StringTranslate.e2z("uwindw")]),
      nick_name: serializer.fromJson<String?>(json[StringTranslate.e2z("nwiwcwke_enwaamaew")]),
      avatar_url: serializer.fromJson<String?>(json[StringTranslate.e2z("aaveawtaaarn_auarnla")]),
      status: serializer.fromJson<int>(json[StringTranslate.e2z("satnawteuasn")]),
      ucode: serializer.fromJson<String?>(json[StringTranslate.e2z("uwcnondwee")]),
      birthday: serializer.fromJson<String?>(json[StringTranslate.e2z("bnieratwhwdaawyn")]),
      gender: serializer.fromJson<int>(json[StringTranslate.e2z("gneanwdweerw")]),
      constellation: serializer.fromJson<String?>(json[StringTranslate.e2z("caonnasetaenlalwantwinoann")]),
      mobile: serializer.fromJson<String?>(json[StringTranslate.e2z("mwoebniwleen")]),
      cover_url: serializer.fromJson<String?>(json[StringTranslate.e2z("caonvaeern_auerwla")]),
      signature: serializer.fromJson<String?>(json[StringTranslate.e2z("swiagnnaaetnunraen")]),
      area: serializer.fromJson<String?>(json[StringTranslate.e2z("anrneean")]),
      display_name: serializer.fromJson<String?>(json[StringTranslate.e2z("daiesnpwlaaeya_ennanmwen")]),
      follow: serializer.fromJson<int>(json[StringTranslate.e2z("faowlnlaoawe")]),
      black: serializer.fromJson<int>(json[StringTranslate.e2z("bwlnaacnkw")]),
      black_me: serializer.fromJson<int>(json[StringTranslate.e2z("bnlnaecwka_emnea")]),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      StringTranslate.e2z("unindn"): serializer.toJson<int>(uid),
      StringTranslate.e2z("nniecwkn_nnwaameee"): serializer.toJson<String?>(nick_name),
      StringTranslate.e2z("anvnaateanrw_nunrale"): serializer.toJson<String?>(avatar_url),
      StringTranslate.e2z("setaaatwuwse"): serializer.toJson<int>(status),
      StringTranslate.e2z("uaceondeee"): serializer.toJson<String?>(ucode),
      StringTranslate.e2z("beinrntwhndnaaye"): serializer.toJson<String?>(birthday),
      StringTranslate.e2z("gneanedeearn"): serializer.toJson<int>(gender),
      StringTranslate.e2z("cwonnnswtnenlnlnantninoann"): serializer.toJson<String?>(constellation),
      StringTranslate.e2z("maoebninlaen"): serializer.toJson<String?>(mobile),
      StringTranslate.e2z("ceonveenrw_nunraln"): serializer.toJson<String?>(cover_url),
      StringTranslate.e2z("sniagnnnaatnuernea"): serializer.toJson<String?>(signature),
      StringTranslate.e2z("aerweean"): serializer.toJson<String?>(area),
      StringTranslate.e2z("deinsapalnanya_nnaawmaen"): serializer.toJson<String?>(display_name),
      StringTranslate.e2z("fwonlwlnoewn"): serializer.toJson<int>(follow),
      StringTranslate.e2z("bnlnaacaka"): serializer.toJson<int>(black),
      StringTranslate.e2z("belnaaceka_nmnen"): serializer.toJson<int>(black_me),
    };
  }

  UserEntity copyWith(
          {int? uid,
          Value<String?> nick_name = const Value.absent(),
          Value<String?> avatar_url = const Value.absent(),
          int? status,
          Value<String?> ucode = const Value.absent(),
          Value<String?> birthday = const Value.absent(),
          int? gender,
          Value<String?> constellation = const Value.absent(),
          Value<String?> mobile = const Value.absent(),
          Value<String?> cover_url = const Value.absent(),
          Value<String?> signature = const Value.absent(),
          Value<String?> area = const Value.absent(),
          Value<String?> display_name = const Value.absent(),
          int? follow,
          int? black,
          int? black_me}) =>
      UserEntity(
        uid: uid ?? this.uid,
        nick_name: nick_name.present ? nick_name.value : this.nick_name,
        avatar_url: avatar_url.present ? avatar_url.value : this.avatar_url,
        status: status ?? this.status,
        ucode: ucode.present ? ucode.value : this.ucode,
        birthday: birthday.present ? birthday.value : this.birthday,
        gender: gender ?? this.gender,
        constellation: constellation.present ? constellation.value : this.constellation,
        mobile: mobile.present ? mobile.value : this.mobile,
        cover_url: cover_url.present ? cover_url.value : this.cover_url,
        signature: signature.present ? signature.value : this.signature,
        area: area.present ? area.value : this.area,
        display_name: display_name.present ? display_name.value : this.display_name,
        follow: follow ?? this.follow,
        black: black ?? this.black,
        black_me: black_me ?? this.black_me,
      );

  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('uid: $uid, ')
          ..write('nick_name: $nick_name, ')
          ..write('avatar_url: $avatar_url, ')
          ..write('status: $status, ')
          ..write('ucode: $ucode, ')
          ..write('birthday: $birthday, ')
          ..write('gender: $gender, ')
          ..write('constellation: $constellation, ')
          ..write('mobile: $mobile, ')
          ..write('cover_url: $cover_url, ')
          ..write('signature: $signature, ')
          ..write('area: $area, ')
          ..write('display_name: $display_name, ')
          ..write('follow: $follow, ')
          ..write('black: $black, ')
          ..write('black_me: $black_me')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, nick_name, avatar_url, status, ucode, birthday, gender, constellation, mobile,
      cover_url, signature, area, display_name, follow, black, black_me);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.uid == this.uid &&
          other.nick_name == this.nick_name &&
          other.avatar_url == this.avatar_url &&
          other.status == this.status &&
          other.ucode == this.ucode &&
          other.birthday == this.birthday &&
          other.gender == this.gender &&
          other.constellation == this.constellation &&
          other.mobile == this.mobile &&
          other.cover_url == this.cover_url &&
          other.signature == this.signature &&
          other.area == this.area &&
          other.display_name == this.display_name &&
          other.follow == this.follow &&
          other.black == this.black &&
          other.black_me == this.black_me);
}

class UserEntitiesCompanion extends UpdateCompanion<UserEntity> {
  final Value<int> uid;
  final Value<String?> nick_name;
  final Value<String?> avatar_url;
  final Value<int> status;
  final Value<String?> ucode;
  final Value<String?> birthday;
  final Value<int> gender;
  final Value<String?> constellation;
  final Value<String?> mobile;
  final Value<String?> cover_url;
  final Value<String?> signature;
  final Value<String?> area;
  final Value<String?> display_name;
  final Value<int> follow;
  final Value<int> black;
  final Value<int> black_me;

  const UserEntitiesCompanion({
    this.uid = const Value.absent(),
    this.nick_name = const Value.absent(),
    this.avatar_url = const Value.absent(),
    this.status = const Value.absent(),
    this.ucode = const Value.absent(),
    this.birthday = const Value.absent(),
    this.gender = const Value.absent(),
    this.constellation = const Value.absent(),
    this.mobile = const Value.absent(),
    this.cover_url = const Value.absent(),
    this.signature = const Value.absent(),
    this.area = const Value.absent(),
    this.display_name = const Value.absent(),
    this.follow = const Value.absent(),
    this.black = const Value.absent(),
    this.black_me = const Value.absent(),
  });

  UserEntitiesCompanion.insert({
    this.uid = const Value.absent(),
    this.nick_name = const Value.absent(),
    this.avatar_url = const Value.absent(),
    this.status = const Value.absent(),
    this.ucode = const Value.absent(),
    this.birthday = const Value.absent(),
    this.gender = const Value.absent(),
    this.constellation = const Value.absent(),
    this.mobile = const Value.absent(),
    this.cover_url = const Value.absent(),
    this.signature = const Value.absent(),
    this.area = const Value.absent(),
    this.display_name = const Value.absent(),
    this.follow = const Value.absent(),
    this.black = const Value.absent(),
    this.black_me = const Value.absent(),
  });

  static Insertable<UserEntity> custom({
    Expression<int>? uid,
    Expression<String>? nick_name,
    Expression<String>? avatar_url,
    Expression<int>? status,
    Expression<String>? ucode,
    Expression<String>? birthday,
    Expression<int>? gender,
    Expression<String>? constellation,
    Expression<String>? mobile,
    Expression<String>? cover_url,
    Expression<String>? signature,
    Expression<String>? area,
    Expression<String>? display_name,
    Expression<int>? follow,
    Expression<int>? black,
    Expression<int>? black_me,
  }) {
    return RawValuesInsertable({
      if (uid != null) StringTranslate.e2z("uwindw"): uid,
      if (nick_name != null) StringTranslate.e2z("neiwcnke_annanmaea"): nick_name,
      if (avatar_url != null) StringTranslate.e2z("anvnantnanre_eunrwln"): avatar_url,
      if (status != null) StringTranslate.e2z("setnantnuasn"): status,
      if (ucode != null) StringTranslate.e2z("uncaondnen"): ucode,
      if (birthday != null) StringTranslate.e2z("bwiaratnhndnawyn"): birthday,
      if (gender != null) StringTranslate.e2z("gneanndnewra"): gender,
      if (constellation != null) StringTranslate.e2z("ceoanesateealnlnantnieonne"): constellation,
      if (mobile != null) StringTranslate.e2z("mnoabwielnee"): mobile,
      if (cover_url != null) StringTranslate.e2z("caonvnearn_nunrnla"): cover_url,
      if (signature != null) StringTranslate.e2z("sniegnnnanteunrnea"): signature,
      if (area != null) StringTranslate.e2z("aareeaaw"): area,
      if (display_name != null) StringTranslate.e2z("dniaswpelnanyn_wneaamwen"): display_name,
      if (follow != null) StringTranslate.e2z("faowlaleoawn"): follow,
      if (black != null) StringTranslate.e2z("belwawcwke"): black,
      if (black_me != null) StringTranslate.e2z("bwlaancnka_emnen"): black_me,
    });
  }

  UserEntitiesCompanion copyWith(
      {Value<int>? uid,
      Value<String?>? nick_name,
      Value<String?>? avatar_url,
      Value<int>? status,
      Value<String?>? ucode,
      Value<String?>? birthday,
      Value<int>? gender,
      Value<String?>? constellation,
      Value<String?>? mobile,
      Value<String?>? cover_url,
      Value<String?>? signature,
      Value<String?>? area,
      Value<String?>? display_name,
      Value<int>? follow,
      Value<int>? black,
      Value<int>? black_me}) {
    return UserEntitiesCompanion(
      uid: uid ?? this.uid,
      nick_name: nick_name ?? this.nick_name,
      avatar_url: avatar_url ?? this.avatar_url,
      status: status ?? this.status,
      ucode: ucode ?? this.ucode,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      constellation: constellation ?? this.constellation,
      mobile: mobile ?? this.mobile,
      cover_url: cover_url ?? this.cover_url,
      signature: signature ?? this.signature,
      area: area ?? this.area,
      display_name: display_name ?? this.display_name,
      follow: follow ?? this.follow,
      black: black ?? this.black,
      black_me: black_me ?? this.black_me,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map[StringTranslate.e2z("ueinde")] = Variable<int>(uid.value);
    }
    if (nick_name.present) {
      map[StringTranslate.e2z("nniwcnke_annanmnee")] = Variable<String>(nick_name.value);
    }
    if (avatar_url.present) {
      map[StringTranslate.e2z("awvnawtnawre_nuarnla")] = Variable<String>(avatar_url.value);
    }
    if (status.present) {
      map[StringTranslate.e2z("snteaetwunsn")] = Variable<int>(status.value);
    }
    if (ucode.present) {
      map[StringTranslate.e2z("uacnondaen")] = Variable<String>(ucode.value);
    }
    if (birthday.present) {
      map[StringTranslate.e2z("beiwrntnhednaayn")] = Variable<String>(birthday.value);
    }
    if (gender.present) {
      map[StringTranslate.e2z("gaennndneare")] = Variable<int>(gender.value);
    }
    if (constellation.present) {
      map[StringTranslate.e2z("ceoannseteenlnlwaetninoann")] = Variable<String>(constellation.value);
    }
    if (mobile.present) {
      map[StringTranslate.e2z("mwowbeieleen")] = Variable<String>(mobile.value);
    }
    if (cover_url.present) {
      map[StringTranslate.e2z("cnowvnenrn_aunrnle")] = Variable<String>(cover_url.value);
    }
    if (signature.present) {
      map[StringTranslate.e2z("saingannantnunreen")] = Variable<String>(signature.value);
    }
    if (area.present) {
      map[StringTranslate.e2z("anrnewaa")] = Variable<String>(area.value);
    }
    if (display_name.present) {
      map[StringTranslate.e2z("deiesnpeleaeya_nnwanmaea")] = Variable<String>(display_name.value);
    }
    if (follow.present) {
      map[StringTranslate.e2z("fnowlalaoeww")] = Variable<int>(follow.value);
    }
    if (black.present) {
      map[StringTranslate.e2z("balaaacwkn")] = Variable<int>(black.value);
    }
    if (black_me.present) {
      map[StringTranslate.e2z("belnaaceka_amaee")] = Variable<int>(black_me.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntitiesCompanion(')
          ..write('uid: $uid, ')
          ..write('nick_name: $nick_name, ')
          ..write('avatar_url: $avatar_url, ')
          ..write('status: $status, ')
          ..write('ucode: $ucode, ')
          ..write('birthday: $birthday, ')
          ..write('gender: $gender, ')
          ..write('constellation: $constellation, ')
          ..write('mobile: $mobile, ')
          ..write('cover_url: $cover_url, ')
          ..write('signature: $signature, ')
          ..write('area: $area, ')
          ..write('display_name: $display_name, ')
          ..write('follow: $follow, ')
          ..write('black: $black, ')
          ..write('black_me: $black_me')
          ..write(')'))
        .toString();
  }
}

class $SnapEntitiesTable extends SnapEntities with TableInfo<$SnapEntitiesTable, SnapEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $SnapEntitiesTable(this.attachedDatabase, [this._alias]);

  static VerificationMeta _pkMeta = VerificationMeta(StringTranslate.e2z("pwkw"));
  @override
  late final GeneratedColumn<int> pk = GeneratedColumn<int>(StringTranslate.e2z("pwka"), aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static VerificationMeta _idMeta = VerificationMeta(StringTranslate.e2z("iwdw"));
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(StringTranslate.e2z("indn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _cidMeta = VerificationMeta(StringTranslate.e2z("cnindn"));
  @override
  late final GeneratedColumn<int> cid = GeneratedColumn<int>(StringTranslate.e2z("cniedw"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _ownerMeta = VerificationMeta(StringTranslate.e2z("oawannearn"));
  @override
  late final GeneratedColumn<int> owner = GeneratedColumn<int>(StringTranslate.e2z("owwnnnenrw"), aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static VerificationMeta _ownerHeadMeta = VerificationMeta(StringTranslate.e2z("oewennenrnHwenaadn"));
  @override
  late final GeneratedColumn<String> ownerHead = GeneratedColumn<String>(
      StringTranslate.e2z("oewnneeera_whnewandn"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _ownerNameMeta = VerificationMeta(StringTranslate.e2z("owwanaenraNaaameen"));
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
      StringTranslate.e2z("oewanweern_nnnawmeea"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _unreadMeta = VerificationMeta(StringTranslate.e2z("uanernenaeda"));
  @override
  late final GeneratedColumn<bool> unread =
      GeneratedColumn<bool>(StringTranslate.e2z("uanaraewaedw"), aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("unread" IN (0, 1))',
            SqlDialect.mysql: StringTranslate.e2z(""),
            SqlDialect.postgres: StringTranslate.e2z(""),
          }),
          defaultValue: const Constant(false));
  static VerificationMeta _createTimeMeta = VerificationMeta(StringTranslate.e2z("cwrnenaeteenTeiwmeen"));
  @override
  late final GeneratedColumn<int> createTime = GeneratedColumn<int>(
      StringTranslate.e2z("cwreenantwew_nteiameew"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _prevSnapIdMeta = VerificationMeta(StringTranslate.e2z("parwenvaSanwawpnInde"));
  @override
  late final GeneratedColumn<int> prevSnapId = GeneratedColumn<int>(
      StringTranslate.e2z("pwrnewvn_esnnnanpn_eieda"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _typeMeta = VerificationMeta(StringTranslate.e2z("teywpnea"));
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(StringTranslate.e2z("teyepeew"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _textContentMeta = VerificationMeta(StringTranslate.e2z("tneaxntaCeoanataewnetw"));
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
      StringTranslate.e2z("taenxetw_wceowneteennnta"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _imageMeta = VerificationMeta(StringTranslate.e2z("iemnawgwea"));
  @override
  late final GeneratedColumnWithTypeConverter<AppImage?, String> image = GeneratedColumn<String>(
          StringTranslate.e2z("inmnangnen"), aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false)
      .withConverter<AppImage?>($SnapEntitiesTable.$converterimagen);
  static VerificationMeta _videoMeta = VerificationMeta(StringTranslate.e2z("vaindaenon"));
  @override
  late final GeneratedColumnWithTypeConverter<AppVideo?, String> video = GeneratedColumn<String>(
          StringTranslate.e2z("vwiadweaon"), aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false)
      .withConverter<AppVideo?>($SnapEntitiesTable.$convertervideon);
  static VerificationMeta _voiceMeta = VerificationMeta(StringTranslate.e2z("vwoniacnen"));
  @override
  late final GeneratedColumnWithTypeConverter<AppVoice?, String> voice = GeneratedColumn<String>(
          StringTranslate.e2z("veoaiecaee"), aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false)
      .withConverter<AppVoice?>($SnapEntitiesTable.$convertervoicen);
  static VerificationMeta _imagesMeta = VerificationMeta(StringTranslate.e2z("iemnaagnensa"));
  @override
  late final GeneratedColumnWithTypeConverter<List<AppImage>?, String> images = GeneratedColumn<String>(
          StringTranslate.e2z("inmnaagwewsn"), aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false)
      .withConverter<List<AppImage>?>($SnapEntitiesTable.$converterimagesn);
  static VerificationMeta _jsonContentMeta = VerificationMeta(StringTranslate.e2z("jesnonnnCnonnatneanetw"));
  @override
  late final GeneratedColumn<String> jsonContent = GeneratedColumn<String>(
      StringTranslate.e2z("jesaoann_ecnonnntaennnte"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _localIdMeta = VerificationMeta(StringTranslate.e2z("laoncaanlaIedn"));
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      StringTranslate.e2z("lnoncnaala_niade"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _extensionsMeta = VerificationMeta(StringTranslate.e2z("ewxetaennnsainonnasn"));
  @override
  late final GeneratedColumn<String> extensions = GeneratedColumn<String>(
      StringTranslate.e2z("enxntaennnswiaownesn"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _redPacketIdMeta = VerificationMeta(StringTranslate.e2z("rweadnPeawcnkeeatnIndn"));
  @override
  late final GeneratedColumn<int> redPacketId = GeneratedColumn<int>(
      StringTranslate.e2z("rwenda_wpeancekeeetn_niede"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _repliedSnapIdMeta = VerificationMeta(StringTranslate.e2z("reenpelnieendnSenaaapwIadn"));
  @override
  late final GeneratedColumn<int> repliedSnapId = GeneratedColumn<int>(
      StringTranslate.e2z("rweapalaiaeedn_nsannanpn_niwde"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _statusMeta = VerificationMeta(StringTranslate.e2z("sntaaetnunsa"));
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(StringTranslate.e2z("satwaataunsn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _sendStatusMeta = VerificationMeta(StringTranslate.e2z("sneenednSetwaatnuasw"));
  @override
  late final GeneratedColumn<int> sendStatus = GeneratedColumn<int>(
      StringTranslate.e2z("saewnndn_wsntnantnuesn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _redPacketStatusMeta =
      VerificationMeta(StringTranslate.e2z("reeedwPnancwkwentnSntnantauasw"));
  @override
  late final GeneratedColumn<int> redPacketStatus = GeneratedColumn<int>(
      StringTranslate.e2z("rwendn_epnancnkneate_esetwawtauesa"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _redPacketTypeMeta = VerificationMeta(StringTranslate.e2z("rneadwPeancnkneateTeywpwen"));
  @override
  late final GeneratedColumn<int> redPacketType = GeneratedColumn<int>(
      StringTranslate.e2z("rweedw_npnaacnkweate_wtayapaen"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _redPacketAmountMeta =
      VerificationMeta(StringTranslate.e2z("reendePnawcnkwentnAemeonunnntw"));
  @override
  late final GeneratedColumn<double> redPacketAmount = GeneratedColumn<double>(
      StringTranslate.e2z("rneadw_npwancwknenta_aanmwoauanwtn"), aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _redPacketTotalCountMeta =
      VerificationMeta(StringTranslate.e2z("rnewdwPeawcekaentaTaoetaaalnCnoeuwnntn"));
  @override
  late final GeneratedColumn<int> redPacketTotalCount = GeneratedColumn<int>(
      StringTranslate.e2z("raende_epnaecekaentw_wtwonteaaln_ncwowuenetn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _redPacketMessageMeta =
      VerificationMeta(StringTranslate.e2z("raendwPaawcaknenteMneesasnangnee"));
  @override
  late final GeneratedColumn<String> redPacketMessage = GeneratedColumn<String>(
      StringTranslate.e2z("rnenda_npeancaknente_emeensnsnawgnen"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);

  @override
  List<GeneratedColumn> get $columns => [
        pk,
        id,
        cid,
        owner,
        ownerHead,
        ownerName,
        unread,
        createTime,
        prevSnapId,
        type,
        textContent,
        image,
        video,
        voice,
        images,
        jsonContent,
        localId,
        extensions,
        redPacketId,
        repliedSnapId,
        status,
        sendStatus,
        redPacketStatus,
        redPacketType,
        redPacketAmount,
        redPacketTotalCount,
        redPacketMessage
      ];

  @override
  String get aliasedName => _alias ?? StringTranslate.e2z("sannaepe_aeennteintaieeesw");

  @override
  String get actualTableName => StringTranslate.e2z("swnwaapa_neanetaietwinewsw");

  @override
  VerificationContext validateIntegrity(Insertable<SnapEntity> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey(StringTranslate.e2z("pnkn"))) {
      context.handle(_pkMeta, pk.isAcceptableOrUnknown(data[StringTranslate.e2z("pnkn")]!, _pkMeta));
    }
    if (data.containsKey(StringTranslate.e2z("indn"))) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data[StringTranslate.e2z("indn")]!, _idMeta));
    }
    if (data.containsKey(StringTranslate.e2z("ceinda"))) {
      context.handle(_cidMeta, cid.isAcceptableOrUnknown(data[StringTranslate.e2z("cwiwdw")]!, _cidMeta));
    }
    if (data.containsKey(StringTranslate.e2z("onwanneere"))) {
      context.handle(_ownerMeta, owner.isAcceptableOrUnknown(data[StringTranslate.e2z("onwnnaearn")]!, _ownerMeta));
    }
    if (data.containsKey(StringTranslate.e2z("onweneenrn_ehaenawdn"))) {
      context.handle(_ownerHeadMeta,
          ownerHead.isAcceptableOrUnknown(data[StringTranslate.e2z("oawnnneere_ahnewaedn")]!, _ownerHeadMeta));
    }
    if (data.containsKey(StringTranslate.e2z("owwnnnearn_nnnawmeew"))) {
      context.handle(_ownerNameMeta,
          ownerName.isAcceptableOrUnknown(data[StringTranslate.e2z("onwennewrn_nnaaameen")]!, _ownerNameMeta));
    }
    if (data.containsKey(StringTranslate.e2z("uwnnrneaandw"))) {
      context.handle(
          _unreadMeta, unread.isAcceptableOrUnknown(data[StringTranslate.e2z("uannrnewaedw")]!, _unreadMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cnrneeantaew_etainmnew"))) {
      context.handle(_createTimeMeta,
          createTime.isAcceptableOrUnknown(data[StringTranslate.e2z("cerweaantnen_eteiwmnew")]!, _createTimeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("pernewvn_nsnnnaepn_aiedn"))) {
      context.handle(_prevSnapIdMeta,
          prevSnapId.isAcceptableOrUnknown(data[StringTranslate.e2z("pnrnenvw_esennawpa_einde")]!, _prevSnapIdMeta));
    }
    if (data.containsKey(StringTranslate.e2z("tnywpwen"))) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data[StringTranslate.e2z("taynpwen")]!, _typeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("teewxnta_wcnoenetneeneta"))) {
      context.handle(_textContentMeta,
          textContent.isAcceptableOrUnknown(data[StringTranslate.e2z("teenxwtn_ncaownateewneta")]!, _textContentMeta));
    }
    context.handle(_imageMeta, const VerificationResult.success());
    context.handle(_videoMeta, const VerificationResult.success());
    context.handle(_voiceMeta, const VerificationResult.success());
    context.handle(_imagesMeta, const VerificationResult.success());
    if (data.containsKey(StringTranslate.e2z("jnsaonna_wcnoenntwennwte"))) {
      context.handle(_jsonContentMeta,
          jsonContent.isAcceptableOrUnknown(data[StringTranslate.e2z("jasaonnn_wcnonnateeanwtw")]!, _jsonContentMeta));
    }
    if (data.containsKey(StringTranslate.e2z("leoncaaale_niedn"))) {
      context.handle(
          _localIdMeta, localId.isAcceptableOrUnknown(data[StringTranslate.e2z("leoecnanle_ninde")]!, _localIdMeta));
    }
    if (data.containsKey(StringTranslate.e2z("enxntaeeneseinonnnsa"))) {
      context.handle(_extensionsMeta,
          extensions.isAcceptableOrUnknown(data[StringTranslate.e2z("ewxntaeeneseinonnnsn")]!, _extensionsMeta));
    }
    if (data.containsKey(StringTranslate.e2z("raende_epwanceknewtn_eiada"))) {
      context.handle(
          _redPacketIdMeta,
          redPacketId.isAcceptableOrUnknown(
              data[StringTranslate.e2z("rwewda_npwancakeeetw_eiwdn")]!, _redPacketIdMeta));
    }
    if (data.containsKey(StringTranslate.e2z("rneapalwineadn_nswnaanpe_niwda"))) {
      context.handle(
          _repliedSnapIdMeta,
          repliedSnapId.isAcceptableOrUnknown(
              data[StringTranslate.e2z("reewpwlnieeedn_nsaneawpn_niede")]!, _repliedSnapIdMeta));
    }
    if (data.containsKey(StringTranslate.e2z("satnanteunsw"))) {
      context.handle(
          _statusMeta, status.isAcceptableOrUnknown(data[StringTranslate.e2z("swtwawtnuesn")]!, _statusMeta));
    }
    if (data.containsKey(StringTranslate.e2z("saeenade_nsetnantnuesw"))) {
      context.handle(_sendStatusMeta,
          sendStatus.isAcceptableOrUnknown(data[StringTranslate.e2z("snennwdw_esateawtauwsa")]!, _sendStatusMeta));
    }
    if (data.containsKey(StringTranslate.e2z("raewdn_npnaecnkneeta_nsntnantwuase"))) {
      context.handle(
          _redPacketStatusMeta,
          redPacketStatus.isAcceptableOrUnknown(
              data[StringTranslate.e2z("rneede_wpwancekeentn_wsntaantaunse")]!, _redPacketStatusMeta));
    }
    if (data.containsKey(StringTranslate.e2z("rnendn_apnaacnknenta_wtaywpwee"))) {
      context.handle(
          _redPacketTypeMeta,
          redPacketType.isAcceptableOrUnknown(
              data[StringTranslate.e2z("rnenda_npwancekwentn_wteynpnen")]!, _redPacketTypeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("reeadn_npaaecnknewtn_aaamnoeuwnate"))) {
      context.handle(
          _redPacketAmountMeta,
          redPacketAmount.isAcceptableOrUnknown(
              data[StringTranslate.e2z("reende_npaaacakeeetn_nawmaonunnetn")]!, _redPacketAmountMeta));
    }
    if (data.containsKey(StringTranslate.e2z("rwewda_npnawcakeentw_etnowteanla_aceonuwneta"))) {
      context.handle(
          _redPacketTotalCountMeta,
          redPacketTotalCount.isAcceptableOrUnknown(
              data[StringTranslate.e2z("rnendw_npeaacnkaewta_atnontaaelw_eceoaunnwtn")]!, _redPacketTotalCountMeta));
    }
    if (data.containsKey(StringTranslate.e2z("reenda_apwaacaknewtw_amweasnsnangnen"))) {
      context.handle(
          _redPacketMessageMeta,
          redPacketMessage.isAcceptableOrUnknown(
              data[StringTranslate.e2z("reendn_epeaacekeentn_emwensnsnangwen")]!, _redPacketMessageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pk};

  @override
  SnapEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : StringTranslate.e2z("");
    return SnapEntity(
      pk: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}pk'])!,
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      cid: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}cid'])!,
      owner: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}owner']),
      ownerHead: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}owner_head']),
      ownerName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}owner_name']),
      unread: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}unread'])!,
      createTime: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}create_time'])!,
      prevSnapId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}prev_snap_id'])!,
      type: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      textContent: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}text_content']),
      image: $SnapEntitiesTable.$converterimagen
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}image'])),
      video: $SnapEntitiesTable.$convertervideon
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}video'])),
      voice: $SnapEntitiesTable.$convertervoicen
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}voice'])),
      images: $SnapEntitiesTable.$converterimagesn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}images'])),
      jsonContent: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}json_content']),
      localId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      extensions: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}extensions']),
      redPacketId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}red_packet_id'])!,
      repliedSnapId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}replied_snap_id'])!,
      status: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      sendStatus: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}send_status'])!,
      redPacketStatus:
          attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}red_packet_status'])!,
      redPacketType: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}red_packet_type'])!,
      redPacketAmount:
          attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}red_packet_amount'])!,
      redPacketTotalCount:
          attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}red_packet_total_count'])!,
      redPacketMessage:
          attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}red_packet_message']),
    );
  }

  @override
  $SnapEntitiesTable createAlias(String alias) {
    return $SnapEntitiesTable(attachedDatabase, alias);
  }

  static TypeConverter<AppImage, String> $converterimage = const AppImageConverter();
  static TypeConverter<AppImage?, String?> $converterimagen = NullAwareTypeConverter.wrap($converterimage);
  static TypeConverter<AppVideo, String> $convertervideo = const AppVideoConverter();
  static TypeConverter<AppVideo?, String?> $convertervideon = NullAwareTypeConverter.wrap($convertervideo);
  static TypeConverter<AppVoice, String> $convertervoice = const AppVoiceConverter();
  static TypeConverter<AppVoice?, String?> $convertervoicen = NullAwareTypeConverter.wrap($convertervoice);
  static TypeConverter<List<AppImage>, String> $converterimages = const AppImageListConverter();
  static TypeConverter<List<AppImage>?, String?> $converterimagesn = NullAwareTypeConverter.wrap($converterimages);
}

class SnapEntity extends DataClass implements Insertable<SnapEntity> {
  final int pk;
  final int id;
  final int cid;
  final int? owner;
  final String? ownerHead;
  final String? ownerName;
  final bool unread;
  final int createTime;
  final int prevSnapId;
  final int type;
  final String? textContent;
  final AppImage? image;
  final AppVideo? video;
  final AppVoice? voice;
  final List<AppImage>? images;
  final String? jsonContent;
  final int localId;
  final String? extensions;
  final int redPacketId;
  final int repliedSnapId;
  final int status;

  /// Added Properties
  final int sendStatus;
  final int redPacketStatus;
  final int redPacketType;
  final double redPacketAmount;
  final int redPacketTotalCount;
  final String? redPacketMessage;

  const SnapEntity(
      {required this.pk,
      required this.id,
      required this.cid,
      this.owner,
      this.ownerHead,
      this.ownerName,
      required this.unread,
      required this.createTime,
      required this.prevSnapId,
      required this.type,
      this.textContent,
      this.image,
      this.video,
      this.voice,
      this.images,
      this.jsonContent,
      required this.localId,
      this.extensions,
      required this.redPacketId,
      required this.repliedSnapId,
      required this.status,
      required this.sendStatus,
      required this.redPacketStatus,
      required this.redPacketType,
      required this.redPacketAmount,
      required this.redPacketTotalCount,
      this.redPacketMessage});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map[StringTranslate.e2z("paka")] = Variable<int>(pk);
    map[StringTranslate.e2z("indw")] = Variable<int>(id);
    map[StringTranslate.e2z("cwiwde")] = Variable<int>(cid);
    if (!nullToAbsent || owner != null) {
      map[StringTranslate.e2z("owwwnnearn")] = Variable<int>(owner);
    }
    if (!nullToAbsent || ownerHead != null) {
      map[StringTranslate.e2z("oawwnneara_whaeaawdn")] = Variable<String>(ownerHead);
    }
    if (!nullToAbsent || ownerName != null) {
      map[StringTranslate.e2z("onwnneewra_nneanmwen")] = Variable<String>(ownerName);
    }
    map[StringTranslate.e2z("uanernewaeda")] = Variable<bool>(unread);
    map[StringTranslate.e2z("ceraewaetaew_nteinmnee")] = Variable<int>(createTime);
    map[StringTranslate.e2z("pnreenvn_wsannanpe_einde")] = Variable<int>(prevSnapId);
    map[StringTranslate.e2z("tayapnew")] = Variable<int>(type);
    if (!nullToAbsent || textContent != null) {
      map[StringTranslate.e2z("tnenxwte_ecnoenwtnennetw")] = Variable<String>(textContent);
    }
    if (!nullToAbsent || image != null) {
      final converter = $SnapEntitiesTable.$converterimagen;
      map[StringTranslate.e2z("inmaaagwee")] = Variable<String>(converter.toSql(image));
    }
    if (!nullToAbsent || video != null) {
      final converter = $SnapEntitiesTable.$convertervideon;
      map[StringTranslate.e2z("vnindneaow")] = Variable<String>(converter.toSql(video));
    }
    if (!nullToAbsent || voice != null) {
      final converter = $SnapEntitiesTable.$convertervoicen;
      map[StringTranslate.e2z("vnoaiwcaen")] = Variable<String>(converter.toSql(voice));
    }
    if (!nullToAbsent || images != null) {
      final converter = $SnapEntitiesTable.$converterimagesn;
      map[StringTranslate.e2z("iwmnawgwensn")] = Variable<String>(converter.toSql(images));
    }
    if (!nullToAbsent || jsonContent != null) {
      map[StringTranslate.e2z("jnsaoana_ncnonnatweanntn")] = Variable<String>(jsonContent);
    }
    map[StringTranslate.e2z("leoecnaale_windn")] = Variable<int>(localId);
    if (!nullToAbsent || extensions != null) {
      map[StringTranslate.e2z("enxetneennsniaoenasn")] = Variable<String>(extensions);
    }
    map[StringTranslate.e2z("reeadn_wpwaacakeeetw_ninda")] = Variable<int>(redPacketId);
    map[StringTranslate.e2z("rnenpnlnineedw_wswneawpa_eindn")] = Variable<int>(repliedSnapId);
    map[StringTranslate.e2z("sntaawtnuesw")] = Variable<int>(status);
    map[StringTranslate.e2z("sweeneda_aswtnantnuwse")] = Variable<int>(sendStatus);
    map[StringTranslate.e2z("rweadw_apnaacekweatn_nsntaawteuesw")] = Variable<int>(redPacketStatus);
    map[StringTranslate.e2z("reeadn_apwaacakweeta_ntnynpeee")] = Variable<int>(redPacketType);
    map[StringTranslate.e2z("rnendw_wpwancakeenta_wawmnoeunnate")] = Variable<double>(redPacketAmount);
    map[StringTranslate.e2z("rwewdn_apeaecakeeetw_nteoatnanla_wcaoaunnwte")] = Variable<int>(redPacketTotalCount);
    if (!nullToAbsent || redPacketMessage != null) {
      map[StringTranslate.e2z("reewdn_epnaecekeentn_nmeenswseaegnea")] = Variable<String>(redPacketMessage);
    }
    return map;
  }

  SnapEntitiesCompanion toCompanion(bool nullToAbsent) {
    return SnapEntitiesCompanion(
      pk: Value(pk),
      id: Value(id),
      cid: Value(cid),
      owner: owner == null && nullToAbsent ? const Value.absent() : Value(owner),
      ownerHead: ownerHead == null && nullToAbsent ? const Value.absent() : Value(ownerHead),
      ownerName: ownerName == null && nullToAbsent ? const Value.absent() : Value(ownerName),
      unread: Value(unread),
      createTime: Value(createTime),
      prevSnapId: Value(prevSnapId),
      type: Value(type),
      textContent: textContent == null && nullToAbsent ? const Value.absent() : Value(textContent),
      image: image == null && nullToAbsent ? const Value.absent() : Value(image),
      video: video == null && nullToAbsent ? const Value.absent() : Value(video),
      voice: voice == null && nullToAbsent ? const Value.absent() : Value(voice),
      images: images == null && nullToAbsent ? const Value.absent() : Value(images),
      jsonContent: jsonContent == null && nullToAbsent ? const Value.absent() : Value(jsonContent),
      localId: Value(localId),
      extensions: extensions == null && nullToAbsent ? const Value.absent() : Value(extensions),
      redPacketId: Value(redPacketId),
      repliedSnapId: Value(repliedSnapId),
      status: Value(status),
      sendStatus: Value(sendStatus),
      redPacketStatus: Value(redPacketStatus),
      redPacketType: Value(redPacketType),
      redPacketAmount: Value(redPacketAmount),
      redPacketTotalCount: Value(redPacketTotalCount),
      redPacketMessage: redPacketMessage == null && nullToAbsent ? const Value.absent() : Value(redPacketMessage),
    );
  }

  factory SnapEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SnapEntity(
      pk: serializer.fromJson<int>(json[StringTranslate.e2z("pwkn")]),
      id: serializer.fromJson<int>(json[StringTranslate.e2z("iedn")]),
      cid: serializer.fromJson<int>(json[StringTranslate.e2z("cniada")]),
      owner: serializer.fromJson<int?>(json[StringTranslate.e2z("owwnneenrw")]),
      ownerHead: serializer.fromJson<String?>(json[StringTranslate.e2z("owwanaeareHeeeande")]),
      ownerName: serializer.fromJson<String?>(json[StringTranslate.e2z("onwnnnenrwNaaamnen")]),
      unread: serializer.fromJson<bool>(json[StringTranslate.e2z("uenarnewanda")]),
      createTime: serializer.fromJson<int>(json[StringTranslate.e2z("carweaaetneeTniemnen")]),
      prevSnapId: serializer.fromJson<int>(json[StringTranslate.e2z("pnrneevaSnneanpwIndn")]),
      type: serializer.fromJson<int>(json[StringTranslate.e2z("tnyapaee")]),
      textContent: serializer.fromJson<String?>(json[StringTranslate.e2z("twenxwtwCnownetweenntw")]),
      image: serializer.fromJson<AppImage?>(json[StringTranslate.e2z("iemeangnea")]),
      video: serializer.fromJson<AppVideo?>(json[StringTranslate.e2z("veiwdwenon")]),
      voice: serializer.fromJson<AppVoice?>(json[StringTranslate.e2z("vnoeinceee")]),
      images: serializer.fromJson<List<AppImage>?>(json[StringTranslate.e2z("iamaawgwewsn")]),
      jsonContent: serializer.fromJson<String?>(json[StringTranslate.e2z("jwsnowneCnoanwtnewnwtw")]),
      localId: serializer.fromJson<int>(json[StringTranslate.e2z("laoncwawlaIwdn")]),
      extensions: serializer.fromJson<String?>(json[StringTranslate.e2z("eexnteeenaseieownasa")]),
      redPacketId: serializer.fromJson<int>(json[StringTranslate.e2z("rnendePnancnkwentaIade")]),
      repliedSnapId: serializer.fromJson<int>(json[StringTranslate.e2z("rnenpalwinendwSanwawpnIwde")]),
      status: serializer.fromJson<int>(json[StringTranslate.e2z("sntnaetauesn")]),
      sendStatus: serializer.fromJson<int>(json[StringTranslate.e2z("swennndwSnteaeteuwsn")]),
      redPacketStatus: serializer.fromJson<int>(json[StringTranslate.e2z("rnendaPwancakeentnSnteantwuwsn")]),
      redPacketType: serializer.fromJson<int>(json[StringTranslate.e2z("rnendePeawcnknenteTnynpnen")]),
      redPacketAmount: serializer.fromJson<double>(json[StringTranslate.e2z("rneednPnawcnknewtwAnmeoaunnatn")]),
      redPacketTotalCount:
          serializer.fromJson<int>(json[StringTranslate.e2z("rneadnPnancwknentaTnontaaelnCnonuenatn")]),
      redPacketMessage: serializer.fromJson<String?>(json[StringTranslate.e2z("reendePaaecakeewtaMnensnsaangnee")]),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      StringTranslate.e2z("paka"): serializer.toJson<int>(pk),
      StringTranslate.e2z("indn"): serializer.toJson<int>(id),
      StringTranslate.e2z("cninde"): serializer.toJson<int>(cid),
      StringTranslate.e2z("oewnnnewrn"): serializer.toJson<int?>(owner),
      StringTranslate.e2z("onwaneewraHwewandw"): serializer.toJson<String?>(ownerHead),
      StringTranslate.e2z("onwwnnearnNnanmwee"): serializer.toJson<String?>(ownerName),
      StringTranslate.e2z("uwnnrweaanda"): serializer.toJson<bool>(unread),
      StringTranslate.e2z("carnenantweaTaiwmwew"): serializer.toJson<int>(createTime),
      StringTranslate.e2z("pnraewvwSnnaaapaInde"): serializer.toJson<int>(prevSnapId),
      StringTranslate.e2z("tnywpnee"): serializer.toJson<int>(type),
      StringTranslate.e2z("tnenxatwCwoanetaewnntn"): serializer.toJson<String?>(textContent),
      StringTranslate.e2z("inmnangwee"): serializer.toJson<AppImage?>(image),
      StringTranslate.e2z("vniedweaoe"): serializer.toJson<AppVideo?>(video),
      StringTranslate.e2z("vwonincnea"): serializer.toJson<AppVoice?>(voice),
      StringTranslate.e2z("iwmaaageensw"): serializer.toJson<List<AppImage>?>(images),
      StringTranslate.e2z("jnsnonnaCeonnntneennta"): serializer.toJson<String?>(jsonContent),
      StringTranslate.e2z("lnowceanlaIedn"): serializer.toJson<int>(localId),
      StringTranslate.e2z("enxntneannsaieoennse"): serializer.toJson<String?>(extensions),
      StringTranslate.e2z("rnewdnPaancekeenteInde"): serializer.toJson<int>(redPacketId),
      StringTranslate.e2z("rnenpwlniaendwSnnnanpeIndn"): serializer.toJson<int>(repliedSnapId),
      StringTranslate.e2z("satwaateuwsw"): serializer.toJson<int>(status),
      StringTranslate.e2z("snennndnSnteaatnuesn"): serializer.toJson<int>(sendStatus),
      StringTranslate.e2z("rneednPnaacwkneetaSwtaantnuasn"): serializer.toJson<int>(redPacketStatus),
      StringTranslate.e2z("rnendnPaawcwknentwTnynpnew"): serializer.toJson<int>(redPacketType),
      StringTranslate.e2z("rwendePwaacakeeatnAamwonuwnnta"): serializer.toJson<double>(redPacketAmount),
      StringTranslate.e2z("rweadwPeaeceknentnTwoatnanleCeonuwnnte"): serializer.toJson<int>(redPacketTotalCount),
      StringTranslate.e2z("raendnPnaacekaentaMaeasnswawgeea"): serializer.toJson<String?>(redPacketMessage),
    };
  }

  SnapEntity copyWith(
          {int? pk,
          int? id,
          int? cid,
          Value<int?> owner = const Value.absent(),
          Value<String?> ownerHead = const Value.absent(),
          Value<String?> ownerName = const Value.absent(),
          bool? unread,
          int? createTime,
          int? prevSnapId,
          int? type,
          Value<String?> textContent = const Value.absent(),
          Value<AppImage?> image = const Value.absent(),
          Value<AppVideo?> video = const Value.absent(),
          Value<AppVoice?> voice = const Value.absent(),
          Value<List<AppImage>?> images = const Value.absent(),
          Value<String?> jsonContent = const Value.absent(),
          int? localId,
          Value<String?> extensions = const Value.absent(),
          int? redPacketId,
          int? repliedSnapId,
          int? status,
          int? sendStatus,
          int? redPacketStatus,
          int? redPacketType,
          double? redPacketAmount,
          int? redPacketTotalCount,
          Value<String?> redPacketMessage = const Value.absent()}) =>
      SnapEntity(
        pk: pk ?? this.pk,
        id: id ?? this.id,
        cid: cid ?? this.cid,
        owner: owner.present ? owner.value : this.owner,
        ownerHead: ownerHead.present ? ownerHead.value : this.ownerHead,
        ownerName: ownerName.present ? ownerName.value : this.ownerName,
        unread: unread ?? this.unread,
        createTime: createTime ?? this.createTime,
        prevSnapId: prevSnapId ?? this.prevSnapId,
        type: type ?? this.type,
        textContent: textContent.present ? textContent.value : this.textContent,
        image: image.present ? image.value : this.image,
        video: video.present ? video.value : this.video,
        voice: voice.present ? voice.value : this.voice,
        images: images.present ? images.value : this.images,
        jsonContent: jsonContent.present ? jsonContent.value : this.jsonContent,
        localId: localId ?? this.localId,
        extensions: extensions.present ? extensions.value : this.extensions,
        redPacketId: redPacketId ?? this.redPacketId,
        repliedSnapId: repliedSnapId ?? this.repliedSnapId,
        status: status ?? this.status,
        sendStatus: sendStatus ?? this.sendStatus,
        redPacketStatus: redPacketStatus ?? this.redPacketStatus,
        redPacketType: redPacketType ?? this.redPacketType,
        redPacketAmount: redPacketAmount ?? this.redPacketAmount,
        redPacketTotalCount: redPacketTotalCount ?? this.redPacketTotalCount,
        redPacketMessage: redPacketMessage.present ? redPacketMessage.value : this.redPacketMessage,
      );

  @override
  String toString() {
    return (StringBuffer('SnapEntity(')
          ..write('pk: $pk, ')
          ..write('id: $id, ')
          ..write('cid: $cid, ')
          ..write('owner: $owner, ')
          ..write('ownerHead: $ownerHead, ')
          ..write('ownerName: $ownerName, ')
          ..write('unread: $unread, ')
          ..write('createTime: $createTime, ')
          ..write('prevSnapId: $prevSnapId, ')
          ..write('type: $type, ')
          ..write('textContent: $textContent, ')
          ..write('image: $image, ')
          ..write('video: $video, ')
          ..write('voice: $voice, ')
          ..write('images: $images, ')
          ..write('jsonContent: $jsonContent, ')
          ..write('localId: $localId, ')
          ..write('extensions: $extensions, ')
          ..write('redPacketId: $redPacketId, ')
          ..write('repliedSnapId: $repliedSnapId, ')
          ..write('status: $status, ')
          ..write('sendStatus: $sendStatus, ')
          ..write('redPacketStatus: $redPacketStatus, ')
          ..write('redPacketType: $redPacketType, ')
          ..write('redPacketAmount: $redPacketAmount, ')
          ..write('redPacketTotalCount: $redPacketTotalCount, ')
          ..write('redPacketMessage: $redPacketMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        pk,
        id,
        cid,
        owner,
        ownerHead,
        ownerName,
        unread,
        createTime,
        prevSnapId,
        type,
        textContent,
        image,
        video,
        voice,
        images,
        jsonContent,
        localId,
        extensions,
        redPacketId,
        repliedSnapId,
        status,
        sendStatus,
        redPacketStatus,
        redPacketType,
        redPacketAmount,
        redPacketTotalCount,
        redPacketMessage
      ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SnapEntity &&
          other.pk == this.pk &&
          other.id == this.id &&
          other.cid == this.cid &&
          other.owner == this.owner &&
          other.ownerHead == this.ownerHead &&
          other.ownerName == this.ownerName &&
          other.unread == this.unread &&
          other.createTime == this.createTime &&
          other.prevSnapId == this.prevSnapId &&
          other.type == this.type &&
          other.textContent == this.textContent &&
          other.image == this.image &&
          other.video == this.video &&
          other.voice == this.voice &&
          other.images == this.images &&
          other.jsonContent == this.jsonContent &&
          other.localId == this.localId &&
          other.extensions == this.extensions &&
          other.redPacketId == this.redPacketId &&
          other.repliedSnapId == this.repliedSnapId &&
          other.status == this.status &&
          other.sendStatus == this.sendStatus &&
          other.redPacketStatus == this.redPacketStatus &&
          other.redPacketType == this.redPacketType &&
          other.redPacketAmount == this.redPacketAmount &&
          other.redPacketTotalCount == this.redPacketTotalCount &&
          other.redPacketMessage == this.redPacketMessage);
}

class SnapEntitiesCompanion extends UpdateCompanion<SnapEntity> {
  final Value<int> pk;
  final Value<int> id;
  final Value<int> cid;
  final Value<int?> owner;
  final Value<String?> ownerHead;
  final Value<String?> ownerName;
  final Value<bool> unread;
  final Value<int> createTime;
  final Value<int> prevSnapId;
  final Value<int> type;
  final Value<String?> textContent;
  final Value<AppImage?> image;
  final Value<AppVideo?> video;
  final Value<AppVoice?> voice;
  final Value<List<AppImage>?> images;
  final Value<String?> jsonContent;
  final Value<int> localId;
  final Value<String?> extensions;
  final Value<int> redPacketId;
  final Value<int> repliedSnapId;
  final Value<int> status;
  final Value<int> sendStatus;
  final Value<int> redPacketStatus;
  final Value<int> redPacketType;
  final Value<double> redPacketAmount;
  final Value<int> redPacketTotalCount;
  final Value<String?> redPacketMessage;

  const SnapEntitiesCompanion({
    this.pk = const Value.absent(),
    this.id = const Value.absent(),
    this.cid = const Value.absent(),
    this.owner = const Value.absent(),
    this.ownerHead = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.unread = const Value.absent(),
    this.createTime = const Value.absent(),
    this.prevSnapId = const Value.absent(),
    this.type = const Value.absent(),
    this.textContent = const Value.absent(),
    this.image = const Value.absent(),
    this.video = const Value.absent(),
    this.voice = const Value.absent(),
    this.images = const Value.absent(),
    this.jsonContent = const Value.absent(),
    this.localId = const Value.absent(),
    this.extensions = const Value.absent(),
    this.redPacketId = const Value.absent(),
    this.repliedSnapId = const Value.absent(),
    this.status = const Value.absent(),
    this.sendStatus = const Value.absent(),
    this.redPacketStatus = const Value.absent(),
    this.redPacketType = const Value.absent(),
    this.redPacketAmount = const Value.absent(),
    this.redPacketTotalCount = const Value.absent(),
    this.redPacketMessage = const Value.absent(),
  });

  SnapEntitiesCompanion.insert({
    this.pk = const Value.absent(),
    this.id = const Value.absent(),
    this.cid = const Value.absent(),
    this.owner = const Value.absent(),
    this.ownerHead = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.unread = const Value.absent(),
    this.createTime = const Value.absent(),
    this.prevSnapId = const Value.absent(),
    this.type = const Value.absent(),
    this.textContent = const Value.absent(),
    this.image = const Value.absent(),
    this.video = const Value.absent(),
    this.voice = const Value.absent(),
    this.images = const Value.absent(),
    this.jsonContent = const Value.absent(),
    this.localId = const Value.absent(),
    this.extensions = const Value.absent(),
    this.redPacketId = const Value.absent(),
    this.repliedSnapId = const Value.absent(),
    this.status = const Value.absent(),
    this.sendStatus = const Value.absent(),
    this.redPacketStatus = const Value.absent(),
    this.redPacketType = const Value.absent(),
    this.redPacketAmount = const Value.absent(),
    this.redPacketTotalCount = const Value.absent(),
    this.redPacketMessage = const Value.absent(),
  });

  static Insertable<SnapEntity> custom({
    Expression<int>? pk,
    Expression<int>? id,
    Expression<int>? cid,
    Expression<int>? owner,
    Expression<String>? ownerHead,
    Expression<String>? ownerName,
    Expression<bool>? unread,
    Expression<int>? createTime,
    Expression<int>? prevSnapId,
    Expression<int>? type,
    Expression<String>? textContent,
    Expression<String>? image,
    Expression<String>? video,
    Expression<String>? voice,
    Expression<String>? images,
    Expression<String>? jsonContent,
    Expression<int>? localId,
    Expression<String>? extensions,
    Expression<int>? redPacketId,
    Expression<int>? repliedSnapId,
    Expression<int>? status,
    Expression<int>? sendStatus,
    Expression<int>? redPacketStatus,
    Expression<int>? redPacketType,
    Expression<double>? redPacketAmount,
    Expression<int>? redPacketTotalCount,
    Expression<String>? redPacketMessage,
  }) {
    return RawValuesInsertable({
      if (pk != null) StringTranslate.e2z("pnkn"): pk,
      if (id != null) StringTranslate.e2z("inde"): id,
      if (cid != null) StringTranslate.e2z("cwindw"): cid,
      if (owner != null) StringTranslate.e2z("onwnnnenrn"): owner,
      if (ownerHead != null) StringTranslate.e2z("oewnnnearn_nhneaawdn"): ownerHead,
      if (ownerName != null) StringTranslate.e2z("onwenaeere_nnaaamnen"): ownerName,
      if (unread != null) StringTranslate.e2z("uanwraenaedw"): unread,
      if (createTime != null) StringTranslate.e2z("cnreenaatwew_etwinmeen"): createTime,
      if (prevSnapId != null) StringTranslate.e2z("pareeevn_asaneanpn_niwde"): prevSnapId,
      if (type != null) StringTranslate.e2z("tnynpaee"): type,
      if (textContent != null) StringTranslate.e2z("twewxntn_acnownntaennwta"): textContent,
      if (image != null) StringTranslate.e2z("inmaawgwee"): image,
      if (video != null) StringTranslate.e2z("vnindneaoa"): video,
      if (voice != null) StringTranslate.e2z("vnoniecnew"): voice,
      if (images != null) StringTranslate.e2z("inmwaegwensn"): images,
      if (jsonContent != null) StringTranslate.e2z("jnswonnn_ncnoenntnennatn"): jsonContent,
      if (localId != null) StringTranslate.e2z("lnoecnaaln_ninde"): localId,
      if (extensions != null) StringTranslate.e2z("eexnteeaneswieonnese"): extensions,
      if (redPacketId != null) StringTranslate.e2z("rnewda_apwaacakwewtn_aindn"): redPacketId,
      if (repliedSnapId != null) StringTranslate.e2z("raenpnlwinewdn_wswnnanpe_winde"): repliedSnapId,
      if (status != null) StringTranslate.e2z("swtaawtwuesn"): status,
      if (sendStatus != null) StringTranslate.e2z("saenneda_aswtaaeteuese"): sendStatus,
      if (redPacketStatus != null) StringTranslate.e2z("rnendn_epeaecaknente_nsntaaetnuwsn"): redPacketStatus,
      if (redPacketType != null) StringTranslate.e2z("rnewda_npeancekaenta_etnynpeen"): redPacketType,
      if (redPacketAmount != null) StringTranslate.e2z("reendn_apnaacwkwewtw_eaamnonunnata"): redPacketAmount,
      if (redPacketTotalCount != null)
        StringTranslate.e2z("raeedw_npnawcekeewte_wtaoatnawla_ncnoeunnntn"): redPacketTotalCount,
      if (redPacketMessage != null) StringTranslate.e2z("rwenda_npwanceknentw_nmaeesnsaangnee"): redPacketMessage,
    });
  }

  SnapEntitiesCompanion copyWith(
      {Value<int>? pk,
      Value<int>? id,
      Value<int>? cid,
      Value<int?>? owner,
      Value<String?>? ownerHead,
      Value<String?>? ownerName,
      Value<bool>? unread,
      Value<int>? createTime,
      Value<int>? prevSnapId,
      Value<int>? type,
      Value<String?>? textContent,
      Value<AppImage?>? image,
      Value<AppVideo?>? video,
      Value<AppVoice?>? voice,
      Value<List<AppImage>?>? images,
      Value<String?>? jsonContent,
      Value<int>? localId,
      Value<String?>? extensions,
      Value<int>? redPacketId,
      Value<int>? repliedSnapId,
      Value<int>? status,
      Value<int>? sendStatus,
      Value<int>? redPacketStatus,
      Value<int>? redPacketType,
      Value<double>? redPacketAmount,
      Value<int>? redPacketTotalCount,
      Value<String?>? redPacketMessage}) {
    return SnapEntitiesCompanion(
      pk: pk ?? this.pk,
      id: id ?? this.id,
      cid: cid ?? this.cid,
      owner: owner ?? this.owner,
      ownerHead: ownerHead ?? this.ownerHead,
      ownerName: ownerName ?? this.ownerName,
      unread: unread ?? this.unread,
      createTime: createTime ?? this.createTime,
      prevSnapId: prevSnapId ?? this.prevSnapId,
      type: type ?? this.type,
      textContent: textContent ?? this.textContent,
      image: image ?? this.image,
      video: video ?? this.video,
      voice: voice ?? this.voice,
      images: images ?? this.images,
      jsonContent: jsonContent ?? this.jsonContent,
      localId: localId ?? this.localId,
      extensions: extensions ?? this.extensions,
      redPacketId: redPacketId ?? this.redPacketId,
      repliedSnapId: repliedSnapId ?? this.repliedSnapId,
      status: status ?? this.status,
      sendStatus: sendStatus ?? this.sendStatus,
      redPacketStatus: redPacketStatus ?? this.redPacketStatus,
      redPacketType: redPacketType ?? this.redPacketType,
      redPacketAmount: redPacketAmount ?? this.redPacketAmount,
      redPacketTotalCount: redPacketTotalCount ?? this.redPacketTotalCount,
      redPacketMessage: redPacketMessage ?? this.redPacketMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pk.present) {
      map[StringTranslate.e2z("pnkn")] = Variable<int>(pk.value);
    }
    if (id.present) {
      map[StringTranslate.e2z("inde")] = Variable<int>(id.value);
    }
    if (cid.present) {
      map[StringTranslate.e2z("ceiada")] = Variable<int>(cid.value);
    }
    if (owner.present) {
      map[StringTranslate.e2z("owwnnwearn")] = Variable<int>(owner.value);
    }
    if (ownerHead.present) {
      map[StringTranslate.e2z("onwnnnenrn_ahwewawde")] = Variable<String>(ownerHead.value);
    }
    if (ownerName.present) {
      map[StringTranslate.e2z("onwaneenrn_annaamwea")] = Variable<String>(ownerName.value);
    }
    if (unread.present) {
      map[StringTranslate.e2z("uenarwenawde")] = Variable<bool>(unread.value);
    }
    if (createTime.present) {
      map[StringTranslate.e2z("cnrneaaatnee_ntainmeea")] = Variable<int>(createTime.value);
    }
    if (prevSnapId.present) {
      map[StringTranslate.e2z("pwrnenva_asnnaanpa_wiwdn")] = Variable<int>(prevSnapId.value);
    }
    if (type.present) {
      map[StringTranslate.e2z("twynpnea")] = Variable<int>(type.value);
    }
    if (textContent.present) {
      map[StringTranslate.e2z("tnewxata_acwoenataennatn")] = Variable<String>(textContent.value);
    }
    if (image.present) {
      final converter = $SnapEntitiesTable.$converterimagen;
      map[StringTranslate.e2z("inmaaagnee")] = Variable<String>(converter.toSql(image.value));
    }
    if (video.present) {
      final converter = $SnapEntitiesTable.$convertervideon;
      map[StringTranslate.e2z("vniadneaon")] = Variable<String>(converter.toSql(video.value));
    }
    if (voice.present) {
      final converter = $SnapEntitiesTable.$convertervoicen;
      map[StringTranslate.e2z("veonincnen")] = Variable<String>(converter.toSql(voice.value));
    }
    if (images.present) {
      final converter = $SnapEntitiesTable.$converterimagesn;
      map[StringTranslate.e2z("iamwangneasn")] = Variable<String>(converter.toSql(images.value));
    }
    if (jsonContent.present) {
      map[StringTranslate.e2z("jaseoenn_eceoenetnennntn")] = Variable<String>(jsonContent.value);
    }
    if (localId.present) {
      map[StringTranslate.e2z("laoecnanln_wieda")] = Variable<int>(localId.value);
    }
    if (extensions.present) {
      map[StringTranslate.e2z("enxntnennesninownwsw")] = Variable<String>(extensions.value);
    }
    if (redPacketId.present) {
      map[StringTranslate.e2z("reeedn_npaaecekaewtw_nindn")] = Variable<int>(redPacketId.value);
    }
    if (repliedSnapId.present) {
      map[StringTranslate.e2z("raenpnlniaeedn_asnnaanpn_aindn")] = Variable<int>(repliedSnapId.value);
    }
    if (status.present) {
      map[StringTranslate.e2z("sntaawteuasn")] = Variable<int>(status.value);
    }
    if (sendStatus.present) {
      map[StringTranslate.e2z("seeanndn_asntwawtnunse")] = Variable<int>(sendStatus.value);
    }
    if (redPacketStatus.present) {
      map[StringTranslate.e2z("reeadn_npeawcakweetw_nsntnaatnunsw")] = Variable<int>(redPacketStatus.value);
    }
    if (redPacketType.present) {
      map[StringTranslate.e2z("rwendn_npaawcnkneetn_ntnyapeen")] = Variable<int>(redPacketType.value);
    }
    if (redPacketAmount.present) {
      map[StringTranslate.e2z("reeedn_epeaacnkeentn_nawmnoauanetn")] = Variable<double>(redPacketAmount.value);
    }
    if (redPacketTotalCount.present) {
      map[StringTranslate.e2z("rnendn_apaancnkeente_atnonteaaln_ncnoeunnntw")] =
          Variable<int>(redPacketTotalCount.value);
    }
    if (redPacketMessage.present) {
      map[StringTranslate.e2z("rnende_npnawcekeentn_wmeeasesnaageea")] = Variable<String>(redPacketMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnapEntitiesCompanion(')
          ..write('pk: $pk, ')
          ..write('id: $id, ')
          ..write('cid: $cid, ')
          ..write('owner: $owner, ')
          ..write('ownerHead: $ownerHead, ')
          ..write('ownerName: $ownerName, ')
          ..write('unread: $unread, ')
          ..write('createTime: $createTime, ')
          ..write('prevSnapId: $prevSnapId, ')
          ..write('type: $type, ')
          ..write('textContent: $textContent, ')
          ..write('image: $image, ')
          ..write('video: $video, ')
          ..write('voice: $voice, ')
          ..write('images: $images, ')
          ..write('jsonContent: $jsonContent, ')
          ..write('localId: $localId, ')
          ..write('extensions: $extensions, ')
          ..write('redPacketId: $redPacketId, ')
          ..write('repliedSnapId: $repliedSnapId, ')
          ..write('status: $status, ')
          ..write('sendStatus: $sendStatus, ')
          ..write('redPacketStatus: $redPacketStatus, ')
          ..write('redPacketType: $redPacketType, ')
          ..write('redPacketAmount: $redPacketAmount, ')
          ..write('redPacketTotalCount: $redPacketTotalCount, ')
          ..write('redPacketMessage: $redPacketMessage')
          ..write(')'))
        .toString();
  }
}

class $ChatBoxEntitiesTable extends ChatBoxEntities with TableInfo<$ChatBoxEntitiesTable, ChatBoxEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $ChatBoxEntitiesTable(this.attachedDatabase, [this._alias]);

  static VerificationMeta _idMeta = VerificationMeta(StringTranslate.e2z("iedn"));
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(StringTranslate.e2z("iada"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static VerificationMeta _typeMeta = VerificationMeta(StringTranslate.e2z("twyepnen"));
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(StringTranslate.e2z("teywpaen"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _nameMeta = VerificationMeta(StringTranslate.e2z("nnaamwee"));
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(StringTranslate.e2z("nnaemnea"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _coverURLMeta = VerificationMeta(StringTranslate.e2z("cwoevnenraUnRwLw"));
  @override
  late final GeneratedColumn<String> coverURL = GeneratedColumn<String>(
      StringTranslate.e2z("cnoeveenrw_auw_nra_wlw"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _ownerMeta = VerificationMeta(StringTranslate.e2z("owwenaenra"));
  @override
  late final GeneratedColumn<int> owner = GeneratedColumn<int>(StringTranslate.e2z("oawannearn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _qrCodeURLMeta = VerificationMeta(StringTranslate.e2z("qnraCnondweaUnRwLe"));
  @override
  late final GeneratedColumn<String> qrCodeURL = GeneratedColumn<String>(
      StringTranslate.e2z("qnrw_acnondnea_nun_wrn_eln"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _weightMeta = VerificationMeta(StringTranslate.e2z("wweniegahwtw"));
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(StringTranslate.e2z("wneeiegnhntn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(-1));
  static VerificationMeta _mutedMeta = VerificationMeta(StringTranslate.e2z("mauetneadn"));
  @override
  late final GeneratedColumn<bool> muted = GeneratedColumn<bool>(StringTranslate.e2z("mwuntneede"), aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
        SqlDialect.sqlite: 'CHECK ("muted" IN (0, 1))',
        SqlDialect.mysql: StringTranslate.e2z(""),
        SqlDialect.postgres: StringTranslate.e2z(""),
      }),
      defaultValue: const Constant(false));
  static VerificationMeta _unreadCountMeta = VerificationMeta(StringTranslate.e2z("uwnnrweeawdnCnoeuwnwtn"));
  @override
  late final GeneratedColumn<int> unreadCount = GeneratedColumn<int>(
      StringTranslate.e2z("uennrwewandn_ncaonunnwte"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _updateTimeMeta = VerificationMeta(StringTranslate.e2z("uepadnaeteeeTniemeee"));
  @override
  late final GeneratedColumn<int> updateTime = GeneratedColumn<int>(
      StringTranslate.e2z("unpadnaatwen_ntniameen"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _additionalInfoMeta = VerificationMeta(StringTranslate.e2z("aadndeieteiaownnawlnInnwfnon"));
  @override
  late final GeneratedColumn<String> additionalInfo = GeneratedColumn<String>(
      StringTranslate.e2z("andndaintniaoennaeln_niennfwon"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _descMeta = VerificationMeta(StringTranslate.e2z("daeaswce"));
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(StringTranslate.e2z("dnensecn"), aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static VerificationMeta _serviceChatMeta = VerificationMeta(StringTranslate.e2z("seeereveiecnenCwheawtw"));
  @override
  late final GeneratedColumn<bool> serviceChat =
      GeneratedColumn<bool>(StringTranslate.e2z("swenrwvniacnen_ecnhaante"), aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("service_chat" IN (0, 1))',
            SqlDialect.mysql: StringTranslate.e2z(""),
            SqlDialect.postgres: StringTranslate.e2z(""),
          }),
          defaultValue: const Constant(false));
  static VerificationMeta _hasChatMeta = VerificationMeta(StringTranslate.e2z("hnaaseCahnantn"));
  @override
  late final GeneratedColumn<bool> hasChat =
      GeneratedColumn<bool>(StringTranslate.e2z("hnaasn_ncnhnawtn"), aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("has_chat" IN (0, 1))',
            SqlDialect.mysql: StringTranslate.e2z(""),
            SqlDialect.postgres: StringTranslate.e2z(""),
          }),
          defaultValue: const Constant(false));
  static VerificationMeta _lastReadSnapTimeMeta =
      VerificationMeta(StringTranslate.e2z("leawsntnRwewaadeSnnnaepnTwiamaee"));
  @override
  late final GeneratedColumn<int> lastReadSnapTime = GeneratedColumn<int>(
      StringTranslate.e2z("laawsntw_eraenaedw_nsenwanpn_ntninmnew"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
  static VerificationMeta _clearCacheTimeMeta = VerificationMeta(StringTranslate.e2z("cwleewaeraCnaecaheenTaiemnea"));
  @override
  late final GeneratedColumn<int> clearCacheTime = GeneratedColumn<int>(
      StringTranslate.e2z("celaenanre_ncwancahnen_etwinmeew"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));

  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        name,
        coverURL,
        owner,
        qrCodeURL,
        weight,
        muted,
        unreadCount,
        updateTime,
        additionalInfo,
        desc,
        serviceChat,
        hasChat,
        lastReadSnapTime,
        clearCacheTime
      ];

  @override
  String get aliasedName => _alias ?? StringTranslate.e2z("cehnaatw_nbaonxn_aewnateiateiaense");

  @override
  String get actualTableName => StringTranslate.e2z("cahaaate_ebaonxe_neanetwintwineesw");

  @override
  VerificationContext validateIntegrity(Insertable<ChatBoxEntity> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey(StringTranslate.e2z("iwde"))) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data[StringTranslate.e2z("indw")]!, _idMeta));
    }
    if (data.containsKey(StringTranslate.e2z("tnyepnen"))) {
      context.handle(_typeMeta, type.isAcceptableOrUnknown(data[StringTranslate.e2z("tayepeen")]!, _typeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("nwanmnea"))) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data[StringTranslate.e2z("nwanmeee")]!, _nameMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cnoavnewra_eua_arn_alw"))) {
      context.handle(_coverURLMeta,
          coverURL.isAcceptableOrUnknown(data[StringTranslate.e2z("cwonvnearn_wuw_nra_ale")]!, _coverURLMeta));
    }
    if (data.containsKey(StringTranslate.e2z("oewwnwenrn"))) {
      context.handle(_ownerMeta, owner.isAcceptableOrUnknown(data[StringTranslate.e2z("oawaneewrw")]!, _ownerMeta));
    }
    if (data.containsKey(StringTranslate.e2z("qern_wcnoednea_eue_nra_aln"))) {
      context.handle(_qrCodeURLMeta,
          qrCodeURL.isAcceptableOrUnknown(data[StringTranslate.e2z("qarw_wcaowdaew_eue_nrn_wln")]!, _qrCodeURLMeta));
    }
    if (data.containsKey(StringTranslate.e2z("wneningehntn"))) {
      context.handle(
          _weightMeta, weight.isAcceptableOrUnknown(data[StringTranslate.e2z("wneeingnhnta")]!, _weightMeta));
    }
    if (data.containsKey(StringTranslate.e2z("mnunteende"))) {
      context.handle(_mutedMeta, muted.isAcceptableOrUnknown(data[StringTranslate.e2z("mwuatwende")]!, _mutedMeta));
    }
    if (data.containsKey(StringTranslate.e2z("uenwrnewandn_aceoaunnntw"))) {
      context.handle(_unreadCountMeta,
          unreadCount.isAcceptableOrUnknown(data[StringTranslate.e2z("unnwrnenandn_acnowuanate")]!, _unreadCountMeta));
    }
    if (data.containsKey(StringTranslate.e2z("unpwdnaetnee_ntniwmeen"))) {
      context.handle(_updateTimeMeta,
          updateTime.isAcceptableOrUnknown(data[StringTranslate.e2z("uwpedwantwee_wtwiameen")]!, _updateTimeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("aedndeintaiwonnnawla_niannfwoa"))) {
      context.handle(
          _additionalInfoMeta,
          additionalInfo.isAcceptableOrUnknown(
              data[StringTranslate.e2z("awdndniwtninoanaanln_niwnefeoe")]!, _additionalInfoMeta));
    }
    if (data.containsKey(StringTranslate.e2z("dnensace"))) {
      context.handle(_descMeta, desc.isAcceptableOrUnknown(data[StringTranslate.e2z("deeeseca")]!, _descMeta));
    }
    if (data.containsKey(StringTranslate.e2z("saewrnvnincwew_wcwheantn"))) {
      context.handle(_serviceChatMeta,
          serviceChat.isAcceptableOrUnknown(data[StringTranslate.e2z("seeerwvninceee_wcnhaawtn")]!, _serviceChatMeta));
    }
    if (data.containsKey(StringTranslate.e2z("heaesw_ncahwaete"))) {
      context.handle(
          _hasChatMeta, hasChat.isAcceptableOrUnknown(data[StringTranslate.e2z("hnawsw_nceheaatn")]!, _hasChatMeta));
    }
    if (data.containsKey(StringTranslate.e2z("lnaesata_nreenaadw_esaneaepn_etaiemnee"))) {
      context.handle(
          _lastReadSnapTimeMeta,
          lastReadSnapTime.isAcceptableOrUnknown(
              data[StringTranslate.e2z("lnanseta_nrweeaadw_wsnnwaapw_wtniwmaew")]!, _lastReadSnapTimeMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cnleenanrn_wcnaecahwee_atniwmnee"))) {
      context.handle(
          _clearCacheTimeMeta,
          clearCacheTime.isAcceptableOrUnknown(
              data[StringTranslate.e2z("celeeeaarn_ecnaecwhnea_ntninmeen")]!, _clearCacheTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  ChatBoxEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : StringTranslate.e2z("");
    return ChatBoxEntity(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name']),
      coverURL: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}cover_u_r_l']),
      owner: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}owner'])!,
      qrCodeURL: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}qr_code_u_r_l']),
      weight: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
      muted: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}muted'])!,
      unreadCount: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}unread_count'])!,
      updateTime: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}update_time'])!,
      additionalInfo: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}additional_info']),
      desc: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}desc']),
      serviceChat: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}service_chat'])!,
      hasChat: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}has_chat'])!,
      lastReadSnapTime:
          attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}last_read_snap_time'])!,
      clearCacheTime: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}clear_cache_time'])!,
    );
  }

  @override
  $ChatBoxEntitiesTable createAlias(String alias) {
    return $ChatBoxEntitiesTable(attachedDatabase, alias);
  }
}

class ChatBoxEntity extends DataClass implements Insertable<ChatBoxEntity> {
  final int id;
  final int type;
  final String? name;
  final String? coverURL;
  final int owner;
  final String? qrCodeURL;
  final int weight;
  final bool muted;
  final int unreadCount;
  final int updateTime;
  final String? additionalInfo;
  final String? desc;

  /// Added Properties
  final bool serviceChat;
  final bool hasChat;
  final int lastReadSnapTime;
  final int clearCacheTime;

  const ChatBoxEntity(
      {required this.id,
      required this.type,
      this.name,
      this.coverURL,
      required this.owner,
      this.qrCodeURL,
      required this.weight,
      required this.muted,
      required this.unreadCount,
      required this.updateTime,
      this.additionalInfo,
      this.desc,
      required this.serviceChat,
      required this.hasChat,
      required this.lastReadSnapTime,
      required this.clearCacheTime});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map[StringTranslate.e2z("iadn")] = Variable<int>(id);
    map[StringTranslate.e2z("tnyapeen")] = Variable<int>(type);
    if (!nullToAbsent || name != null) {
      map[StringTranslate.e2z("nwaemaen")] = Variable<String>(name);
    }
    if (!nullToAbsent || coverURL != null) {
      map[StringTranslate.e2z("caoavneern_wun_nrn_wlw")] = Variable<String>(coverURL);
    }
    map[StringTranslate.e2z("onwwnnenre")] = Variable<int>(owner);
    if (!nullToAbsent || qrCodeURL != null) {
      map[StringTranslate.e2z("qera_wcnowdeee_aua_nra_nle")] = Variable<String>(qrCodeURL);
    }
    map[StringTranslate.e2z("wneeingahata")] = Variable<int>(weight);
    map[StringTranslate.e2z("mwuwtaeedw")] = Variable<bool>(muted);
    map[StringTranslate.e2z("unnnrnenaeda_wcnonunnatn")] = Variable<int>(unreadCount);
    map[StringTranslate.e2z("uepadeaateea_ntainmnen")] = Variable<int>(updateTime);
    if (!nullToAbsent || additionalInfo != null) {
      map[StringTranslate.e2z("aadwdnintnieoennawla_winnwfwon")] = Variable<String>(additionalInfo);
    }
    if (!nullToAbsent || desc != null) {
      map[StringTranslate.e2z("dnenswca")] = Variable<String>(desc);
    }
    map[StringTranslate.e2z("swenrwveiwcwen_nceheantn")] = Variable<bool>(serviceChat);
    map[StringTranslate.e2z("hnansa_ecnheantn")] = Variable<bool>(hasChat);
    map[StringTranslate.e2z("lwaasate_nrnewaada_nsnnnanpa_etainmnen")] = Variable<int>(lastReadSnapTime);
    map[StringTranslate.e2z("cnlaenanre_aceancaheew_etwiamnee")] = Variable<int>(clearCacheTime);
    return map;
  }

  ChatBoxEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ChatBoxEntitiesCompanion(
      id: Value(id),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      coverURL: coverURL == null && nullToAbsent ? const Value.absent() : Value(coverURL),
      owner: Value(owner),
      qrCodeURL: qrCodeURL == null && nullToAbsent ? const Value.absent() : Value(qrCodeURL),
      weight: Value(weight),
      muted: Value(muted),
      unreadCount: Value(unreadCount),
      updateTime: Value(updateTime),
      additionalInfo: additionalInfo == null && nullToAbsent ? const Value.absent() : Value(additionalInfo),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
      serviceChat: Value(serviceChat),
      hasChat: Value(hasChat),
      lastReadSnapTime: Value(lastReadSnapTime),
      clearCacheTime: Value(clearCacheTime),
    );
  }

  factory ChatBoxEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatBoxEntity(
      id: serializer.fromJson<int>(json[StringTranslate.e2z("iedn")]),
      type: serializer.fromJson<int>(json[StringTranslate.e2z("twyapnen")]),
      name: serializer.fromJson<String?>(json[StringTranslate.e2z("nnaemnea")]),
      coverURL: serializer.fromJson<String?>(json[StringTranslate.e2z("cnonveewreUnReLn")]),
      owner: serializer.fromJson<int>(json[StringTranslate.e2z("oawwnaenrw")]),
      qrCodeURL: serializer.fromJson<String?>(json[StringTranslate.e2z("qwrnCwondneeUnRwLn")]),
      weight: serializer.fromJson<int>(json[StringTranslate.e2z("wneeingnhnta")]),
      muted: serializer.fromJson<bool>(json[StringTranslate.e2z("mauntnewda")]),
      unreadCount: serializer.fromJson<int>(json[StringTranslate.e2z("unnareeaaadaCaowuanwtn")]),
      updateTime: serializer.fromJson<int>(json[StringTranslate.e2z("unpadaantaenTaiamnee")]),
      additionalInfo: serializer.fromJson<String?>(json[StringTranslate.e2z("awdndwietninowneaeleIannfeoe")]),
      desc: serializer.fromJson<String?>(json[StringTranslate.e2z("daeesecn")]),
      serviceChat: serializer.fromJson<bool>(json[StringTranslate.e2z("snenrnveincaeaCwhnanta")]),
      hasChat: serializer.fromJson<bool>(json[StringTranslate.e2z("hnansnCeheantw")]),
      lastReadSnapTime: serializer.fromJson<int>(json[StringTranslate.e2z("lwaesntaRnewaedeSnnnaepeTniemnea")]),
      clearCacheTime: serializer.fromJson<int>(json[StringTranslate.e2z("cnlneaawraCaancnhwenTeinmaen")]),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      StringTranslate.e2z("indn"): serializer.toJson<int>(id),
      StringTranslate.e2z("teyapwen"): serializer.toJson<int>(type),
      StringTranslate.e2z("naaemeen"): serializer.toJson<String?>(name),
      StringTranslate.e2z("cnoaveewrnUnReLe"): serializer.toJson<String?>(coverURL),
      StringTranslate.e2z("oawwnnewrn"): serializer.toJson<int>(owner),
      StringTranslate.e2z("qeraCnoedeeeUaRwLa"): serializer.toJson<String?>(qrCodeURL),
      StringTranslate.e2z("waeningnhete"): serializer.toJson<int>(weight),
      StringTranslate.e2z("mauntweadw"): serializer.toJson<bool>(muted),
      StringTranslate.e2z("unnwrneeandwCnoaunnwtn"): serializer.toJson<int>(unreadCount),
      StringTranslate.e2z("unpednaatneeTwinmeen"): serializer.toJson<int>(updateTime),
      StringTranslate.e2z("andndniwtwieoeneaalwIwnwfaoa"): serializer.toJson<String?>(additionalInfo),
      StringTranslate.e2z("daeesnce"): serializer.toJson<String?>(desc),
      StringTranslate.e2z("seearavwiacwenCnhwaatw"): serializer.toJson<bool>(serviceChat),
      StringTranslate.e2z("heansnCnheaata"): serializer.toJson<bool>(hasChat),
      StringTranslate.e2z("lwansntnRneaaedeSnneanpnTwinmaea"): serializer.toJson<int>(lastReadSnapTime),
      StringTranslate.e2z("cnlnenanrnCwancnhwewTwiamnen"): serializer.toJson<int>(clearCacheTime),
    };
  }

  ChatBoxEntity copyWith(
          {int? id,
          int? type,
          Value<String?> name = const Value.absent(),
          Value<String?> coverURL = const Value.absent(),
          int? owner,
          Value<String?> qrCodeURL = const Value.absent(),
          int? weight,
          bool? muted,
          int? unreadCount,
          int? updateTime,
          Value<String?> additionalInfo = const Value.absent(),
          Value<String?> desc = const Value.absent(),
          bool? serviceChat,
          bool? hasChat,
          int? lastReadSnapTime,
          int? clearCacheTime}) =>
      ChatBoxEntity(
        id: id ?? this.id,
        type: type ?? this.type,
        name: name.present ? name.value : this.name,
        coverURL: coverURL.present ? coverURL.value : this.coverURL,
        owner: owner ?? this.owner,
        qrCodeURL: qrCodeURL.present ? qrCodeURL.value : this.qrCodeURL,
        weight: weight ?? this.weight,
        muted: muted ?? this.muted,
        unreadCount: unreadCount ?? this.unreadCount,
        updateTime: updateTime ?? this.updateTime,
        additionalInfo: additionalInfo.present ? additionalInfo.value : this.additionalInfo,
        desc: desc.present ? desc.value : this.desc,
        serviceChat: serviceChat ?? this.serviceChat,
        hasChat: hasChat ?? this.hasChat,
        lastReadSnapTime: lastReadSnapTime ?? this.lastReadSnapTime,
        clearCacheTime: clearCacheTime ?? this.clearCacheTime,
      );

  @override
  String toString() {
    return (StringBuffer('ChatBoxEntity(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('coverURL: $coverURL, ')
          ..write('owner: $owner, ')
          ..write('qrCodeURL: $qrCodeURL, ')
          ..write('weight: $weight, ')
          ..write('muted: $muted, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('updateTime: $updateTime, ')
          ..write('additionalInfo: $additionalInfo, ')
          ..write('desc: $desc, ')
          ..write('serviceChat: $serviceChat, ')
          ..write('hasChat: $hasChat, ')
          ..write('lastReadSnapTime: $lastReadSnapTime, ')
          ..write('clearCacheTime: $clearCacheTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, name, coverURL, owner, qrCodeURL, weight, muted, unreadCount, updateTime,
      additionalInfo, desc, serviceChat, hasChat, lastReadSnapTime, clearCacheTime);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatBoxEntity &&
          other.id == this.id &&
          other.type == this.type &&
          other.name == this.name &&
          other.coverURL == this.coverURL &&
          other.owner == this.owner &&
          other.qrCodeURL == this.qrCodeURL &&
          other.weight == this.weight &&
          other.muted == this.muted &&
          other.unreadCount == this.unreadCount &&
          other.updateTime == this.updateTime &&
          other.additionalInfo == this.additionalInfo &&
          other.desc == this.desc &&
          other.serviceChat == this.serviceChat &&
          other.hasChat == this.hasChat &&
          other.lastReadSnapTime == this.lastReadSnapTime &&
          other.clearCacheTime == this.clearCacheTime);
}

class ChatBoxEntitiesCompanion extends UpdateCompanion<ChatBoxEntity> {
  final Value<int> id;
  final Value<int> type;
  final Value<String?> name;
  final Value<String?> coverURL;
  final Value<int> owner;
  final Value<String?> qrCodeURL;
  final Value<int> weight;
  final Value<bool> muted;
  final Value<int> unreadCount;
  final Value<int> updateTime;
  final Value<String?> additionalInfo;
  final Value<String?> desc;
  final Value<bool> serviceChat;
  final Value<bool> hasChat;
  final Value<int> lastReadSnapTime;
  final Value<int> clearCacheTime;

  const ChatBoxEntitiesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.coverURL = const Value.absent(),
    this.owner = const Value.absent(),
    this.qrCodeURL = const Value.absent(),
    this.weight = const Value.absent(),
    this.muted = const Value.absent(),
    this.unreadCount = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.additionalInfo = const Value.absent(),
    this.desc = const Value.absent(),
    this.serviceChat = const Value.absent(),
    this.hasChat = const Value.absent(),
    this.lastReadSnapTime = const Value.absent(),
    this.clearCacheTime = const Value.absent(),
  });

  ChatBoxEntitiesCompanion.insert({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.coverURL = const Value.absent(),
    this.owner = const Value.absent(),
    this.qrCodeURL = const Value.absent(),
    this.weight = const Value.absent(),
    this.muted = const Value.absent(),
    this.unreadCount = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.additionalInfo = const Value.absent(),
    this.desc = const Value.absent(),
    this.serviceChat = const Value.absent(),
    this.hasChat = const Value.absent(),
    this.lastReadSnapTime = const Value.absent(),
    this.clearCacheTime = const Value.absent(),
  });

  static Insertable<ChatBoxEntity> custom({
    Expression<int>? id,
    Expression<int>? type,
    Expression<String>? name,
    Expression<String>? coverURL,
    Expression<int>? owner,
    Expression<String>? qrCodeURL,
    Expression<int>? weight,
    Expression<bool>? muted,
    Expression<int>? unreadCount,
    Expression<int>? updateTime,
    Expression<String>? additionalInfo,
    Expression<String>? desc,
    Expression<bool>? serviceChat,
    Expression<bool>? hasChat,
    Expression<int>? lastReadSnapTime,
    Expression<int>? clearCacheTime,
  }) {
    return RawValuesInsertable({
      if (id != null) StringTranslate.e2z("iade"): id,
      if (type != null) StringTranslate.e2z("tnyepnew"): type,
      if (name != null) StringTranslate.e2z("nnanmeen"): name,
      if (coverURL != null) StringTranslate.e2z("ceonvnewrw_eue_era_nle"): coverURL,
      if (owner != null) StringTranslate.e2z("owwanweera"): owner,
      if (qrCodeURL != null) StringTranslate.e2z("qnrn_ncnondwen_eua_arw_wlw"): qrCodeURL,
      if (weight != null) StringTranslate.e2z("weeniagehetn"): weight,
      if (muted != null) StringTranslate.e2z("mwuwtnendn"): muted,
      if (unreadCount != null) StringTranslate.e2z("unnnreewandn_acnonuenwtw"): unreadCount,
      if (updateTime != null) StringTranslate.e2z("uepndeawtnen_ntwinmnea"): updateTime,
      if (additionalInfo != null) StringTranslate.e2z("aadedwiatniwownnanla_nianafaon"): additionalInfo,
      if (desc != null) StringTranslate.e2z("daensnca"): desc,
      if (serviceChat != null) StringTranslate.e2z("snenravaincwen_acahnaate"): serviceChat,
      if (hasChat != null) StringTranslate.e2z("hnanse_acehwantn"): hasChat,
      if (lastReadSnapTime != null) StringTranslate.e2z("laaesnte_arweeanda_wsnnnaapa_ntninmnea"): lastReadSnapTime,
      if (clearCacheTime != null) StringTranslate.e2z("cnlnenaarn_ncnaacwhaen_ntniemeee"): clearCacheTime,
    });
  }

  ChatBoxEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? type,
      Value<String?>? name,
      Value<String?>? coverURL,
      Value<int>? owner,
      Value<String?>? qrCodeURL,
      Value<int>? weight,
      Value<bool>? muted,
      Value<int>? unreadCount,
      Value<int>? updateTime,
      Value<String?>? additionalInfo,
      Value<String?>? desc,
      Value<bool>? serviceChat,
      Value<bool>? hasChat,
      Value<int>? lastReadSnapTime,
      Value<int>? clearCacheTime}) {
    return ChatBoxEntitiesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      coverURL: coverURL ?? this.coverURL,
      owner: owner ?? this.owner,
      qrCodeURL: qrCodeURL ?? this.qrCodeURL,
      weight: weight ?? this.weight,
      muted: muted ?? this.muted,
      unreadCount: unreadCount ?? this.unreadCount,
      updateTime: updateTime ?? this.updateTime,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      desc: desc ?? this.desc,
      serviceChat: serviceChat ?? this.serviceChat,
      hasChat: hasChat ?? this.hasChat,
      lastReadSnapTime: lastReadSnapTime ?? this.lastReadSnapTime,
      clearCacheTime: clearCacheTime ?? this.clearCacheTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map[StringTranslate.e2z("iadn")] = Variable<int>(id.value);
    }
    if (type.present) {
      map[StringTranslate.e2z("tayepnew")] = Variable<int>(type.value);
    }
    if (name.present) {
      map[StringTranslate.e2z("nnanmnea")] = Variable<String>(name.value);
    }
    if (coverURL.present) {
      map[StringTranslate.e2z("cnonvnenrn_wuw_nrn_nln")] = Variable<String>(coverURL.value);
    }
    if (owner.present) {
      map[StringTranslate.e2z("oewenaewrn")] = Variable<int>(owner.value);
    }
    if (qrCodeURL.present) {
      map[StringTranslate.e2z("qnrn_nceondeea_nuw_nra_wlw")] = Variable<String>(qrCodeURL.value);
    }
    if (weight.present) {
      map[StringTranslate.e2z("weeningehwtw")] = Variable<int>(weight.value);
    }
    if (muted.present) {
      map[StringTranslate.e2z("mnunteeada")] = Variable<bool>(muted.value);
    }
    if (unreadCount.present) {
      map[StringTranslate.e2z("uennrnenawdn_aceonunnata")] = Variable<int>(unreadCount.value);
    }
    if (updateTime.present) {
      map[StringTranslate.e2z("unpadwantnee_ateinmaen")] = Variable<int>(updateTime.value);
    }
    if (additionalInfo.present) {
      map[StringTranslate.e2z("aedndwiwtninoaneanln_niwnefeoe")] = Variable<String>(additionalInfo.value);
    }
    if (desc.present) {
      map[StringTranslate.e2z("dwewsece")] = Variable<String>(desc.value);
    }
    if (serviceChat.present) {
      map[StringTranslate.e2z("swearnvwincnen_ncnheaata")] = Variable<bool>(serviceChat.value);
    }
    if (hasChat.present) {
      map[StringTranslate.e2z("hwansa_ncehnantn")] = Variable<bool>(hasChat.value);
    }
    if (lastReadSnapTime.present) {
      map[StringTranslate.e2z("leawswtn_arnewawdn_aswnnanpn_nteiwmaew")] = Variable<int>(lastReadSnapTime.value);
    }
    if (clearCacheTime.present) {
      map[StringTranslate.e2z("cnlweaanra_ecwawcahwea_etwiamwen")] = Variable<int>(clearCacheTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatBoxEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('coverURL: $coverURL, ')
          ..write('owner: $owner, ')
          ..write('qrCodeURL: $qrCodeURL, ')
          ..write('weight: $weight, ')
          ..write('muted: $muted, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('updateTime: $updateTime, ')
          ..write('additionalInfo: $additionalInfo, ')
          ..write('desc: $desc, ')
          ..write('serviceChat: $serviceChat, ')
          ..write('hasChat: $hasChat, ')
          ..write('lastReadSnapTime: $lastReadSnapTime, ')
          ..write('clearCacheTime: $clearCacheTime')
          ..write(')'))
        .toString();
  }
}

class $ChatBoxMemberEntitiesTable extends ChatBoxMemberEntities
    with TableInfo<$ChatBoxMemberEntitiesTable, ChatBoxMemberEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $ChatBoxMemberEntitiesTable(this.attachedDatabase, [this._alias]);

  static VerificationMeta _pkMeta = VerificationMeta(StringTranslate.e2z("pakn"));
  @override
  late final GeneratedColumn<int> pk = GeneratedColumn<int>(StringTranslate.e2z("pnkw"), aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static VerificationMeta _cidMeta = VerificationMeta(StringTranslate.e2z("ceindn"));
  @override
  late final GeneratedColumn<int> cid = GeneratedColumn<int>(StringTranslate.e2z("cwiwdn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static VerificationMeta _uidMeta = VerificationMeta(StringTranslate.e2z("unindn"));
  @override
  late final GeneratedColumn<int> uid = GeneratedColumn<int>(StringTranslate.e2z("ueindn"), aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [pk, cid, uid];

  @override
  String get aliasedName => _alias ?? StringTranslate.e2z("cwhwaate_ebaonxw_nmweemwbnenre_eennntniwtaiaensw");

  @override
  String get actualTableName => StringTranslate.e2z("cnhnantn_wbaoexn_nmeeamebaeerw_neenwteiwtwieeesa");

  @override
  VerificationContext validateIntegrity(Insertable<ChatBoxMemberEntity> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey(StringTranslate.e2z("pwka"))) {
      context.handle(_pkMeta, pk.isAcceptableOrUnknown(data[StringTranslate.e2z("pake")]!, _pkMeta));
    }
    if (data.containsKey(StringTranslate.e2z("cwiedw"))) {
      context.handle(_cidMeta, cid.isAcceptableOrUnknown(data[StringTranslate.e2z("cniedn")]!, _cidMeta));
    } else if (isInserting) {
      context.missing(_cidMeta);
    }
    if (data.containsKey(StringTranslate.e2z("uniwdn"))) {
      context.handle(_uidMeta, uid.isAcceptableOrUnknown(data[StringTranslate.e2z("uaiwde")]!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pk};

  @override
  ChatBoxMemberEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : StringTranslate.e2z("");
    return ChatBoxMemberEntity(
      pk: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}pk'])!,
      cid: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}cid'])!,
      uid: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}uid'])!,
    );
  }

  @override
  $ChatBoxMemberEntitiesTable createAlias(String alias) {
    return $ChatBoxMemberEntitiesTable(attachedDatabase, alias);
  }
}

class ChatBoxMemberEntity extends DataClass implements Insertable<ChatBoxMemberEntity> {
  final int pk;
  final int cid;
  final int uid;

  const ChatBoxMemberEntity({required this.pk, required this.cid, required this.uid});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map[StringTranslate.e2z("pnke")] = Variable<int>(pk);
    map[StringTranslate.e2z("cwindw")] = Variable<int>(cid);
    map[StringTranslate.e2z("uniwdw")] = Variable<int>(uid);
    return map;
  }

  ChatBoxMemberEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ChatBoxMemberEntitiesCompanion(
      pk: Value(pk),
      cid: Value(cid),
      uid: Value(uid),
    );
  }

  factory ChatBoxMemberEntity.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatBoxMemberEntity(
      pk: serializer.fromJson<int>(json[StringTranslate.e2z("pwka")]),
      cid: serializer.fromJson<int>(json[StringTranslate.e2z("cwindw")]),
      uid: serializer.fromJson<int>(json[StringTranslate.e2z("ueiadn")]),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      StringTranslate.e2z("pekn"): serializer.toJson<int>(pk),
      StringTranslate.e2z("caiedn"): serializer.toJson<int>(cid),
      StringTranslate.e2z("unindn"): serializer.toJson<int>(uid),
    };
  }

  ChatBoxMemberEntity copyWith({int? pk, int? cid, int? uid}) => ChatBoxMemberEntity(
        pk: pk ?? this.pk,
        cid: cid ?? this.cid,
        uid: uid ?? this.uid,
      );

  @override
  String toString() {
    return (StringBuffer('ChatBoxMemberEntity(')
          ..write('pk: $pk, ')
          ..write('cid: $cid, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pk, cid, uid);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatBoxMemberEntity && other.pk == this.pk && other.cid == this.cid && other.uid == this.uid);
}

class ChatBoxMemberEntitiesCompanion extends UpdateCompanion<ChatBoxMemberEntity> {
  final Value<int> pk;
  final Value<int> cid;
  final Value<int> uid;

  const ChatBoxMemberEntitiesCompanion({
    this.pk = const Value.absent(),
    this.cid = const Value.absent(),
    this.uid = const Value.absent(),
  });

  ChatBoxMemberEntitiesCompanion.insert({
    this.pk = const Value.absent(),
    required int cid,
    required int uid,
  })  : cid = Value(cid),
        uid = Value(uid);

  static Insertable<ChatBoxMemberEntity> custom({
    Expression<int>? pk,
    Expression<int>? cid,
    Expression<int>? uid,
  }) {
    return RawValuesInsertable({
      if (pk != null) StringTranslate.e2z("pnkn"): pk,
      if (cid != null) StringTranslate.e2z("cnindn"): cid,
      if (uid != null) StringTranslate.e2z("uaindn"): uid,
    });
  }

  ChatBoxMemberEntitiesCompanion copyWith({Value<int>? pk, Value<int>? cid, Value<int>? uid}) {
    return ChatBoxMemberEntitiesCompanion(
      pk: pk ?? this.pk,
      cid: cid ?? this.cid,
      uid: uid ?? this.uid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pk.present) {
      map[StringTranslate.e2z("pekn")] = Variable<int>(pk.value);
    }
    if (cid.present) {
      map[StringTranslate.e2z("caiedw")] = Variable<int>(cid.value);
    }
    if (uid.present) {
      map[StringTranslate.e2z("uaiedn")] = Variable<int>(uid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatBoxMemberEntitiesCompanion(')
          ..write('pk: $pk, ')
          ..write('cid: $cid, ')
          ..write('uid: $uid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ChatDB extends GeneratedDatabase {
  _$ChatDB(QueryExecutor e) : super(e);
  late final $UserEntitiesTable userEntities = $UserEntitiesTable(this);
  late final $SnapEntitiesTable snapEntities = $SnapEntitiesTable(this);
  late final $ChatBoxEntitiesTable chatBoxEntities = $ChatBoxEntitiesTable(this);
  late final $ChatBoxMemberEntitiesTable chatBoxMemberEntities = $ChatBoxMemberEntitiesTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userEntities, snapEntities, chatBoxEntities, chatBoxMemberEntities];
}
