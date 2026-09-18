import re

with open('lib/l10n/app_de.arb', 'r') as f:
    content = f.read()

lines = content.split('\n')
out = []
for i, line in enumerate(lines):
    if '<<<<<<<' in line or '=======' in line or '>>>>>>>' in line:
        continue
    if '"checkinVentilatorTitle":' in line:
        if len(out) > 0 and not out[-1].strip().endswith(',') and not out[-1].strip() == '{':
            out[-1] = out[-1] + ','
    out.append(line)

with open('lib/l10n/app_de.arb', 'w') as f:
    f.write('\n'.join(out))
