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
--   Date and Time:   13:45 Tuesday May 4, 2021
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
,p_files_version=>5
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
wwv_flow_api.g_varchar2_table(1) := '636F6E7374206365704175746F46696C6C203D2066756E6374696F6E2829207B0D0A202066756E6374696F6E206765742829207B0D0A202020206C6574206974656D73203D20207B7D0D0A202020206974656D434550203D20746869732E616374696F6E';
wwv_flow_api.g_varchar2_table(2) := '2E61747472696275746530313B0D0A2020202069662028746869732E616374696F6E2E617474726962757465303229206974656D732E6C6F677261646F75726F203D20746869732E616374696F6E2E61747472696275746530323B0D0A20202020696620';
wwv_flow_api.g_varchar2_table(3) := '28746869732E616374696F6E2E617474726962757465303329206974656D732E636F6D706C656D656E746F203D20746869732E616374696F6E2E61747472696275746530333B0D0A2020202069662028746869732E616374696F6E2E6174747269627574';
wwv_flow_api.g_varchar2_table(4) := '65303429206974656D732E62616972726F203D20746869732E616374696F6E2E61747472696275746530343B0D0A2020202069662028746869732E616374696F6E2E617474726962757465303529206974656D732E6C6F63616C6964616465203D207468';
wwv_flow_api.g_varchar2_table(5) := '69732E616374696F6E2E61747472696275746530353B0D0A2020202069662028746869732E616374696F6E2E617474726962757465303629206974656D732E7566203D20746869732E616374696F6E2E61747472696275746530363B0D0A202020206C65';
wwv_flow_api.g_varchar2_table(6) := '7420636570203D20617065782E6974656D286974656D434550292E67657456616C756528292E7265706C616365282F5C442F672C202727293B0D0A202020207661722076616C696461636570203D202F5E5B302D395D7B387D242F3B0D0A202020206966';
wwv_flow_api.g_varchar2_table(7) := '20282163657029207B0D0A2020202020206572726F7228224F2063616D706F20434550207072656369736120657374617220707265656E636869646F2E222C206974656D434550293B0D0A20202020202066696C6C286974656D732C202222293B0D0A20';
wwv_flow_api.g_varchar2_table(8) := '202020202072657475726E0D0A202020207D0D0A20202020696620282176616C6964616365702E74657374286365702929207B0D0A2020202020206572726F72282243455020696E76C3A16C69646F2C20766572696669717565206F2043455020652074';
wwv_flow_api.g_varchar2_table(9) := '656E7465206E6F76616D656E74652E222C206974656D434550293B0D0A20202020202066696C6C286974656D732C202222293B0D0A20202020202072657475726E0D0A202020207D0D0A20202020617065782E6D6573736167652E636C6561724572726F';
wwv_flow_api.g_varchar2_table(10) := '727328293B0D0A20202020242E6765744A534F4E286068747470733A2F2F7669616365702E636F6D2E62722F77732F247B6365707D2F6A736F6E60290D0A202020202E7468656E2866756E6374696F6E2864617461297B0D0A202020202020636F6E736F';
wwv_flow_api.g_varchar2_table(11) := '6C652E6C6F672864617461293B0D0A20202020202069662028646174612E6572726F29207B0D0A20202020202020206572726F72282243455020696E76C3A16C69646F2C20766572696669717565206F2043455020652074656E7465206E6F76616D656E';
wwv_flow_api.g_varchar2_table(12) := '74652E222C206974656D434550293B0D0A202020202020202064617461203D2022223B0D0A2020202020207D0D0A20202020202066696C6C286974656D732C2064617461293B0D0A202020207D293B0D0A20207D0D0A0D0A202066756E6374696F6E2066';
wwv_flow_api.g_varchar2_table(13) := '696C6C286974656D732C206461746129207B0D0A20202020666F7220286C6574206974656D20696E206974656D7329207B0D0A2020202020206C65742066696C6C56616C7565203D2064617461203F20646174615B6974656D5D203A2022223B0D0A2020';
wwv_flow_api.g_varchar2_table(14) := '20202020617065782E6974656D286974656D735B6974656D5D292E73657456616C75652866696C6C56616C7565293B0D0A202020207D0D0A20207D0D0A0D0A20202F2F6561736965722068616E646C6520666F7220617065782070616765206572726F72';
wwv_flow_api.g_varchar2_table(15) := '0D0A202066756E6374696F6E206572726F72286D657373616765732C706167654974656D29207B0D0A20202020617065782E6D6573736167652E636C6561724572726F727328293B0D0A20202020617065782E6D6573736167652E73686F774572726F72';
wwv_flow_api.g_varchar2_table(16) := '73287B0D0A202020202020747970653A2020202020226572726F72222C0D0A2020202020206C6F636174696F6E3A205B2270616765222C2022696E6C696E65225D2C0D0A202020202020706167654974656D3A20706167654974656D2C0D0A2020202020';
wwv_flow_api.g_varchar2_table(17) := '206D6573736167653A20206D657373616765730D0A202020207D293B0D0A20207D0D0A202072657475726E207B0D0A202020206765740D0A20207D0D0A7D28293B0D0A2F2F2320736F757263654D617070696E6755524C3D6365702E6A732E6D61700D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(200100862590354539)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_file_name=>'js/cep.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C226E616D6573223A5B5D2C226D617070696E6773223A22222C22736F7572636573223A5B226365702E6A73225D2C22736F7572636573436F6E74656E74223A5B22636F6E7374206365704175746F46696C6C203D206675';
wwv_flow_api.g_varchar2_table(2) := '6E6374696F6E2829207B5C725C6E202066756E6374696F6E206765742829207B5C725C6E202020206C6574206974656D73203D20207B7D5C725C6E202020206974656D434550203D20746869732E616374696F6E2E61747472696275746530313B5C725C';
wwv_flow_api.g_varchar2_table(3) := '6E2020202069662028746869732E616374696F6E2E617474726962757465303229206974656D732E6C6F677261646F75726F203D20746869732E616374696F6E2E61747472696275746530323B5C725C6E2020202069662028746869732E616374696F6E';
wwv_flow_api.g_varchar2_table(4) := '2E617474726962757465303329206974656D732E636F6D706C656D656E746F203D20746869732E616374696F6E2E61747472696275746530333B5C725C6E2020202069662028746869732E616374696F6E2E617474726962757465303429206974656D73';
wwv_flow_api.g_varchar2_table(5) := '2E62616972726F203D20746869732E616374696F6E2E61747472696275746530343B5C725C6E2020202069662028746869732E616374696F6E2E617474726962757465303529206974656D732E6C6F63616C6964616465203D20746869732E616374696F';
wwv_flow_api.g_varchar2_table(6) := '6E2E61747472696275746530353B5C725C6E2020202069662028746869732E616374696F6E2E617474726962757465303629206974656D732E7566203D20746869732E616374696F6E2E61747472696275746530363B5C725C6E202020206C6574206365';
wwv_flow_api.g_varchar2_table(7) := '70203D20617065782E6974656D286974656D434550292E67657456616C756528292E7265706C616365282F5C5C442F672C202727293B5C725C6E202020207661722076616C696461636570203D202F5E5B302D395D7B387D242F3B5C725C6E2020202069';
wwv_flow_api.g_varchar2_table(8) := '6620282163657029207B5C725C6E2020202020206572726F72285C224F2063616D706F20434550207072656369736120657374617220707265656E636869646F2E5C222C206974656D434550293B5C725C6E20202020202066696C6C286974656D732C20';
wwv_flow_api.g_varchar2_table(9) := '5C225C22293B5C725C6E20202020202072657475726E5C725C6E202020207D5C725C6E20202020696620282176616C6964616365702E74657374286365702929207B5C725C6E2020202020206572726F72285C2243455020696E76C3A16C69646F2C2076';
wwv_flow_api.g_varchar2_table(10) := '6572696669717565206F2043455020652074656E7465206E6F76616D656E74652E5C222C206974656D434550293B5C725C6E20202020202066696C6C286974656D732C205C225C22293B5C725C6E20202020202072657475726E5C725C6E202020207D5C';
wwv_flow_api.g_varchar2_table(11) := '725C6E20202020617065782E6D6573736167652E636C6561724572726F727328293B5C725C6E20202020242E6765744A534F4E286068747470733A2F2F7669616365702E636F6D2E62722F77732F247B6365707D2F6A736F6E60295C725C6E202020202E';
wwv_flow_api.g_varchar2_table(12) := '7468656E2866756E6374696F6E2864617461297B5C725C6E202020202020636F6E736F6C652E6C6F672864617461293B5C725C6E20202020202069662028646174612E6572726F29207B5C725C6E20202020202020206572726F72285C2243455020696E';
wwv_flow_api.g_varchar2_table(13) := '76C3A16C69646F2C20766572696669717565206F2043455020652074656E7465206E6F76616D656E74652E5C222C206974656D434550293B5C725C6E202020202020202064617461203D205C225C223B5C725C6E2020202020207D5C725C6E2020202020';
wwv_flow_api.g_varchar2_table(14) := '2066696C6C286974656D732C2064617461293B5C725C6E202020207D293B5C725C6E20207D5C725C6E5C725C6E202066756E6374696F6E2066696C6C286974656D732C206461746129207B5C725C6E20202020666F7220286C6574206974656D20696E20';
wwv_flow_api.g_varchar2_table(15) := '6974656D7329207B5C725C6E2020202020206C65742066696C6C56616C7565203D2064617461203F20646174615B6974656D5D203A205C225C223B5C725C6E202020202020617065782E6974656D286974656D735B6974656D5D292E73657456616C7565';
wwv_flow_api.g_varchar2_table(16) := '2866696C6C56616C7565293B5C725C6E202020207D5C725C6E20207D5C725C6E5C725C6E20202F2F6561736965722068616E646C6520666F7220617065782070616765206572726F725C725C6E202066756E6374696F6E206572726F72286D6573736167';
wwv_flow_api.g_varchar2_table(17) := '65732C706167654974656D29207B5C725C6E20202020617065782E6D6573736167652E636C6561724572726F727328293B5C725C6E20202020617065782E6D6573736167652E73686F774572726F7273287B5C725C6E202020202020747970653A202020';
wwv_flow_api.g_varchar2_table(18) := '20205C226572726F725C222C5C725C6E2020202020206C6F636174696F6E3A205B5C22706167655C222C205C22696E6C696E655C225D2C5C725C6E202020202020706167654974656D3A20706167654974656D2C5C725C6E2020202020206D6573736167';
wwv_flow_api.g_varchar2_table(19) := '653A20206D657373616765735C725C6E202020207D293B5C725C6E20207D5C725C6E202072657475726E207B5C725C6E202020206765745C725C6E20207D5C725C6E7D28293B225D2C2266696C65223A226365702E6A73227D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(200501297865496546)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_file_name=>'js/cep.js.map'
,p_mime_type=>'text/plain'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '636F6E7374206365704175746F46696C6C3D66756E6374696F6E28297B66756E6374696F6E207428742C65297B666F72286C6574206920696E2074297B6C6574206F3D653F655B695D3A22223B617065782E6974656D28745B695D292E73657456616C75';
wwv_flow_api.g_varchar2_table(2) := '65286F297D7D66756E6374696F6E206528742C65297B617065782E6D6573736167652E636C6561724572726F727328292C617065782E6D6573736167652E73686F774572726F7273287B747970653A226572726F72222C6C6F636174696F6E3A5B227061';
wwv_flow_api.g_varchar2_table(3) := '6765222C22696E6C696E65225D2C706167654974656D3A652C6D6573736167653A747D297D72657475726E7B6765743A66756E6374696F6E28297B6C657420693D7B7D3B6974656D4345503D746869732E616374696F6E2E61747472696275746530312C';
wwv_flow_api.g_varchar2_table(4) := '746869732E616374696F6E2E6174747269627574653032262628692E6C6F677261646F75726F3D746869732E616374696F6E2E6174747269627574653032292C746869732E616374696F6E2E6174747269627574653033262628692E636F6D706C656D65';
wwv_flow_api.g_varchar2_table(5) := '6E746F3D746869732E616374696F6E2E6174747269627574653033292C746869732E616374696F6E2E6174747269627574653034262628692E62616972726F3D746869732E616374696F6E2E6174747269627574653034292C746869732E616374696F6E';
wwv_flow_api.g_varchar2_table(6) := '2E6174747269627574653035262628692E6C6F63616C69646164653D746869732E616374696F6E2E6174747269627574653035292C746869732E616374696F6E2E6174747269627574653036262628692E75663D746869732E616374696F6E2E61747472';
wwv_flow_api.g_varchar2_table(7) := '69627574653036293B6C6574206F3D617065782E6974656D286974656D434550292E67657456616C756528292E7265706C616365282F5C442F672C2222293B72657475726E206F3F2F5E5B302D395D7B387D242F2E74657374286F293F28617065782E6D';
wwv_flow_api.g_varchar2_table(8) := '6573736167652E636C6561724572726F727328292C766F696420242E6765744A534F4E286068747470733A2F2F7669616365702E636F6D2E62722F77732F247B6F7D2F6A736F6E60292E7468656E2866756E6374696F6E286F297B636F6E736F6C652E6C';
wwv_flow_api.g_varchar2_table(9) := '6F67286F292C6F2E6572726F26262865282243455020696E76C3A16C69646F2C20766572696669717565206F2043455020652074656E7465206E6F76616D656E74652E222C6974656D434550292C6F3D2222292C7428692C6F297D29293A286528224345';
wwv_flow_api.g_varchar2_table(10) := '5020696E76C3A16C69646F2C20766572696669717565206F2043455020652074656E7465206E6F76616D656E74652E222C6974656D434550292C766F6964207428692C222229293A286528224F2063616D706F2043455020707265636973612065737461';
wwv_flow_api.g_varchar2_table(11) := '7220707265656E636869646F2E222C6974656D434550292C766F6964207428692C222229297D7D7D28293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(200501698419496548)
,p_plugin_id=>wwv_flow_api.id(199900211060323535)
,p_file_name=>'js/cep.min.js'
,p_mime_type=>'text/javascript'
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
