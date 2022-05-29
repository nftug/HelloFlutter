class PasswordRepository {
  final _siteList = ['Amazon', '楽天', 'Yahoo!'];
  final _userIdList = ['test', 'test2', 'test3'];
  final _passwordList = ['hogehoge', 'fugafuga', 'piyopiyo'];

  String getSiteName(id) => _siteList[id];
  String getUserId(id) => _userIdList[id];
  String getPassword(id) => _passwordList[id];
  int get length => _siteList.length;

  PasswordRepository();

  void add(String siteName, String userId, String password) {
    _siteList.add(siteName);
    _userIdList.add(userId);
    _passwordList.add(password);
  }
}
