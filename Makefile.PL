use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'WHN',
    VERSION_FROM  => 'lib/WHN.pm',
    PREREQ_PM     => {
        'Kossy' =>  '0.40',
    },
    MIN_PERL_VERSION => '5.008001'
);

