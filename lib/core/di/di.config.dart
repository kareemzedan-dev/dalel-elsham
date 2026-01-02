// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/data_sources_impl/remote/auth_remote_data_source_impl.dart'
    as _i420;
import '../../features/auth/data/repos_impl/auth_repo_impl.dart' as _i704;
import '../../features/auth/domain/repos/auth_repos/auth_repos.dart' as _i194;
import '../../features/auth/domain/use_cases/auth_usecase/auth_usecase.dart'
    as _i1028;
import '../../features/auth/presentation/manager/delete_account_view_model/delete_account_view_model.dart'
    as _i710;
import '../../features/auth/presentation/manager/login_view_model/login_view_model.dart'
    as _i573;
import '../../features/auth/presentation/manager/register_view_model/register_view_model.dart'
    as _i19;
import '../../features/currency/data/data_sources/remote/get_usd_to_syp_remote_data_source/get_usd_to_syp_remote_data_source.dart'
    as _i679;
import '../../features/currency/data/data_sources_impl/remote/get_usd_to_syp_remote_data_source_impl/get_usd_to_syp_remote_data_source_impl.dart'
    as _i166;
import '../../features/currency/data/repos_impl/get_usd_to_syp_repo_impl/get_usd_to_syp_repo_impl.dart'
    as _i859;
import '../../features/currency/domain/repos/get_usd_to_syp_repo/get_usd_to_syp_repo.dart'
    as _i532;
import '../../features/currency/domain/use_cases/get_usd_to_syp_use_case/get_usd_to_syp_use_case.dart'
    as _i62;
import '../../features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model.dart'
    as _i345;
import '../../features/home/presentation/tabs/dalel_elsham/data/data_sources/remote/dalel_al_sham_place_remote_data_source/dalel_al_sham_place_remote_data_source.dart'
    as _i636;
import '../../features/home/presentation/tabs/dalel_elsham/data/data_sources_impl/remote/dalel_al_sham_place_remote_data_source_impl/dalel_al_sham_place_remote_data_source_impl.dart'
    as _i813;
import '../../features/home/presentation/tabs/dalel_elsham/data/repos_impl/dalel_al_sham_place_repo_impl/dalel_al_sham_place_repo_impl.dart'
    as _i190;
import '../../features/home/presentation/tabs/dalel_elsham/domain/repos/dalel_al_sham_place_repo/dalel_al_sham_place_repo.dart'
    as _i130;
import '../../features/home/presentation/tabs/dalel_elsham/domain/use_case/dalel_al_sham_place_use_case/dalel_al_sham_place_use_case.dart'
    as _i340;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/add_place_view_model/add_place_view_model.dart'
    as _i963;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/delete_place_view_model/delete_place_view_model.dart'
    as _i313;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_place_categories_view_model/get_all_place_categories_view_model.dart'
    as _i729;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_place_view_model/get_all_place_view_model.dart'
    as _i544;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/get_all_places_by_category_view_model/get_all_places_by_category_view_model.dart'
    as _i216;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/get_section_status_view_model/get_section_status_view_model.dart'
    as _i1059;
import '../../features/home/presentation/tabs/dalel_elsham/presentation/manager/update_place_view_model/update_place_view_model.dart'
    as _i660;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/app_links_remote_data_source/app_links_remote_data_source.dart'
    as _i455;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/banner_remote_data_source/banners_remote_data_source.dart'
    as _i1046;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/category_remote_data_source/category_remote_data_source.dart'
    as _i786;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/add_job_remote_data_source/add_job_remote_data_source.dart'
    as _i425;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/add_opportunity_remote_data_source/add_opportunity_remote_data_source.dart'
    as _i585;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/delete_job_remote_data_source/delete_job_remote_data_source.dart'
    as _i107;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/get_all_jobs_remote_data_source/get_all_jobs_remote_data_source.dart'
    as _i847;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/get_all_opportunities_remote_data_source/get_all_opportunities_remote_data_source.dart'
    as _i563;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/jobs/get_job_by_id_remote_data_source/get_job_by_id_remote_data_source.dart'
    as _i104;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/prayer_times_remote_data_source/prayer_times_remote_data_source.dart'
    as _i564;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/project_display_sections_remote_data_source/project_display_sections_remote_data_source.dart'
    as _i79;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/add_project_remote_data_source/add_project_remote_data_source.dart'
    as _i190;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/delete_project_remote_data_source/delete_project_remote_data_source.dart'
    as _i694;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/get_all_projects_remote_data_source/get_all_projects_remote_data_source.dart'
    as _i804;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/get_newest_projects_remote_data_source/get_newest_projects_remote_data_source.dart'
    as _i157;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/get_project_details_remote_data_source/get_project_details_remote_data_source.dart'
    as _i131;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/get_projects_by_category_remote_data_source/get_projects_by_category_remote_data_source.dart'
    as _i168;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/get_projects_by_display_section_remote_data_source/get_projects_by_display_section_remote_data_source.dart'
    as _i912;
import '../../features/home/presentation/tabs/home/data/data_sources/remote/projects/update_project_remote_data_source/update_project_remote_data_source.dart'
    as _i440;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/app_links_remote_data_source_impl/app_links_remote_data_source.dart'
    as _i635;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/banner_remote_data_source_impl/banners_remote_data_source_impl.dart'
    as _i576;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/category_remote_data_source_impl/category_remote_data_source_impl.dart'
    as _i924;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/get_projects_by_display_section_remote_data_source_impl/get_projects_by_display_section_remote_data_source_impl.dart'
    as _i278;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/add_job_remote_data_source_impl/add_job_remote_data_source_impl.dart'
    as _i598;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/add_opportunity_remote_data_source_impl/add_opportunity_remote_data_source_impl.dart'
    as _i939;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/delete_job_remote_data_source_impl/delete_job_remote_data_source_impl.dart'
    as _i370;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/get_all_jobs_remote_data_source_impl/get_all_jobs_remote_data_source_impl.dart'
    as _i969;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/get_all_opportunities_remote_data_source_impl/get_all_opportunities_remote_data_source_impl.dart'
    as _i501;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/jobs/get_job_by_id_remote_data_source_impl/get_job_by_id_remote_data_source_impl.dart'
    as _i12;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/prayer_times_remote_data_source_impl/prayer_times_remote_data_source_impl.dart'
    as _i298;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/project_display_sections_remote_data_source_impl/project_display_sections_remote_data_source_impl.dart'
    as _i1032;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/add_project_remote_data_source_impl/add_project_remote_data_source_impl.dart'
    as _i1047;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/delete_project_remote_data_source_impl/delete_project_remote_data_source_impl.dart'
    as _i487;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/get_all_projects_remote_data_source_impl/get_all_projects_remote_data_source_impl.dart'
    as _i113;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/get_newest_projects_remote_data_source_impl/get_newest_projects_remote_data_source_impl.dart'
    as _i64;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/get_project_details_remote_data_source_impl/get_project_details_remote_data_source_impl.dart'
    as _i379;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/get_projects_by_category_remote_data_source_impl/get_projects_by_category_remote_data_source_impl.dart'
    as _i570;
import '../../features/home/presentation/tabs/home/data/data_sources_impl/remote/projects/update_project_remote_data_source_impl/update_project_remote_data_source_impl.dart'
    as _i394;
import '../../features/home/presentation/tabs/home/data/repos_impl/app_links_repo_impl/app_links_repo_impl.dart'
    as _i21;
import '../../features/home/presentation/tabs/home/data/repos_impl/banners_repos_impl/banners_repos_impl.dart'
    as _i203;
import '../../features/home/presentation/tabs/home/data/repos_impl/category_repos_impl/category_repos_impl.dart'
    as _i672;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/add_job_repo_impl/add_job_repo_impl.dart'
    as _i971;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/add_opportunity_repo_impl/add_opportunity_repo_impl.dart'
    as _i658;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/delete_job_repo_impl/delete_job_repo_impl.dart'
    as _i664;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/get_all_jobs_repo_impl/get_all_jobs_repo_impl.dart'
    as _i394;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/get_all_opportunities_repo_impl/get_all_opportunities_repo_impl.dart'
    as _i134;
import '../../features/home/presentation/tabs/home/data/repos_impl/job/get_job_by_id_repo_impl/get_job_by_id_repo_impl.dart'
    as _i93;
import '../../features/home/presentation/tabs/home/data/repos_impl/prayer_times_repository_impl/prayer_times_repository_impl.dart'
    as _i444;
import '../../features/home/presentation/tabs/home/data/repos_impl/project_display_sections_repository_impl/project_display_sections_repository_impl.dart'
    as _i968;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/add_project_repository_impl/add_project_repository_impl.dart'
    as _i63;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/delete_project_repository_impl/delete_project_repository_impl.dart'
    as _i687;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/get_all_projects_repository_impl/get_all_projects_repository_impl.dart'
    as _i528;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/get_newest_projects_repository_impl/get_newest_projects_repository.dart'
    as _i766;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/get_project_details_repository_impl/get_project_details_repository_impl.dart'
    as _i80;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/get_projects_by_category_repository_impl/get_projects_by_category_repository_impl.dart'
    as _i61;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/get_projects_by_display_section_repository_impl/get_projects_by_display_section_repository_impl.dart'
    as _i100;
import '../../features/home/presentation/tabs/home/data/repos_impl/projects/update_project_repository_impl/update_project_repository_impl.dart'
    as _i1018;
import '../../features/home/presentation/tabs/home/domain/repos/app_links_repo/app_links_repo.dart'
    as _i978;
import '../../features/home/presentation/tabs/home/domain/repos/banner_repository/banner_repository.dart'
    as _i572;
import '../../features/home/presentation/tabs/home/domain/repos/category_repos/category_repos.dart'
    as _i1066;
import '../../features/home/presentation/tabs/home/domain/repos/job/add_job_repo/add_job_repo.dart'
    as _i569;
import '../../features/home/presentation/tabs/home/domain/repos/job/add_opportunity_repo/add_opportunity_repo.dart'
    as _i495;
import '../../features/home/presentation/tabs/home/domain/repos/job/delete_job_repo/delete_job_repo.dart'
    as _i686;
import '../../features/home/presentation/tabs/home/domain/repos/job/get_all_jobs_repo/get_all_jobs_repo.dart'
    as _i903;
import '../../features/home/presentation/tabs/home/domain/repos/job/get_all_opportunities_repo/get_all_opportunities_repo.dart'
    as _i272;
import '../../features/home/presentation/tabs/home/domain/repos/job/get_job_by_id_repo/get_job_by_id_repo.dart'
    as _i108;
import '../../features/home/presentation/tabs/home/domain/repos/prayer_times_repository/prayer_times_repository.dart'
    as _i118;
import '../../features/home/presentation/tabs/home/domain/repos/project_display_sections_repository/project_display_sections_repository.dart'
    as _i377;
import '../../features/home/presentation/tabs/home/domain/repos/projects/add_project_repository/add_project_repository.dart'
    as _i45;
import '../../features/home/presentation/tabs/home/domain/repos/projects/delete_project_repository/delete_project_repository.dart'
    as _i822;
import '../../features/home/presentation/tabs/home/domain/repos/projects/get_all_projects_repository/get_all_projects_repository.dart'
    as _i925;
import '../../features/home/presentation/tabs/home/domain/repos/projects/get_newest_projects_repository/get_newest_projects_repository.dart'
    as _i977;
import '../../features/home/presentation/tabs/home/domain/repos/projects/get_project_details_repository/get_project_details_repository.dart'
    as _i184;
import '../../features/home/presentation/tabs/home/domain/repos/projects/get_projects_by_category_repository/get_projects_by_category_repository.dart'
    as _i250;
import '../../features/home/presentation/tabs/home/domain/repos/projects/get_projects_by_display_section_repository/get_projects_by_display_section_repository.dart'
    as _i741;
import '../../features/home/presentation/tabs/home/domain/repos/projects/update_project_repository/update_project_repository.dart'
    as _i943;
import '../../features/home/presentation/tabs/home/domain/use_cases/app_links_usecase/app_links_usecase.dart'
    as _i1018;
import '../../features/home/presentation/tabs/home/domain/use_cases/banner_use_case/banner_use_case.dart'
    as _i369;
import '../../features/home/presentation/tabs/home/domain/use_cases/category_use_case/category_use_case.dart'
    as _i886;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/add_job_usecase/add_job_usecase.dart'
    as _i1047;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/add_opportunity_usecase/add_opportunity_usecase.dart'
    as _i203;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/delete_job_usecase/delete_job_usecase.dart'
    as _i111;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_all_jobs_usecase/get_all_jobs_usecase.dart'
    as _i772;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_all_opportunities_usecase/get_all_opportunities_usecase.dart'
    as _i365;
import '../../features/home/presentation/tabs/home/domain/use_cases/jobs_use_case/get_job_by_id_usecase/get_job_by_id_usecase.dart'
    as _i117;
import '../../features/home/presentation/tabs/home/domain/use_cases/prayer_times_usecase/prayer_times_usecase.dart'
    as _i308;
import '../../features/home/presentation/tabs/home/domain/use_cases/project_display_sections_use_case/project_display_sections_use_case.dart'
    as _i297;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/add_project_usecase/add_project_usecase.dart'
    as _i180;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/delete_project_usecase/delete_project_usecase.dart'
    as _i329;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/get_all_projects_usecase/get_all_projects_usecase.dart'
    as _i508;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/get_newest_projects_usecase/get_newest_projects_usecase.dart'
    as _i667;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/get_project_details_usecase/get_project_details_usecase.dart'
    as _i966;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/get_projects_by_category_usecase/get_projects_by_category_usecase.dart'
    as _i654;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/get_projects_by_display_section_use_case/get_projects_by_display_section_use_case.dart'
    as _i1000;
import '../../features/home/presentation/tabs/home/domain/use_cases/projects/update_project_usecase/update_project_usecase.dart'
    as _i645;
import '../../features/home/presentation/tabs/home/presentation/manager/app_links/add_or_update_link_view_model/add_or_update_link_view_model.dart'
    as _i529;
import '../../features/home/presentation/tabs/home/presentation/manager/app_links/get_all_app_links_view_model/get_all_app_links_view_model.dart'
    as _i730;
import '../../features/home/presentation/tabs/home/presentation/manager/banners/get_banners_by_position_view_model/get_banners_by_position_view_model.dart'
    as _i76;
import '../../features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart'
    as _i623;
import '../../features/home/presentation/tabs/home/presentation/manager/jobs/add_job_view_model/add_job_view_model.dart'
    as _i640;
import '../../features/home/presentation/tabs/home/presentation/manager/jobs/add_opportunity_view_model/add_opportunity_view_model.dart'
    as _i1036;
import '../../features/home/presentation/tabs/home/presentation/manager/jobs/get_all_jobs_view_model/get_all_jobs_view_model.dart'
    as _i29;
import '../../features/home/presentation/tabs/home/presentation/manager/jobs/get_all_opportunities_view_model/get_all_opportunities_view_model.dart'
    as _i1068;
import '../../features/home/presentation/tabs/home/presentation/manager/prayer_times_view_model/prayer_times_view_model.dart'
    as _i409;
import '../../features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/add_project_display_section_view_model/add_project_display_section_view_model.dart'
    as _i11;
import '../../features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/delete_project_display_section_view_model/delete_project_display_section_view_model.dart'
    as _i745;
import '../../features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/get_all_project_display_sections_view_model/get_all_project_display_sections_view_model.dart'
    as _i593;
import '../../features/home/presentation/tabs/home/presentation/manager/project_display_section_view_model/update_project_display_section_view_model/update_project_display_section_view_model.dart'
    as _i151;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/add_project_view_model/add_project_view_model.dart'
    as _i61;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/delete_project_view_model/delete_project_view_model.dart'
    as _i943;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/get_all_projects_view_model/get_all_projects_view_model.dart'
    as _i907;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/get_newest_projects_view_model/get_newest_projects_view_model.dart'
    as _i856;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/get_project_details_view_model/get_project_details_view_model.dart'
    as _i616;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/get_projects_by_category_view_model/get_projects_by_category_view_model.dart'
    as _i696;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/get_projects_by_display_section_view_model/get_projects_by_display_section_view_model.dart'
    as _i382;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/update_project_view_model/update_project_view_model.dart'
    as _i439;
import '../../features/home/presentation/tabs/home/presentation/manager/projects/update_project_views_view_model/update_project_views_view_model.dart'
    as _i1032;
import '../../features/weather/data/data_sources/remote/get_weather_remote_data_source/get_weather_remote_data_source.dart'
    as _i329;
import '../../features/weather/data/data_sources_impl/remote/get_weather_remote_data_source_impl/get_weather_remote_data_source_impl.dart'
    as _i962;
import '../../features/weather/data/repos_impl/get_weather_repo_impl/get_weather_repo_impl.dart'
    as _i686;
import '../../features/weather/domain/repos/get_weather_repo/get_weather_repo.dart'
    as _i48;
import '../../features/weather/domain/use_cases/get_weather_use_case/get_weather_use_case.dart'
    as _i327;
import '../../features/weather/presentation/manager/get_weather_view_model/get_weather_view_model.dart'
    as _i46;
import '../network/dio_module.dart' as _i614;
import '../services/firebase_service.dart' as _i758;
import '../services/firebase_service_impl.dart' as _i704;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i758.FirebaseService>(() => _i704.FirebaseServiceImpl());
    gh.factory<_i168.GetProjectsByCategoryRemoteDataSource>(
      () => _i570.GetProjectsByCategoryRemoteDataSourceImpl(
        gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i329.GetWeatherRemoteDataSource>(
      () => _i962.GetWeatherRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i694.DeleteProjectRemoteDataSource>(
      () =>
          _i487.DeleteProjectRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i636.DalelAlShamPlaceRemoteDataSource>(
      () => _i813.DalelAlShamPlaceRemoteDataSourceImpl(
        firebaseService: gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i564.PrayerTimesRemoteDataSource>(
      () => _i298.PrayerTimesRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i679.GetUsdToSypRemoteDataSource>(
      () => _i166.GetUsdToSypRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i190.AddProjectRemoteDataSource>(
      () => _i1047.AddProjectRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i440.UpdateProjectRemoteDataSource>(
      () =>
          _i394.UpdateProjectRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i822.DeleteProjectRepository>(
      () => _i687.DeleteProjectRepositoryImpl(
        gh<_i694.DeleteProjectRemoteDataSource>(),
      ),
    );
    gh.factory<_i912.GetProjectsByDisplaySectionRemoteDataSource>(
      () => _i278.GetProjectsByDisplaySectionRemoteDataSourceImpl(
        gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i741.GetProjectsByDisplaySectionRepository>(
      () => _i100.GetProjectsByDisplaySectionRepositoryImpl(
        gh<_i912.GetProjectsByDisplaySectionRemoteDataSource>(),
      ),
    );
    gh.factory<_i131.GetProjectDetailsRemoteDataSource>(
      () => _i379.GetProjectDetailsRemoteDataSourceImpl(
        gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i45.AddProjectRepository>(
      () =>
          _i63.AddProjectRepositoryImpl(gh<_i190.AddProjectRemoteDataSource>()),
    );
    gh.factory<_i250.GetProjectsByCategoryRepository>(
      () => _i61.GetProjectsByCategoryRepositoryImpl(
        gh<_i168.GetProjectsByCategoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i48.GetWeatherRepo>(
      () => _i686.GetWeatherRepoImpl(gh<_i329.GetWeatherRemoteDataSource>()),
    );
    gh.factory<_i804.GetAllProjectsRemoteDataSource>(
      () =>
          _i113.GetAllProjectsRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i432.AuthRemoteDataSource>(
      () => _i420.AuthRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i455.AppLinksRemoteDataSource>(
      () => _i635.AppLinksRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i327.GetWeatherUseCase>(
      () => _i327.GetWeatherUseCase(gh<_i48.GetWeatherRepo>()),
    );
    gh.factory<_i180.AddProjectUseCase>(
      () => _i180.AddProjectUseCase(gh<_i45.AddProjectRepository>()),
    );
    gh.factory<_i786.CategoryRemoteDataSource>(
      () => _i924.CategoryRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i107.DeleteJobRemoteDataSource>(
      () => _i370.DeleteJobRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i425.AddJobRemoteDataSource>(
      () => _i598.AddJobRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i194.AuthRepository>(
      () => _i704.AuthRepoImpl(gh<_i432.AuthRemoteDataSource>()),
    );
    gh.factory<_i1000.GetProjectsByDisplaySectionUseCase>(
      () => _i1000.GetProjectsByDisplaySectionUseCase(
        gh<_i741.GetProjectsByDisplaySectionRepository>(),
      ),
    );
    gh.factory<_i1046.BannersRemoteDataSource>(
      () => _i576.BannersRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i46.GetWeatherViewModel>(
      () => _i46.GetWeatherViewModel(gh<_i327.GetWeatherUseCase>()),
    );
    gh.factory<_i847.GetAllJobsRemoteDataSource>(
      () => _i969.GetAllJobsRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i104.GetJobByIdRemoteDataSource>(
      () => _i12.GetJobByIdRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i585.AddOpportunityRemoteDataSource>(
      () =>
          _i939.AddOpportunityRemoteDataSourceImpl(gh<_i758.FirebaseService>()),
    );
    gh.factory<_i157.GetNewestProjectsRemoteDataSource>(
      () => _i64.GetNewestProjectsRemoteDataSourceImpl(
        gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i118.PrayerTimesRepository>(
      () => _i444.PrayerTimesRepositoryImpl(
        gh<_i564.PrayerTimesRemoteDataSource>(),
      ),
    );
    gh.factory<_i563.GetAllOpportunitiesRemoteDataSource>(
      () => _i501.GetAllOpportunitiesRemoteDataSourceImpl(
        gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i108.GetJobByIdRepo>(
      () => _i93.GetJobByIdRepoImpl(gh<_i104.GetJobByIdRemoteDataSource>()),
    );
    gh.factory<_i308.PrayerTimesUseCase>(
      () => _i308.PrayerTimesUseCase(
        prayerTimesRepository: gh<_i118.PrayerTimesRepository>(),
      ),
    );
    gh.factory<_i1028.AuthUseCase>(
      () => _i1028.AuthUseCase(gh<_i194.AuthRepository>()),
    );
    gh.factory<_i329.DeleteProjectUseCase>(
      () => _i329.DeleteProjectUseCase(gh<_i822.DeleteProjectRepository>()),
    );
    gh.factory<_i79.ProjectDisplaySectionsRemoteDataSource>(
      () => _i1032.ProjectDisplaySectionsRemoteDataSourceImpl(
        firebaseService: gh<_i758.FirebaseService>(),
      ),
    );
    gh.factory<_i130.DalelAlShamPlaceRepo>(
      () => _i190.DalelAlShamPlaceRepoImpl(
        dalelAlShamPlaceRemoteDataSource:
            gh<_i636.DalelAlShamPlaceRemoteDataSource>(),
      ),
    );
    gh.factory<_i572.BannersRepository>(
      () => _i203.BannersReposImpl(gh<_i1046.BannersRemoteDataSource>()),
    );
    gh.factory<_i495.AddOpportunityRepo>(
      () => _i658.AddOpportunityRepoImpl(
        gh<_i585.AddOpportunityRemoteDataSource>(),
      ),
    );
    gh.factory<_i272.GetAllOpportunitiesRepo>(
      () => _i134.GetAllOpportunitiesRepoImpl(
        gh<_i563.GetAllOpportunitiesRemoteDataSource>(),
      ),
    );
    gh.factory<_i943.DeleteProjectViewModel>(
      () => _i943.DeleteProjectViewModel(gh<_i329.DeleteProjectUseCase>()),
    );
    gh.factory<_i925.GetAllProjectsRepository>(
      () => _i528.GetAllProjectsRepositoryImpl(
        gh<_i804.GetAllProjectsRemoteDataSource>(),
      ),
    );
    gh.factory<_i184.GetProjectDetailsRepository>(
      () => _i80.GetProjectDetailsRepositoryImpl(
        gh<_i131.GetProjectDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i532.GetUsdToSypRepo>(
      () => _i859.GetUsdToSypRepoImpl(gh<_i679.GetUsdToSypRemoteDataSource>()),
    );
    gh.factory<_i943.UpdateProjectRepository>(
      () => _i1018.UpdateProjectRepositoryImpl(
        gh<_i440.UpdateProjectRemoteDataSource>(),
      ),
    );
    gh.factory<_i369.BannerUseCase>(
      () => _i369.BannerUseCase(gh<_i572.BannersRepository>()),
    );
    gh.factory<_i61.AddNewServiceViewModel>(
      () => _i61.AddNewServiceViewModel(gh<_i180.AddProjectUseCase>()),
    );
    gh.factory<_i654.GetProjectsByCategoryUseCase>(
      () => _i654.GetProjectsByCategoryUseCase(
        gh<_i250.GetProjectsByCategoryRepository>(),
      ),
    );
    gh.factory<_i978.AppLinksRepo>(
      () => _i21.AppLinksRepoImpl(gh<_i455.AppLinksRemoteDataSource>()),
    );
    gh.factory<_i903.GetAllJobsRepo>(
      () => _i394.GetAllJobsRepoImpl(gh<_i847.GetAllJobsRemoteDataSource>()),
    );
    gh.factory<_i1066.CategoryRepos>(
      () => _i672.CategoryReposImpl(gh<_i786.CategoryRemoteDataSource>()),
    );
    gh.factory<_i508.GetAllProjectsUseCase>(
      () => _i508.GetAllProjectsUseCase(gh<_i925.GetAllProjectsRepository>()),
    );
    gh.factory<_i382.GetProjectsByDisplaySectionViewModel>(
      () => _i382.GetProjectsByDisplaySectionViewModel(
        gh<_i1000.GetProjectsByDisplaySectionUseCase>(),
      ),
    );
    gh.factory<_i686.DeleteJobRepo>(
      () => _i664.DeleteJobRepoImpl(gh<_i107.DeleteJobRemoteDataSource>()),
    );
    gh.factory<_i340.DalelAlShamPlaceUseCase>(
      () => _i340.DalelAlShamPlaceUseCase(
        dalelAlShamPlaceRepo: gh<_i130.DalelAlShamPlaceRepo>(),
      ),
    );
    gh.factory<_i772.GetAllJobsUsecase>(
      () => _i772.GetAllJobsUsecase(gh<_i903.GetAllJobsRepo>()),
    );
    gh.factory<_i569.AddJobRepo>(
      () => _i971.AddJobRepoImpl(gh<_i425.AddJobRemoteDataSource>()),
    );
    gh.factory<_i62.GetUsdToSypUseCase>(
      () => _i62.GetUsdToSypUseCase(gh<_i532.GetUsdToSypRepo>()),
    );
    gh.factory<_i409.PrayerTimesViewModel>(
      () => _i409.PrayerTimesViewModel(gh<_i308.PrayerTimesUseCase>()),
    );
    gh.factory<_i696.GetProjectsByCategoryViewModel>(
      () => _i696.GetProjectsByCategoryViewModel(
        gh<_i654.GetProjectsByCategoryUseCase>(),
      ),
    );
    gh.factory<_i966.GetProjectDetailsUsecase>(
      () => _i966.GetProjectDetailsUsecase(
        gh<_i184.GetProjectDetailsRepository>(),
      ),
    );
    gh.factory<_i111.DeleteJobUsecase>(
      () => _i111.DeleteJobUsecase(gh<_i686.DeleteJobRepo>()),
    );
    gh.factory<_i977.GetNewestProjectsRepository>(
      () => _i766.GetNewestProjectsRepositoryImpl(
        gh<_i157.GetNewestProjectsRemoteDataSource>(),
      ),
    );
    gh.factory<_i117.GetJobByIdUsecase>(
      () => _i117.GetJobByIdUsecase(gh<_i108.GetJobByIdRepo>()),
    );
    gh.factory<_i645.UpdateProjectUseCase>(
      () => _i645.UpdateProjectUseCase(gh<_i943.UpdateProjectRepository>()),
    );
    gh.factory<_i439.UpdateProjectViewModel>(
      () => _i439.UpdateProjectViewModel(gh<_i645.UpdateProjectUseCase>()),
    );
    gh.factory<_i377.ProjectDisplaySectionsRepository>(
      () => _i968.ProjectDisplaySectionsRepositoryImpl(
        gh<_i79.ProjectDisplaySectionsRemoteDataSource>(),
      ),
    );
    gh.factory<_i76.GetBannersByPositionViewModel>(
      () => _i76.GetBannersByPositionViewModel(
        bannerUseCase: gh<_i369.BannerUseCase>(),
      ),
    );
    gh.factory<_i710.DeleteAccountViewModel>(
      () => _i710.DeleteAccountViewModel(gh<_i1028.AuthUseCase>()),
    );
    gh.factory<_i573.LoginViewModel>(
      () => _i573.LoginViewModel(gh<_i1028.AuthUseCase>()),
    );
    gh.factory<_i19.RegisterViewModel>(
      () => _i19.RegisterViewModel(gh<_i1028.AuthUseCase>()),
    );
    gh.factory<_i216.GetAllPlacesByCategoryViewModel>(
      () => _i216.GetAllPlacesByCategoryViewModel(
        gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i29.GetAllJobsViewModel>(
      () => _i29.GetAllJobsViewModel(gh<_i772.GetAllJobsUsecase>()),
    );
    gh.factory<_i365.GetAllOpportunitiesUsecase>(
      () =>
          _i365.GetAllOpportunitiesUsecase(gh<_i272.GetAllOpportunitiesRepo>()),
    );
    gh.factory<_i203.AddOpportunityUsecase>(
      () => _i203.AddOpportunityUsecase(gh<_i495.AddOpportunityRepo>()),
    );
    gh.factory<_i1032.UpdateProjectViewsViewModel>(
      () => _i1032.UpdateProjectViewsViewModel(
        updateProjectRepository: gh<_i943.UpdateProjectRepository>(),
      ),
    );
    gh.factory<_i963.AddPlaceViewModel>(
      () => _i963.AddPlaceViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i313.DeletePlaceViewModel>(
      () => _i313.DeletePlaceViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i729.GetAllPlaceCategoriesViewModel>(
      () => _i729.GetAllPlaceCategoriesViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i544.GetAllPlaceViewModel>(
      () => _i544.GetAllPlaceViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i1059.GetSectionStatusViewModel>(
      () => _i1059.GetSectionStatusViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i660.UpdatePlaceViewModel>(
      () => _i660.UpdatePlaceViewModel(
        dalelAlShamPlaceUseCase: gh<_i340.DalelAlShamPlaceUseCase>(),
      ),
    );
    gh.factory<_i1018.AppLinksUseCase>(
      () => _i1018.AppLinksUseCase(gh<_i978.AppLinksRepo>()),
    );
    gh.factory<_i1036.AddOpportunityViewModel>(
      () => _i1036.AddOpportunityViewModel(gh<_i203.AddOpportunityUsecase>()),
    );
    gh.factory<_i730.GetAllAppLinksViewModel>(
      () => _i730.GetAllAppLinksViewModel(gh<_i1018.AppLinksUseCase>()),
    );
    gh.factory<_i616.GetProjectDetailsViewModel>(
      () => _i616.GetProjectDetailsViewModel(
        gh<_i966.GetProjectDetailsUsecase>(),
      ),
    );
    gh.factory<_i907.GetAllProjectsViewModel>(
      () => _i907.GetAllProjectsViewModel(gh<_i508.GetAllProjectsUseCase>()),
    );
    gh.factory<_i886.CategoryUseCase>(
      () => _i886.CategoryUseCase(gh<_i1066.CategoryRepos>()),
    );
    gh.factory<_i297.ProjectDisplaySectionsUseCase>(
      () => _i297.ProjectDisplaySectionsUseCase(
        projectDisplaySectionsRepository:
            gh<_i377.ProjectDisplaySectionsRepository>(),
      ),
    );
    gh.factory<_i1047.AddJobUsecase>(
      () => _i1047.AddJobUsecase(gh<_i569.AddJobRepo>()),
    );
    gh.factory<_i345.GetUsdToSypViewModel>(
      () => _i345.GetUsdToSypViewModel(gh<_i62.GetUsdToSypUseCase>()),
    );
    gh.factory<_i667.GetNewestProjectsUseCase>(
      () => _i667.GetNewestProjectsUseCase(
        gh<_i977.GetNewestProjectsRepository>(),
      ),
    );
    gh.factory<_i745.DeleteProjectDisplaySectionViewModel>(
      () => _i745.DeleteProjectDisplaySectionViewModel(
        deleteProjectDisplaySectionUseCase:
            gh<_i297.ProjectDisplaySectionsUseCase>(),
      ),
    );
    gh.factory<_i151.UpdateProjectDisplaySectionViewModel>(
      () => _i151.UpdateProjectDisplaySectionViewModel(
        updateProjectDisplaySectionUseCase:
            gh<_i297.ProjectDisplaySectionsUseCase>(),
      ),
    );
    gh.factory<_i640.AddJobViewModel>(
      () => _i640.AddJobViewModel(gh<_i1047.AddJobUsecase>()),
    );
    gh.factory<_i11.AddProjectDisplaySectionViewModel>(
      () => _i11.AddProjectDisplaySectionViewModel(
        addProjectDisplaySectionUseCase:
            gh<_i297.ProjectDisplaySectionsUseCase>(),
      ),
    );
    gh.factory<_i623.GetAllCategoriesViewModel>(
      () => _i623.GetAllCategoriesViewModel(gh<_i886.CategoryUseCase>()),
    );
    gh.factory<_i1068.GetAllOpportunitiesViewModel>(
      () => _i1068.GetAllOpportunitiesViewModel(
        gh<_i365.GetAllOpportunitiesUsecase>(),
      ),
    );
    gh.factory<_i529.AddOrUpdateLinkViewModel>(
      () => _i529.AddOrUpdateLinkViewModel(gh<_i1018.AppLinksUseCase>()),
    );
    gh.factory<_i856.GetNewestProjectsViewModel>(
      () => _i856.GetNewestProjectsViewModel(
        gh<_i667.GetNewestProjectsUseCase>(),
      ),
    );
    gh.factory<_i593.GetAllProjectDisplaySectionsViewModel>(
      () => _i593.GetAllProjectDisplaySectionsViewModel(
        getAllProjectDisplaySectionsUseCase:
            gh<_i297.ProjectDisplaySectionsUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}
