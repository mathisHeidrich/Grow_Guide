import re

with open('lib/screens/checkin_screen.dart', 'r') as f:
    content = f.read()

content = re.sub(r'<<<<<<< HEAD\n\n=======\n\s*\n>>>>>>> fix-checkin-logic', '\n', content)

content = re.sub(r'<<<<<<< HEAD\n\s*LogEntriesCompanion\.insert\([\s\S]*?\n\s*\),\n\s*\);\n=======\n([\s\S]*?)\n>>>>>>> fix-checkin-logic', r'\1', content)

with open('lib/screens/checkin_screen.dart', 'w') as f:
    f.write(content)
