use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'SayTwiML',
    VERSION_FROM  => 'lib/SayTwiML.pm',
    PREREQ_PM     => {
        'Kossy' =>  '0.40',
    },
    MIN_PERL_VERSION => '5.008001'
);

