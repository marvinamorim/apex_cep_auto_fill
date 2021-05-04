prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>29300347010897583
,p_default_application_id=>999998
,p_default_id_offset=>0
,p_default_owner=>'DEV'
);
end;
/
 
prompt APPLICATION 999998 - Plugin Dev
--
-- Application Export:
--   Application:     999998
--   Name:            Plugin Dev
--   Date and Time:   11:19 Tuesday May 4, 2021
--   Exported By:     MARVIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 199900211060323535
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     800139656204023
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/mvx_cep_auto_fill
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(199900211060323535)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MVX.CEP.AUTO.FILL'
,p_display_name=>'CEP Auto Fill'
,p_category=>'MISC'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/cep.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION f_render(',
'  p_dynamic_action IN apex_plugin.t_dynamic_action,',
'  p_plugin         IN apex_plugin.t_plugin',
') RETURN apex_plugin.t_dynamic_action_render_result IS',
'  --',
'  -- plugin attributes',
'  v_result  apex_plugin.t_dynamic_action_render_result;',
'BEGIN',
'  v_result.javascript_function := ''cepAutoFill.get'';',
'  v_result.attribute_01        := p_dynamic_action.attribute_01;',
'  v_result.attribute_02        := p_dynamic_action.attribute_02;',
'  v_result.attribute_03        := p_dynamic_action.attribute_03;',
'  v_result.attribute_04        := p_dynamic_action.attribute_04;',
'  v_result.attribute_05        := p_dynamic_action.attribute_05;',
'  v_result.attribute_06        := p_dynamic_action.attribute_06;',
'  RETURN v_result;',
'END f_render;'))
,p_api_version=>2
,p_render_function=>'f_render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/marvinamorim/apex_cep_auto_fill'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199900458033328178)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'CEP Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199900716460329487)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Rua Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199901096903330417)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Complemento Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199901369024331453)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Bairro Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199901618435332792)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Cidade Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(199901958262333635)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'UF Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(200100862590354539)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_file_name=>'js/cep.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
