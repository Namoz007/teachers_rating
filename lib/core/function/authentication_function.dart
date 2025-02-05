import 'package:teachers/core/core.dart';

user_role getRoleWithRoleName(String roleName){
  if(roleName == 'teacher') return user_role.teacher;
  return user_role.student;
}