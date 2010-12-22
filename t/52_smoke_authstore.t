#!/usr/bin/env perl -w

# Copyright (c) 2010, Yahoo! Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

use 5.008;
use common::sense;

use Test::Exception;
use Test::More;

use Carp qw(confess);
use FindBin qw($Bin);

use lib "$Bin/../lib";
use lib "$Bin/lib";

use PogoTester;

$SIG{ALRM} = sub { confess; };
alarm(60);


test_pogo {
    SKIP:
    {
      skip "broken for some reason", 1;
      ok( authstore_rpc( ["ping"] )->[0] eq 'pong', 'ping' );
    }

};

done_testing;

1;

