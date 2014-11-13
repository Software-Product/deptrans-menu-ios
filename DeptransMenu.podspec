Pod::Spec.new do |s|
	s.name	= 'DeptransMenu'
	s.version	= '1.1'
	s.license	= { :type => 'GNU GENERAL PUBLIC LICENSE' }
	s.homepage	= 'https://github.com/Software-Product/deptrans-menu-ios'
	s.social_media_url	= 'http://www.pproduct.ru/ru/'
	s.summary = 'A delightful iOS framework for deptrans menu integration'
	s.authors	= { 'Denis Gryzlov' 	=> 'gryzlov@ppr.ru',
                 'Ezistas Batururimi'	=> 'batururimi@ppr.ru',
                 'Artyom Karhanyan' 	=> 'akarhanyan@ppr.ru'}
	s.source	= { :git => 'https://github.com/Software-Product/deptrans-menu-ios.git', :tag => 'v1.1'}           

	s.platform = :ios, '7.1'
	s.requires_arc = true

	s.public_header_files = 'Library/*.h'
	s.source_files = 'Library/DeptransMenu.h'
	s.resource_bundles = {
    'DeptransMenu' => ['Library/DeptransMenuResources.bundle']
    }
end