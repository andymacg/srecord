#!/bin/sh
#
# srecord - Manipulate EPROM load files
# Copyright (C) 2014 Scott Finneran
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

TEST_SUBJECT="file ordering agnosticism"
. test_prelude

cat > test1.in << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S12300004153434949283729202020202020202020202020202020202020202020202020EB
S12300202020202020202020202020202020202020202020202020202020202020202020BC
S123004020202020202020204C696E75782050726F6772616D6D65722773204D616E7561A4
S12300606C2020202020202020202020202020202020202020202020202020202020202030
S123008020202020202020202020202020202020202020202020202020202020202020205C
S12300A02041534349492837290A0A0A0A4E414D450A202020202020206173636969202DA2
S12300C0204153434949206368617261637465722073657420656E636F64656420696E2051
S12300E06F6374616C2C20646563696D616C2C20616E642068657861646563696D616C0AB0
S5030008F4
fubar
if test $? -ne 0; then no_result; fi

cat > test2.in << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S12301044352495054494F4E0A2020202020202041534349492069732074686520416D658C
S1230124726963616E205374616E6461726420436F646520666F7220496E666F726D6174F7
S1230144696F6E20496E7465726368616E67652E20204974206973206120372D626974203E
S1230164636F64652E20204D616E7920382D62697420636F646573202873756368206173F8
S12301842049534F20383835392D312C20746865204C696E75782064656661756C742063AB
S12301A46861726163746572207365742920636F6EE280900A202020202020207461696E70
S12301C4204153434949206173207468656972206C6F7765722068616C662E2020546865CB
S11F01E420696E7465726E6174696F6E616C20636F756E74657270617274206FFD
S5030008F4
fubar
if test $? -ne 0; then no_result; fi

cat > test3.in << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S123020066204153434949206973206B6E6F776E2061732049534F203634362E0A0A202061
S1230220202020202054686520666F6C6C6F77696E67207461626C6520636F6E7461696ED4
S123024073207468652031323820415343494920636861726163746572732E0A0A202020A0
S123026020202020432070726F6772616D20275C5827206573636170657320617265206E93
S12302806F7465642E0A0A202020202020204F637420202044656320202048657820202015
S12302A0436861722020202020202020202020202020202020202020202020204F63742076
S12302C02020446563202020486578202020436861720A20202020202020E29480E2948095
S12302E0E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E294E8
S5030008F4
fubar
if test $? -ne 0; then no_result; fi

cat > test4.in << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S123030080E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E2DB
S12303209480E29480E29480E29480E29480E29480E29480E29480E29480E29480E2948009
S1230340E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E29487
S123036080E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E27B
S12303809480E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480A9
S12303A0E29480E29480E29480E29480E29480E294800A202020202020203030302020209B
S12303C03020202020203030202020204E554C20275C302720202020202020202020202000
S12303E02020202020202020313030202020363420202020343020202020400A2020202070
S5030008F4
fubar
if test $? -ne 0; then no_result; fi

cat > test.ok << 'fubar'
S0220000687474703A2F2F737265636F72642E736F75726365666F7267652E6E65742F1D
S12300004153434949283729202020202020202020202020202020202020202020202020EB
S12300202020202020202020202020202020202020202020202020202020202020202020BC
S123004020202020202020204C696E75782050726F6772616D6D65722773204D616E7561A4
S12300606C2020202020202020202020202020202020202020202020202020202020202030
S123008020202020202020202020202020202020202020202020202020202020202020205C
S12300A02041534349492837290A0A0A0A4E414D450A202020202020206173636969202DA2
S12300C0204153434949206368617261637465722073657420656E636F64656420696E2051
S12300E06F6374616C2C20646563696D616C2C20616E642068657861646563696D616C0AB0
S1230100010203044352495054494F4E0A20202020202020415343494920697320746865B9
S123012020416D65726963616E205374616E6461726420436F646520666F7220496E666F7C
S1230140726D6174696F6E20496E7465726368616E67652E20204974206973206120372DED
S123016062697420636F64652E20204D616E7920382D62697420636F6465732028737563F9
S1230180682061732049534F20383835392D312C20746865204C696E7578206465666175B6
S12301A06C7420636861726163746572207365742920636F6EE280900A20202020202020BD
S12301C07461696E204153434949206173207468656972206C6F7765722068616C662E2064
S12301E02054686520696E7465726E6174696F6E616C20636F756E74657270617274206FBC
S123020066204153434949206973206B6E6F776E2061732049534F203634362E0A0A202061
S1230220202020202054686520666F6C6C6F77696E67207461626C6520636F6E7461696ED4
S123024073207468652031323820415343494920636861726163746572732E0A0A202020A0
S123026020202020432070726F6772616D20275C5827206573636170657320617265206E93
S12302806F7465642E0A0A202020202020204F637420202044656320202048657820202015
S12302A0436861722020202020202020202020202020202020202020202020204F63742076
S12302C02020446563202020486578202020436861720A20202020202020E29480E2948095
S12302E0E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E294E8
S123030080E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E2DB
S12303209480E29480E29480E29480E29480E29480E29480E29480E29480E29480E2948009
S1230340E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E29487
S123036080E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480E27B
S12303809480E29480E29480E29480E29480E29480E29480E29480E29480E29480E29480A9
S12303A0E29480E29480E29480E29480E29480E294800A202020202020203030302020209B
S12303C03020202020203030202020204E554C20275C302720202020202020202020202000
S12303E02020202020202020313030202020363420202020343020202020400A2020202070
S5030020DC
fubar
if test $? -ne 0; then no_result; fi

srec_cat test1.in test2.in test3.in test4.in -gen 0x100 0x104 \
  -const-b-e 0x01020304 4 -o test.out 2>test.err
if test $? -ne 0; then fail; fi

diff test.ok test.out
if test $? -ne 0; then fail; fi

srec_cat test4.in test3.in  -gen 0x100 0x104 -const-b-e 0x01020304 4 \
  test2.in test1.in -o test.out 2>test.err
if test $? -ne 0; then fail; fi

diff test.ok test.out
if test $? -ne 0; then fail; fi

srec_cat  -gen 0x100 0x104 -const-b-e 0x01020304 4 test3.in \
  test1.in test4.in test2.in -o test.out 2>test.err
if test $? -ne 0; then fail; fi

diff test.ok test.out
if test $? -ne 0; then fail; fi

#
# The things tested here, worked.
# No other guarantees are made.
#
pass
