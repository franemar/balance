/*!
 * Copyright (c) 2026 Franklin Marín franklin.e.marin@gmail.com
 * SPDX-License-Identifier: MPL-2.0
 */

import * as ohm from 'ohm-js';
import * as fs from 'fs';
const contents = fs.readFileSync('grammar.ohm', 'utf-8');
const g = ohm.grammar(contents);

const testString = '23/06/2026 Portfolio:HighRisk:Wagering:Betsson:Sports 5 Revenue:HighRisk:Wagering .47 -> Portfolio:HighRisk:Wagering:Betsson "Colombia vs. RD Congo"';

const result = g.match(testString);
if (result.failed()) {
    console.log(result.message);
}
console.log(g.trace(testString).toString());
