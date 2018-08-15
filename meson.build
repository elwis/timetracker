#name & lanaguage
project('com.github.elwis.timetracker', 'vala', 'c')

#Translation module
i18n = import('i18n')

#Translation domain
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language:'c')
#create executable with files we need to compile and dependencies
executable(
	meson.project_name(),
	'src/Application.vala',
    'src/Main.vala',
    'src/Widgets/Window.vala',
    'src/Widgets/Headerbar.vala',
    'src/Widgets/FavoriteButton.vala',
	dependencies: [
		dependency('gtk+-3.0'),
        dependency('granite')
	],
	install: true
)

#translate and install desktop file
i18n.merge_file(
    input: join_paths('data', meson.project_name() + '.desktop.in'),
    output: meson.project_name() + '.desktop',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#translate install .appdata 
i18n.merge_file(
    input: join_paths('data', meson.project_name() + '.appdata.xml.in'),
    output: meson.project_name() + '.appdata.xml',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)
subdir('po')

