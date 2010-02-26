From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 5/5] renouveau: unify nv30 and nv40 as NVFXTCL
Date: Fri, 26 Feb 2010 14:38:24 +0100
Message-ID: <1267191504-24575-6-git-send-email-luca@luca-barbieri.com>
References: <1267191504-24575-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1267191504-24575-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch unifies all the registers that are the same between nv30
and nv40.

nv30 and nv40 are mostly identical, except for the following areas:
- Texture sampler definition
- Separate blend equation
- MRT
- FP_CONTROL
- Miscellaneous unused registers that may be wrong

A new "NVFXTCL" is created and contains all the common registers.

A sed script (use sed -r or perl -p for it) is also committed, that
can be used to fix the constants in the Gallium driver and DDX.

This change was automatically generated with a Python script, which is
committed as well.
---
 nvfx.py       |  207 +++++++++++++
 nvfx.sed      |  340 +++++++++++++++++++++
 renouveau.xml |  912 +++++++++++++++++++++-----------------------------------
 3 files changed, 889 insertions(+), 570 deletions(-)
 create mode 100755 nvfx.py
 create mode 100644 nvfx.sed

diff --git a/nvfx.py b/nvfx.py
new file mode 100755
index 0000000..c3703d7
--- /dev/null
+++ b/nvfx.py
@@ -0,0 +1,207 @@
+#!/usr/bin/python
+#use diff -w -u to ignore whitespace due to difference between attr="" /> and attr=""/>
+import sys
+# don't use ElementTree/cElementTree because they don't preserve attribute order
+from lxml import etree as ET
+xml = sys.argv[1] if 1 in sys.argv else "renouveau.xml"
+tree = ET.parse(xml)
+root = tree.getroot();
+nv30tcl = None
+tclnames = ("NV34TCL", "NV40TCL")
+unitclname = "NVFXTCL"
+unitclid = "0xfa1e3040"
+tcls = [None for i in tclnames]
+for obj in root:
+	if obj.tag != "object":
+		continue
+	for i in xrange(len(tclnames)):
+		if obj.get("name") == tclnames[i]:
+			if obj.get("parent"):
+				print "ERROR:", tclnames[i], "has a parent"
+				sys.exit(1)
+			tcls[i] = obj
+		if obj.attrib["name"] == "NV30TCL":
+			nv30tcl = obj
+
+def get_regs(tcl):
+	regs = {}
+	for i in tcl.iterchildren(tag=ET.Element):
+		assert i.tag == "reg32"
+		regs[i.get("offset")] = i
+	return regs
+
+def fix_field_name(fname):
+	return fname.replace("MAGNIFY", "MAG").replace("MINIFY", "MIN")
+
+def get_fields(reg32):
+	fields = {}
+	for i in reg32.iterchildren(tag=ET.Element):
+		assert i.tag == "bitfield"
+		fields[fix_field_name(i.get("name"))] = i
+	return fields
+
+def get_field_list(reg32):
+	fields = []
+	for i in reg32.iterchildren(tag=ET.Element):
+		assert i.tag == "bitfield"
+		fields.append((int(i.get("low")), i))
+	fields.sort()
+	return [reg for low, reg in fields]
+
+dicts = [get_regs(tcl) for tcl in tcls]
+
+nvfx_sed = open("nvfx.sed", "w")
+diffs = open("diffs", "w")
+
+common = ET.Element("object")
+common.set("name", unitclname)
+common.set("id", unitclid)
+common.text = "\n    "
+
+for tcl in tcls:
+	for reg32 in tcl:
+		if reg32.tail:
+			reg32.tail = "\n    "
+
+for reg32 in tcls[0].iterchildren(tag=ET.Element):
+	offset = reg32.attrib["offset"]
+	regs = [d.get(offset) for d in dicts]
+	missing = 0
+	for i in xrange(len(regs)):
+		if regs[i] == None:
+			missing += 1
+	if missing:
+		continue
+
+	names = [r.get("name") for r in regs]
+	candnames = [n for n in names if n]
+	name = None
+	if candnames:
+		name = candnames[-1]
+
+# these must not be unified
+	if name == "MRT_COLOR_MASK" or name == "TEX_SIZE1" or name == "UNK0400" or name == "ZETA_PITCH":
+		continue
+
+	diff = 0
+
+# these have bitfields defined on nv30 but not nv40
+	use_nv30 = False
+	if name == "VIEWPORT_CLIP_HORIZ" or name == "VIEWPORT_CLIP_VERT":
+		use_nv30 = True
+
+# these are the same but have bitfield definition lines in opposite order: use ascending nv30 order
+	if name == "RT_HORIZ" or name == "RT_VERT" or name == "VIEWPORT_HORIZ" or name == "VIEWPORT_VERT" or name == "VB_ELEMENT_U16" or name == "VB_VERTEX_BATCH" or name == "FP_ADDRESS":
+		use_nv30 = True
+
+# this is not described on nv40, presumably it's the same as nv30
+	if name == "MULTISAMPLE_CONTROL":
+		use_nv30 = True
+
+	deep = False
+	# these have different contents, but we want the register to exist in NVFX
+	if name == "FP_CONTROL" or name == "COLOR_MASK" or name == "COLOR0_PITCH":
+		deep = True
+
+	# texture fields, we want the registers to exist in NVFX but not the contents
+	if int(offset, 16) >= 0x1a00 and int(offset, 16) < 0x1a20:
+		deep = True
+
+	ext_nv40 = False
+# nv40 also has rt2 and rt3
+	if name == "RT_ENABLE":
+		ext_nv40 = True
+
+	if not deep:
+		if not use_nv30 and not ext_nv40:
+			s = None
+			for i in xrange(len(regs)):
+				r = ET.fromstring(ET.tostring(regs[i]))
+				r.attrib["name"] = ""
+				if s == None:
+					s = ET.tostring(r).strip()
+				elif ET.tostring(r).strip() != s:
+					diff += 1
+			if diff:
+				print >> diffs, "DIFF:", name
+				print >> diffs, ET.tostring(regs[0])
+				print >> diffs, ET.tostring(regs[1])
+				continue
+	else:
+		fields = [get_fields(reg) for reg in regs]
+		field_list = get_field_list(regs[0])
+		creg = ET.Element("reg32")
+		creg.set("offset", offset)
+		creg.set("name", name)
+		if regs[0].attrib["type"] == regs[1].attrib["type"]:
+			creg.set("type", regs[0].attrib["type"])
+		else:
+			creg.set("type", "hexa")
+		if "size" in regs[0].attrib or "size" in regs[1].attrib:
+			size0 = int(regs[0].attrib["size"]) if "size" in regs[0].attrib else 0
+			size1 = int(regs[1].attrib["size"]) if "size" in regs[1].attrib else 0
+			creg.attrib["size"] = str(size1 if size1 > size0 else size0)
+		if "stride" in regs[0].attrib or "stride" in regs[1].attrib:
+			assert regs[0].attrib["stride"] == regs[1].attrib["stride"]
+			creg.attrib["stride"] = regs[0].attrib["stride"]
+		creg.tail = "\n    "
+		prev = None
+		perfect = len(fields[0]) == len(fields[1])
+		cfields = []
+		for field0 in field_list:
+			fname = fix_field_name(field0.attrib["name"])
+			if fname in fields[0] and fname in fields[1]:
+				s0 = fix_field_name(ET.tostring(fields[0][fname]).strip())
+				s1 = fix_field_name(ET.tostring(fields[1][fname]).strip())
+				if "nv04_tx_wrap" in s0:
+					s0 = s0.replace("nv04_tx_wrap", "nv40_texture_wrap")
+					s0 = s0.replace("high=\"7\"", "high=\"3\"")
+				if s0 == s1:
+					if prev == None:
+						creg.text = "\n      "
+					else:
+						prev.tail = "\n      "
+					cfield = ET.fromstring(ET.tostring(fields[1][fname]))
+					cfield.attrib["name"] = fname
+					cfield.tail = "\n    "
+					creg.append(cfield)
+					prev = cfield
+					cfields.append(cfield)
+				else:
+					perfect = False
+			else:
+				perfect = False
+
+		if not perfect:
+			for i in xrange(len(tcls)):
+				for cfield in cfields:
+					r = regs[i]
+					fname = cfield.attrib["name"]
+					print >> nvfx_sed, "s/" + tclnames[i] + "_" + r.attrib["name"] + "_" + fields[i][fname].attrib["name"] + "/" + unitclname + "_" + name + "_" + fname + "/g;"
+				print >> nvfx_sed, "s/" + tclnames[i] + "_" + r.attrib["name"] + "([^_])/" + unitclname + "_" + name + "\\1/g;"
+			common.append(creg)
+			continue
+
+	if name:
+		for i in xrange(len(tcls)):
+			if ext_nv40 and i == 1:
+				continue
+			r = regs[i]
+			if "name" in r.attrib:
+				print >> nvfx_sed, "s/" + tclnames[i] + "_" + r.attrib["name"] + "/" + unitclname + "_" + name + "/g;"
+			r.attrib["name"] = name
+
+	tcls[0].remove(regs[0])
+	if not ext_nv40:
+		tcls[1].remove(regs[1])
+
+	regs[0].tail = "\n    "
+	common.append(regs[0])
+#	print name
+
+common.tail = "\n\n  "
+root.insert(root.index(nv30tcl), common)
+
+print "<?xml version=\"1.0\"?>"
+print
+print ET.tostring(root)
diff --git a/nvfx.sed b/nvfx.sed
new file mode 100644
index 0000000..0dfa675
--- /dev/null
+++ b/nvfx.sed
@@ -0,0 +1,340 @@
+s/NV34TCL_NOP/NVFXTCL_NOP/g;
+s/NV40TCL_NOP/NVFXTCL_NOP/g;
+s/NV34TCL_NOTIFY/NVFXTCL_NOTIFY/g;
+s/NV40TCL_NOTIFY/NVFXTCL_NOTIFY/g;
+s/NV34TCL_DMA_NOTIFY/NVFXTCL_DMA_NOTIFY/g;
+s/NV40TCL_DMA_NOTIFY/NVFXTCL_DMA_NOTIFY/g;
+s/NV34TCL_DMA_TEXTURE0/NVFXTCL_DMA_TEXTURE0/g;
+s/NV40TCL_DMA_TEXTURE0/NVFXTCL_DMA_TEXTURE0/g;
+s/NV34TCL_DMA_TEXTURE1/NVFXTCL_DMA_TEXTURE1/g;
+s/NV40TCL_DMA_TEXTURE1/NVFXTCL_DMA_TEXTURE1/g;
+s/NV34TCL_DMA_COLOR1/NVFXTCL_DMA_COLOR1/g;
+s/NV40TCL_DMA_COLOR1/NVFXTCL_DMA_COLOR1/g;
+s/NV34TCL_DMA_COLOR0/NVFXTCL_DMA_COLOR0/g;
+s/NV40TCL_DMA_COLOR0/NVFXTCL_DMA_COLOR0/g;
+s/NV34TCL_DMA_ZETA/NVFXTCL_DMA_ZETA/g;
+s/NV40TCL_DMA_ZETA/NVFXTCL_DMA_ZETA/g;
+s/NV34TCL_DMA_VTXBUF0/NVFXTCL_DMA_VTXBUF0/g;
+s/NV40TCL_DMA_VTXBUF0/NVFXTCL_DMA_VTXBUF0/g;
+s/NV34TCL_DMA_VTXBUF1/NVFXTCL_DMA_VTXBUF1/g;
+s/NV40TCL_DMA_VTXBUF1/NVFXTCL_DMA_VTXBUF1/g;
+s/NV34TCL_DMA_FENCE/NVFXTCL_DMA_FENCE/g;
+s/NV40TCL_DMA_FENCE/NVFXTCL_DMA_FENCE/g;
+s/NV34TCL_DMA_QUERY/NVFXTCL_DMA_QUERY/g;
+s/NV40TCL_DMA_QUERY/NVFXTCL_DMA_QUERY/g;
+s/NV34TCL_DMA_IN_MEMORY7/NVFXTCL_DMA_UNK01AC/g;
+s/NV40TCL_DMA_UNK01AC/NVFXTCL_DMA_UNK01AC/g;
+s/NV34TCL_DMA_IN_MEMORY8/NVFXTCL_DMA_UNK01B0/g;
+s/NV40TCL_DMA_UNK01B0/NVFXTCL_DMA_UNK01B0/g;
+s/NV34TCL_RT_HORIZ/NVFXTCL_RT_HORIZ/g;
+s/NV40TCL_RT_HORIZ/NVFXTCL_RT_HORIZ/g;
+s/NV34TCL_RT_VERT/NVFXTCL_RT_VERT/g;
+s/NV40TCL_RT_VERT/NVFXTCL_RT_VERT/g;
+s/NV34TCL_RT_FORMAT/NVFXTCL_RT_FORMAT/g;
+s/NV40TCL_RT_FORMAT/NVFXTCL_RT_FORMAT/g;
+s/NV34TCL_COLOR0_PITCH([^_])/NVFXTCL_COLOR0_PITCH\1/g;
+s/NV40TCL_COLOR0_PITCH([^_])/NVFXTCL_COLOR0_PITCH\1/g;
+s/NV34TCL_COLOR0_OFFSET/NVFXTCL_COLOR0_OFFSET/g;
+s/NV40TCL_COLOR0_OFFSET/NVFXTCL_COLOR0_OFFSET/g;
+s/NV34TCL_ZETA_OFFSET/NVFXTCL_ZETA_OFFSET/g;
+s/NV40TCL_ZETA_OFFSET/NVFXTCL_ZETA_OFFSET/g;
+s/NV34TCL_COLOR1_OFFSET/NVFXTCL_COLOR1_OFFSET/g;
+s/NV40TCL_COLOR1_OFFSET/NVFXTCL_COLOR1_OFFSET/g;
+s/NV34TCL_COLOR1_PITCH/NVFXTCL_COLOR1_PITCH/g;
+s/NV40TCL_COLOR1_PITCH/NVFXTCL_COLOR1_PITCH/g;
+s/NV34TCL_RT_ENABLE/NVFXTCL_RT_ENABLE/g;
+s/NV34TCL_VIEWPORT_CLIP_MODE/NVFXTCL_VIEWPORT_CLIP_MODE/g;
+s/NV34TCL_VIEWPORT_CLIP_HORIZ/NVFXTCL_VIEWPORT_CLIP_HORIZ/g;
+s/NV40TCL_VIEWPORT_CLIP_HORIZ/NVFXTCL_VIEWPORT_CLIP_HORIZ/g;
+s/NV34TCL_VIEWPORT_CLIP_VERT/NVFXTCL_VIEWPORT_CLIP_VERT/g;
+s/NV40TCL_VIEWPORT_CLIP_VERT/NVFXTCL_VIEWPORT_CLIP_VERT/g;
+s/NV34TCL_DITHER_ENABLE/NVFXTCL_DITHER_ENABLE/g;
+s/NV40TCL_DITHER_ENABLE/NVFXTCL_DITHER_ENABLE/g;
+s/NV34TCL_ALPHA_FUNC_ENABLE/NVFXTCL_ALPHA_TEST_ENABLE/g;
+s/NV40TCL_ALPHA_TEST_ENABLE/NVFXTCL_ALPHA_TEST_ENABLE/g;
+s/NV34TCL_ALPHA_FUNC_FUNC/NVFXTCL_ALPHA_TEST_FUNC/g;
+s/NV40TCL_ALPHA_TEST_FUNC/NVFXTCL_ALPHA_TEST_FUNC/g;
+s/NV34TCL_ALPHA_FUNC_REF/NVFXTCL_ALPHA_TEST_REF/g;
+s/NV40TCL_ALPHA_TEST_REF/NVFXTCL_ALPHA_TEST_REF/g;
+s/NV34TCL_BLEND_FUNC_ENABLE/NVFXTCL_BLEND_ENABLE/g;
+s/NV40TCL_BLEND_ENABLE/NVFXTCL_BLEND_ENABLE/g;
+s/NV34TCL_BLEND_FUNC_SRC/NVFXTCL_BLEND_FUNC_SRC/g;
+s/NV40TCL_BLEND_FUNC_SRC/NVFXTCL_BLEND_FUNC_SRC/g;
+s/NV34TCL_BLEND_FUNC_DST/NVFXTCL_BLEND_FUNC_DST/g;
+s/NV40TCL_BLEND_FUNC_DST/NVFXTCL_BLEND_FUNC_DST/g;
+s/NV34TCL_BLEND_COLOR/NVFXTCL_BLEND_COLOR/g;
+s/NV40TCL_BLEND_COLOR/NVFXTCL_BLEND_COLOR/g;
+s/NV34TCL_COLOR_MASK([^_])/NVFXTCL_COLOR_MASK\1/g;
+s/NV40TCL_COLOR_MASK([^_])/NVFXTCL_COLOR_MASK\1/g;
+s/NV34TCL_STENCIL_FRONT_ENABLE/NVFXTCL_STENCIL_FRONT_ENABLE/g;
+s/NV40TCL_STENCIL_FRONT_ENABLE/NVFXTCL_STENCIL_FRONT_ENABLE/g;
+s/NV34TCL_STENCIL_FRONT_MASK/NVFXTCL_STENCIL_FRONT_MASK/g;
+s/NV40TCL_STENCIL_FRONT_MASK/NVFXTCL_STENCIL_FRONT_MASK/g;
+s/NV34TCL_STENCIL_FRONT_FUNC_FUNC/NVFXTCL_STENCIL_FRONT_FUNC_FUNC/g;
+s/NV40TCL_STENCIL_FRONT_FUNC_FUNC/NVFXTCL_STENCIL_FRONT_FUNC_FUNC/g;
+s/NV34TCL_STENCIL_FRONT_FUNC_REF/NVFXTCL_STENCIL_FRONT_FUNC_REF/g;
+s/NV40TCL_STENCIL_FRONT_FUNC_REF/NVFXTCL_STENCIL_FRONT_FUNC_REF/g;
+s/NV34TCL_STENCIL_FRONT_FUNC_MASK/NVFXTCL_STENCIL_FRONT_FUNC_MASK/g;
+s/NV40TCL_STENCIL_FRONT_FUNC_MASK/NVFXTCL_STENCIL_FRONT_FUNC_MASK/g;
+s/NV34TCL_STENCIL_FRONT_OP_FAIL/NVFXTCL_STENCIL_FRONT_OP_FAIL/g;
+s/NV40TCL_STENCIL_FRONT_OP_FAIL/NVFXTCL_STENCIL_FRONT_OP_FAIL/g;
+s/NV34TCL_STENCIL_FRONT_OP_ZFAIL/NVFXTCL_STENCIL_FRONT_OP_ZFAIL/g;
+s/NV40TCL_STENCIL_FRONT_OP_ZFAIL/NVFXTCL_STENCIL_FRONT_OP_ZFAIL/g;
+s/NV34TCL_STENCIL_FRONT_OP_ZPASS/NVFXTCL_STENCIL_FRONT_OP_ZPASS/g;
+s/NV40TCL_STENCIL_FRONT_OP_ZPASS/NVFXTCL_STENCIL_FRONT_OP_ZPASS/g;
+s/NV34TCL_STENCIL_BACK_ENABLE/NVFXTCL_STENCIL_BACK_ENABLE/g;
+s/NV40TCL_STENCIL_BACK_ENABLE/NVFXTCL_STENCIL_BACK_ENABLE/g;
+s/NV34TCL_STENCIL_BACK_MASK/NVFXTCL_STENCIL_BACK_MASK/g;
+s/NV40TCL_STENCIL_BACK_MASK/NVFXTCL_STENCIL_BACK_MASK/g;
+s/NV34TCL_STENCIL_BACK_FUNC_FUNC/NVFXTCL_STENCIL_BACK_FUNC_FUNC/g;
+s/NV40TCL_STENCIL_BACK_FUNC_FUNC/NVFXTCL_STENCIL_BACK_FUNC_FUNC/g;
+s/NV34TCL_STENCIL_BACK_FUNC_REF/NVFXTCL_STENCIL_BACK_FUNC_REF/g;
+s/NV40TCL_STENCIL_BACK_FUNC_REF/NVFXTCL_STENCIL_BACK_FUNC_REF/g;
+s/NV34TCL_STENCIL_BACK_FUNC_MASK/NVFXTCL_STENCIL_BACK_FUNC_MASK/g;
+s/NV40TCL_STENCIL_BACK_FUNC_MASK/NVFXTCL_STENCIL_BACK_FUNC_MASK/g;
+s/NV34TCL_STENCIL_BACK_OP_FAIL/NVFXTCL_STENCIL_BACK_OP_FAIL/g;
+s/NV40TCL_STENCIL_BACK_OP_FAIL/NVFXTCL_STENCIL_BACK_OP_FAIL/g;
+s/NV34TCL_STENCIL_BACK_OP_ZFAIL/NVFXTCL_STENCIL_BACK_OP_ZFAIL/g;
+s/NV40TCL_STENCIL_BACK_OP_ZFAIL/NVFXTCL_STENCIL_BACK_OP_ZFAIL/g;
+s/NV34TCL_STENCIL_BACK_OP_ZPASS/NVFXTCL_STENCIL_BACK_OP_ZPASS/g;
+s/NV40TCL_STENCIL_BACK_OP_ZPASS/NVFXTCL_STENCIL_BACK_OP_ZPASS/g;
+s/NV34TCL_SHADE_MODEL/NVFXTCL_SHADE_MODEL/g;
+s/NV40TCL_SHADE_MODEL/NVFXTCL_SHADE_MODEL/g;
+s/NV34TCL_COLOR_LOGIC_OP_ENABLE/NVFXTCL_COLOR_LOGIC_OP_ENABLE/g;
+s/NV40TCL_COLOR_LOGIC_OP_ENABLE/NVFXTCL_COLOR_LOGIC_OP_ENABLE/g;
+s/NV34TCL_COLOR_LOGIC_OP_OP/NVFXTCL_COLOR_LOGIC_OP/g;
+s/NV40TCL_COLOR_LOGIC_OP/NVFXTCL_COLOR_LOGIC_OP/g;
+s/NV34TCL_DEPTH_RANGE_NEAR/NVFXTCL_DEPTH_RANGE_NEAR/g;
+s/NV40TCL_DEPTH_RANGE_NEAR/NVFXTCL_DEPTH_RANGE_NEAR/g;
+s/NV34TCL_DEPTH_RANGE_FAR/NVFXTCL_DEPTH_RANGE_FAR/g;
+s/NV40TCL_DEPTH_RANGE_FAR/NVFXTCL_DEPTH_RANGE_FAR/g;
+s/NV34TCL_LINE_WIDTH/NVFXTCL_LINE_WIDTH/g;
+s/NV40TCL_LINE_WIDTH/NVFXTCL_LINE_WIDTH/g;
+s/NV34TCL_LINE_SMOOTH_ENABLE/NVFXTCL_LINE_SMOOTH_ENABLE/g;
+s/NV40TCL_LINE_SMOOTH_ENABLE/NVFXTCL_LINE_SMOOTH_ENABLE/g;
+s/NV34TCL_SCISSOR_HORIZ/NVFXTCL_SCISSOR_HORIZ/g;
+s/NV40TCL_SCISSOR_HORIZ/NVFXTCL_SCISSOR_HORIZ/g;
+s/NV34TCL_SCISSOR_VERT/NVFXTCL_SCISSOR_VERT/g;
+s/NV40TCL_SCISSOR_VERT/NVFXTCL_SCISSOR_VERT/g;
+s/NV34TCL_FOG_MODE/NVFXTCL_FOG_MODE/g;
+s/NV40TCL_FOG_MODE/NVFXTCL_FOG_MODE/g;
+s/NV34TCL_FOG_EQUATION_CONSTANT/NVFXTCL_FOG_EQUATION_CONSTANT/g;
+s/NV40TCL_FOG_EQUATION_CONSTANT/NVFXTCL_FOG_EQUATION_CONSTANT/g;
+s/NV34TCL_FOG_EQUATION_LINEAR/NVFXTCL_FOG_EQUATION_LINEAR/g;
+s/NV40TCL_FOG_EQUATION_LINEAR/NVFXTCL_FOG_EQUATION_LINEAR/g;
+s/NV34TCL_FOG_EQUATION_QUADRATIC/NVFXTCL_FOG_EQUATION_QUADRATIC/g;
+s/NV40TCL_FOG_EQUATION_QUADRATIC/NVFXTCL_FOG_EQUATION_QUADRATIC/g;
+s/NV34TCL_FP_ACTIVE_PROGRAM/NVFXTCL_FP_ADDRESS/g;
+s/NV40TCL_FP_ADDRESS/NVFXTCL_FP_ADDRESS/g;
+s/NV34TCL_VIEWPORT_HORIZ/NVFXTCL_VIEWPORT_HORIZ/g;
+s/NV40TCL_VIEWPORT_HORIZ/NVFXTCL_VIEWPORT_HORIZ/g;
+s/NV34TCL_VIEWPORT_VERT/NVFXTCL_VIEWPORT_VERT/g;
+s/NV40TCL_VIEWPORT_VERT/NVFXTCL_VIEWPORT_VERT/g;
+s/NV34TCL_VIEWPORT_TRANSLATE_X/NVFXTCL_VIEWPORT_TRANSLATE_X/g;
+s/NV40TCL_VIEWPORT_TRANSLATE_X/NVFXTCL_VIEWPORT_TRANSLATE_X/g;
+s/NV34TCL_VIEWPORT_TRANSLATE_Y/NVFXTCL_VIEWPORT_TRANSLATE_Y/g;
+s/NV40TCL_VIEWPORT_TRANSLATE_Y/NVFXTCL_VIEWPORT_TRANSLATE_Y/g;
+s/NV34TCL_VIEWPORT_TRANSLATE_Z/NVFXTCL_VIEWPORT_TRANSLATE_Z/g;
+s/NV40TCL_VIEWPORT_TRANSLATE_Z/NVFXTCL_VIEWPORT_TRANSLATE_Z/g;
+s/NV34TCL_VIEWPORT_TRANSLATE_W/NVFXTCL_VIEWPORT_TRANSLATE_W/g;
+s/NV40TCL_VIEWPORT_TRANSLATE_W/NVFXTCL_VIEWPORT_TRANSLATE_W/g;
+s/NV34TCL_VIEWPORT_SCALE_X/NVFXTCL_VIEWPORT_SCALE_X/g;
+s/NV40TCL_VIEWPORT_SCALE_X/NVFXTCL_VIEWPORT_SCALE_X/g;
+s/NV34TCL_VIEWPORT_SCALE_Y/NVFXTCL_VIEWPORT_SCALE_Y/g;
+s/NV40TCL_VIEWPORT_SCALE_Y/NVFXTCL_VIEWPORT_SCALE_Y/g;
+s/NV34TCL_VIEWPORT_SCALE_Z/NVFXTCL_VIEWPORT_SCALE_Z/g;
+s/NV40TCL_VIEWPORT_SCALE_Z/NVFXTCL_VIEWPORT_SCALE_Z/g;
+s/NV34TCL_VIEWPORT_SCALE_W/NVFXTCL_VIEWPORT_SCALE_W/g;
+s/NV40TCL_VIEWPORT_SCALE_W/NVFXTCL_VIEWPORT_SCALE_W/g;
+s/NV34TCL_POLYGON_OFFSET_POINT_ENABLE/NVFXTCL_POLYGON_OFFSET_POINT_ENABLE/g;
+s/NV40TCL_POLYGON_OFFSET_POINT_ENABLE/NVFXTCL_POLYGON_OFFSET_POINT_ENABLE/g;
+s/NV34TCL_POLYGON_OFFSET_LINE_ENABLE/NVFXTCL_POLYGON_OFFSET_LINE_ENABLE/g;
+s/NV40TCL_POLYGON_OFFSET_LINE_ENABLE/NVFXTCL_POLYGON_OFFSET_LINE_ENABLE/g;
+s/NV34TCL_POLYGON_OFFSET_FILL_ENABLE/NVFXTCL_POLYGON_OFFSET_FILL_ENABLE/g;
+s/NV40TCL_POLYGON_OFFSET_FILL_ENABLE/NVFXTCL_POLYGON_OFFSET_FILL_ENABLE/g;
+s/NV34TCL_DEPTH_FUNC/NVFXTCL_DEPTH_FUNC/g;
+s/NV40TCL_DEPTH_FUNC/NVFXTCL_DEPTH_FUNC/g;
+s/NV34TCL_DEPTH_WRITE_ENABLE/NVFXTCL_DEPTH_WRITE_ENABLE/g;
+s/NV40TCL_DEPTH_WRITE_ENABLE/NVFXTCL_DEPTH_WRITE_ENABLE/g;
+s/NV34TCL_DEPTH_TEST_ENABLE/NVFXTCL_DEPTH_TEST_ENABLE/g;
+s/NV40TCL_DEPTH_TEST_ENABLE/NVFXTCL_DEPTH_TEST_ENABLE/g;
+s/NV34TCL_POLYGON_OFFSET_FACTOR/NVFXTCL_POLYGON_OFFSET_FACTOR/g;
+s/NV40TCL_POLYGON_OFFSET_FACTOR/NVFXTCL_POLYGON_OFFSET_FACTOR/g;
+s/NV34TCL_POLYGON_OFFSET_UNITS/NVFXTCL_POLYGON_OFFSET_UNITS/g;
+s/NV40TCL_POLYGON_OFFSET_UNITS/NVFXTCL_POLYGON_OFFSET_UNITS/g;
+s/NV34TCL_VTX_ATTR_3I_XY/NVFXTCL_VTX_ATTR_3I_XY/g;
+s/NV40TCL_VTX_ATTR_3I_XY/NVFXTCL_VTX_ATTR_3I_XY/g;
+s/NV34TCL_VTX_ATTR_3I_Z/NVFXTCL_VTX_ATTR_3I_Z/g;
+s/NV40TCL_VTX_ATTR_3I_Z/NVFXTCL_VTX_ATTR_3I_Z/g;
+s/NV34TCL_VP_UPLOAD_INST/NVFXTCL_VP_UPLOAD_INST/g;
+s/NV40TCL_VP_UPLOAD_INST/NVFXTCL_VP_UPLOAD_INST/g;
+s/NV34TCL_VERTEX_TWO_SIDE_ENABLE/NVFXTCL_VERTEX_TWO_SIDE_ENABLE/g;
+s/NV40TCL_VERTEX_TWO_SIDE_ENABLE/NVFXTCL_VERTEX_TWO_SIDE_ENABLE/g;
+s/NV34TCL_VP_CLIP_PLANES_ENABLE/NVFXTCL_CLIP_PLANE_ENABLE/g;
+s/NV40TCL_CLIP_PLANE_ENABLE/NVFXTCL_CLIP_PLANE_ENABLE/g;
+s/NV34TCL_POLYGON_STIPPLE_ENABLE/NVFXTCL_POLYGON_STIPPLE_ENABLE/g;
+s/NV40TCL_POLYGON_STIPPLE_ENABLE/NVFXTCL_POLYGON_STIPPLE_ENABLE/g;
+s/NV34TCL_POLYGON_STIPPLE_PATTERN/NVFXTCL_POLYGON_STIPPLE_PATTERN/g;
+s/NV40TCL_POLYGON_STIPPLE_PATTERN/NVFXTCL_POLYGON_STIPPLE_PATTERN/g;
+s/NV34TCL_VTX_ATTR_3F_X/NVFXTCL_VTX_ATTR_3F_X/g;
+s/NV40TCL_VTX_ATTR_3F_X/NVFXTCL_VTX_ATTR_3F_X/g;
+s/NV34TCL_VTX_ATTR_3F_Y/NVFXTCL_VTX_ATTR_3F_Y/g;
+s/NV40TCL_VTX_ATTR_3F_Y/NVFXTCL_VTX_ATTR_3F_Y/g;
+s/NV34TCL_VTX_ATTR_3F_Z/NVFXTCL_VTX_ATTR_3F_Z/g;
+s/NV40TCL_VTX_ATTR_3F_Z/NVFXTCL_VTX_ATTR_3F_Z/g;
+s/NV34TCL_VTXBUF_ADDRESS/NVFXTCL_VTXBUF_ADDRESS/g;
+s/NV40TCL_VTXBUF_ADDRESS/NVFXTCL_VTXBUF_ADDRESS/g;
+s/NV34TCL_VTXFMT/NVFXTCL_VTXFMT/g;
+s/NV40TCL_VTXFMT/NVFXTCL_VTXFMT/g;
+s/NV34TCL_QUERY_RESET/NVFXTCL_QUERY_RESET/g;
+s/NV40TCL_QUERY_RESET/NVFXTCL_QUERY_RESET/g;
+s/NV34TCL_QUERY_UNK17CC/NVFXTCL_QUERY_UNK17CC/g;
+s/NV40TCL_QUERY_UNK17CC/NVFXTCL_QUERY_UNK17CC/g;
+s/NV34TCL_QUERY_GET/NVFXTCL_QUERY_GET/g;
+s/NV40TCL_QUERY_GET/NVFXTCL_QUERY_GET/g;
+s/NV34TCL_VERTEX_BEGIN_END/NVFXTCL_BEGIN_END/g;
+s/NV40TCL_BEGIN_END/NVFXTCL_BEGIN_END/g;
+s/NV34TCL_VB_ELEMENT_U16/NVFXTCL_VB_ELEMENT_U16/g;
+s/NV40TCL_VB_ELEMENT_U16/NVFXTCL_VB_ELEMENT_U16/g;
+s/NV34TCL_VB_ELEMENT_U32/NVFXTCL_VB_ELEMENT_U32/g;
+s/NV40TCL_VB_ELEMENT_U32/NVFXTCL_VB_ELEMENT_U32/g;
+s/NV34TCL_VB_VERTEX_BATCH/NVFXTCL_VB_VERTEX_BATCH/g;
+s/NV40TCL_VB_VERTEX_BATCH/NVFXTCL_VB_VERTEX_BATCH/g;
+s/NV34TCL_VERTEX_DATA/NVFXTCL_VERTEX_DATA/g;
+s/NV40TCL_VERTEX_DATA/NVFXTCL_VERTEX_DATA/g;
+s/NV34TCL_IDXBUF_ADDRESS/NVFXTCL_IDXBUF_ADDRESS/g;
+s/NV40TCL_IDXBUF_ADDRESS/NVFXTCL_IDXBUF_ADDRESS/g;
+s/NV34TCL_IDXBUF_FORMAT/NVFXTCL_IDXBUF_FORMAT/g;
+s/NV40TCL_IDXBUF_FORMAT/NVFXTCL_IDXBUF_FORMAT/g;
+s/NV34TCL_VB_INDEX_BATCH/NVFXTCL_VB_INDEX_BATCH/g;
+s/NV40TCL_VB_INDEX_BATCH/NVFXTCL_VB_INDEX_BATCH/g;
+s/NV34TCL_POLYGON_MODE_FRONT/NVFXTCL_POLYGON_MODE_FRONT/g;
+s/NV40TCL_POLYGON_MODE_FRONT/NVFXTCL_POLYGON_MODE_FRONT/g;
+s/NV34TCL_POLYGON_MODE_BACK/NVFXTCL_POLYGON_MODE_BACK/g;
+s/NV40TCL_POLYGON_MODE_BACK/NVFXTCL_POLYGON_MODE_BACK/g;
+s/NV34TCL_CULL_FACE/NVFXTCL_CULL_FACE/g;
+s/NV40TCL_CULL_FACE/NVFXTCL_CULL_FACE/g;
+s/NV34TCL_FRONT_FACE/NVFXTCL_FRONT_FACE/g;
+s/NV40TCL_FRONT_FACE/NVFXTCL_FRONT_FACE/g;
+s/NV34TCL_POLYGON_SMOOTH_ENABLE/NVFXTCL_POLYGON_SMOOTH_ENABLE/g;
+s/NV40TCL_POLYGON_SMOOTH_ENABLE/NVFXTCL_POLYGON_SMOOTH_ENABLE/g;
+s/NV34TCL_CULL_FACE_ENABLE/NVFXTCL_CULL_FACE_ENABLE/g;
+s/NV40TCL_CULL_FACE_ENABLE/NVFXTCL_CULL_FACE_ENABLE/g;
+s/NV34TCL_VTX_ATTR_2F_X/NVFXTCL_VTX_ATTR_2F_X/g;
+s/NV40TCL_VTX_ATTR_2F_X/NVFXTCL_VTX_ATTR_2F_X/g;
+s/NV34TCL_VTX_ATTR_2F_Y/NVFXTCL_VTX_ATTR_2F_Y/g;
+s/NV40TCL_VTX_ATTR_2F_Y/NVFXTCL_VTX_ATTR_2F_Y/g;
+s/NV34TCL_VTX_ATTR_2I/NVFXTCL_VTX_ATTR_2I/g;
+s/NV40TCL_VTX_ATTR_2I/NVFXTCL_VTX_ATTR_2I/g;
+s/NV34TCL_VTX_ATTR_4UB/NVFXTCL_VTX_ATTR_4UB/g;
+s/NV40TCL_VTX_ATTR_4UB/NVFXTCL_VTX_ATTR_4UB/g;
+s/NV34TCL_VTX_ATTR_4I_XY/NVFXTCL_VTX_ATTR_4I_XY/g;
+s/NV40TCL_VTX_ATTR_4I_XY/NVFXTCL_VTX_ATTR_4I_XY/g;
+s/NV34TCL_VTX_ATTR_4I_ZW/NVFXTCL_VTX_ATTR_4I_ZW/g;
+s/NV40TCL_VTX_ATTR_4I_ZW/NVFXTCL_VTX_ATTR_4I_ZW/g;
+s/NV34TCL_TX_OFFSET/NVFXTCL_TEX_OFFSET/g;
+s/NV40TCL_TEX_OFFSET/NVFXTCL_TEX_OFFSET/g;
+s/NV34TCL_TX_FORMAT_DMA0/NVFXTCL_TEX_FORMAT_DMA0/g;
+s/NV34TCL_TX_FORMAT_DMA1/NVFXTCL_TEX_FORMAT_DMA1/g;
+s/NV34TCL_TX_FORMAT_CUBIC/NVFXTCL_TEX_FORMAT_CUBIC/g;
+s/NV34TCL_TX_FORMAT_NO_BORDER/NVFXTCL_TEX_FORMAT_NO_BORDER/g;
+s/NV34TCL_TX_FORMAT_DIMS/NVFXTCL_TEX_FORMAT_DIMS/g;
+s/NV34TCL_TX_FORMAT([^_])/NVFXTCL_TEX_FORMAT\1/g;
+s/NV40TCL_TEX_FORMAT_DMA0/NVFXTCL_TEX_FORMAT_DMA0/g;
+s/NV40TCL_TEX_FORMAT_DMA1/NVFXTCL_TEX_FORMAT_DMA1/g;
+s/NV40TCL_TEX_FORMAT_CUBIC/NVFXTCL_TEX_FORMAT_CUBIC/g;
+s/NV40TCL_TEX_FORMAT_NO_BORDER/NVFXTCL_TEX_FORMAT_NO_BORDER/g;
+s/NV40TCL_TEX_FORMAT_DIMS/NVFXTCL_TEX_FORMAT_DIMS/g;
+s/NV40TCL_TEX_FORMAT([^_])/NVFXTCL_TEX_FORMAT\1/g;
+s/NV34TCL_TX_WRAP_S/NVFXTCL_TEX_WRAP_S/g;
+s/NV34TCL_TX_WRAP_T/NVFXTCL_TEX_WRAP_T/g;
+s/NV34TCL_TX_WRAP_EXPAND_NORMAL/NVFXTCL_TEX_WRAP_EXPAND_NORMAL/g;
+s/NV34TCL_TX_WRAP_R/NVFXTCL_TEX_WRAP_R/g;
+s/NV34TCL_TX_WRAP_RCOMP/NVFXTCL_TEX_WRAP_RCOMP/g;
+s/NV34TCL_TX_WRAP([^_])/NVFXTCL_TEX_WRAP\1/g;
+s/NV40TCL_TEX_WRAP_S/NVFXTCL_TEX_WRAP_S/g;
+s/NV40TCL_TEX_WRAP_T/NVFXTCL_TEX_WRAP_T/g;
+s/NV40TCL_TEX_WRAP_EXPAND_NORMAL/NVFXTCL_TEX_WRAP_EXPAND_NORMAL/g;
+s/NV40TCL_TEX_WRAP_R/NVFXTCL_TEX_WRAP_R/g;
+s/NV40TCL_TEX_WRAP_RCOMP/NVFXTCL_TEX_WRAP_RCOMP/g;
+s/NV40TCL_TEX_WRAP([^_])/NVFXTCL_TEX_WRAP\1/g;
+s/NV34TCL_TEX_ENABLE([^_])/NVFXTCL_TEX_ENABLE\1/g;
+s/NV40TCL_TEX_ENABLE([^_])/NVFXTCL_TEX_ENABLE\1/g;
+s/NV34TCL_TX_SWIZZLE_S1_W/NVFXTCL_TEX_SWIZZLE_S1_W/g;
+s/NV34TCL_TX_SWIZZLE_S1_Z/NVFXTCL_TEX_SWIZZLE_S1_Z/g;
+s/NV34TCL_TX_SWIZZLE_S1_Y/NVFXTCL_TEX_SWIZZLE_S1_Y/g;
+s/NV34TCL_TX_SWIZZLE_S1_X/NVFXTCL_TEX_SWIZZLE_S1_X/g;
+s/NV34TCL_TX_SWIZZLE_S0_W/NVFXTCL_TEX_SWIZZLE_S0_W/g;
+s/NV34TCL_TX_SWIZZLE_S0_Z/NVFXTCL_TEX_SWIZZLE_S0_Z/g;
+s/NV34TCL_TX_SWIZZLE_S0_Y/NVFXTCL_TEX_SWIZZLE_S0_Y/g;
+s/NV34TCL_TX_SWIZZLE_S0_X/NVFXTCL_TEX_SWIZZLE_S0_X/g;
+s/NV34TCL_TX_SWIZZLE([^_])/NVFXTCL_TEX_SWIZZLE\1/g;
+s/NV40TCL_TEX_SWIZZLE_S1_W/NVFXTCL_TEX_SWIZZLE_S1_W/g;
+s/NV40TCL_TEX_SWIZZLE_S1_Z/NVFXTCL_TEX_SWIZZLE_S1_Z/g;
+s/NV40TCL_TEX_SWIZZLE_S1_Y/NVFXTCL_TEX_SWIZZLE_S1_Y/g;
+s/NV40TCL_TEX_SWIZZLE_S1_X/NVFXTCL_TEX_SWIZZLE_S1_X/g;
+s/NV40TCL_TEX_SWIZZLE_S0_W/NVFXTCL_TEX_SWIZZLE_S0_W/g;
+s/NV40TCL_TEX_SWIZZLE_S0_Z/NVFXTCL_TEX_SWIZZLE_S0_Z/g;
+s/NV40TCL_TEX_SWIZZLE_S0_Y/NVFXTCL_TEX_SWIZZLE_S0_Y/g;
+s/NV40TCL_TEX_SWIZZLE_S0_X/NVFXTCL_TEX_SWIZZLE_S0_X/g;
+s/NV40TCL_TEX_SWIZZLE([^_])/NVFXTCL_TEX_SWIZZLE\1/g;
+s/NV34TCL_TX_FILTER_MINIFY/NVFXTCL_TEX_FILTER_MIN/g;
+s/NV34TCL_TX_FILTER_MAGNIFY/NVFXTCL_TEX_FILTER_MAG/g;
+s/NV34TCL_TX_FILTER_SIGNED_BLUE/NVFXTCL_TEX_FILTER_SIGNED_BLUE/g;
+s/NV34TCL_TX_FILTER_SIGNED_GREEN/NVFXTCL_TEX_FILTER_SIGNED_GREEN/g;
+s/NV34TCL_TX_FILTER_SIGNED_RED/NVFXTCL_TEX_FILTER_SIGNED_RED/g;
+s/NV34TCL_TX_FILTER_SIGNED_ALPHA/NVFXTCL_TEX_FILTER_SIGNED_ALPHA/g;
+s/NV34TCL_TX_FILTER([^_])/NVFXTCL_TEX_FILTER\1/g;
+s/NV40TCL_TEX_FILTER_MIN/NVFXTCL_TEX_FILTER_MIN/g;
+s/NV40TCL_TEX_FILTER_MAG/NVFXTCL_TEX_FILTER_MAG/g;
+s/NV40TCL_TEX_FILTER_SIGNED_BLUE/NVFXTCL_TEX_FILTER_SIGNED_BLUE/g;
+s/NV40TCL_TEX_FILTER_SIGNED_GREEN/NVFXTCL_TEX_FILTER_SIGNED_GREEN/g;
+s/NV40TCL_TEX_FILTER_SIGNED_RED/NVFXTCL_TEX_FILTER_SIGNED_RED/g;
+s/NV40TCL_TEX_FILTER_SIGNED_ALPHA/NVFXTCL_TEX_FILTER_SIGNED_ALPHA/g;
+s/NV40TCL_TEX_FILTER([^_])/NVFXTCL_TEX_FILTER\1/g;
+s/NV34TCL_TX_NPOT_SIZE/NVFXTCL_TEX_SIZE0/g;
+s/NV40TCL_TEX_SIZE0/NVFXTCL_TEX_SIZE0/g;
+s/NV34TCL_TX_BORDER_COLOR/NVFXTCL_TEX_BORDER_COLOR/g;
+s/NV40TCL_TEX_BORDER_COLOR/NVFXTCL_TEX_BORDER_COLOR/g;
+s/NV34TCL_VTX_ATTR_4F_X/NVFXTCL_VTX_ATTR_4F_X/g;
+s/NV40TCL_VTX_ATTR_4F_X/NVFXTCL_VTX_ATTR_4F_X/g;
+s/NV34TCL_VTX_ATTR_4F_Y/NVFXTCL_VTX_ATTR_4F_Y/g;
+s/NV40TCL_VTX_ATTR_4F_Y/NVFXTCL_VTX_ATTR_4F_Y/g;
+s/NV34TCL_VTX_ATTR_4F_Z/NVFXTCL_VTX_ATTR_4F_Z/g;
+s/NV40TCL_VTX_ATTR_4F_Z/NVFXTCL_VTX_ATTR_4F_Z/g;
+s/NV34TCL_VTX_ATTR_4F_W/NVFXTCL_VTX_ATTR_4F_W/g;
+s/NV40TCL_VTX_ATTR_4F_W/NVFXTCL_VTX_ATTR_4F_W/g;
+s/NV34TCL_FP_CONTROL([^_])/NVFXTCL_FP_CONTROL\1/g;
+s/NV40TCL_FP_CONTROL([^_])/NVFXTCL_FP_CONTROL\1/g;
+s/NV34TCL_MULTISAMPLE_CONTROL/NVFXTCL_MULTISAMPLE_CONTROL/g;
+s/NV40TCL_MULTISAMPLE_CONTROL/NVFXTCL_MULTISAMPLE_CONTROL/g;
+s/NV34TCL_CLEAR_DEPTH_VALUE/NVFXTCL_CLEAR_VALUE_DEPTH/g;
+s/NV40TCL_CLEAR_VALUE_DEPTH/NVFXTCL_CLEAR_VALUE_DEPTH/g;
+s/NV34TCL_CLEAR_COLOR_VALUE/NVFXTCL_CLEAR_VALUE_COLOR/g;
+s/NV40TCL_CLEAR_VALUE_COLOR/NVFXTCL_CLEAR_VALUE_COLOR/g;
+s/NV34TCL_CLEAR_BUFFERS/NVFXTCL_CLEAR_BUFFERS/g;
+s/NV40TCL_CLEAR_BUFFERS/NVFXTCL_CLEAR_BUFFERS/g;
+s/NV34TCL_LINE_STIPPLE_ENABLE/NVFXTCL_LINE_STIPPLE_ENABLE/g;
+s/NV40TCL_LINE_STIPPLE_ENABLE/NVFXTCL_LINE_STIPPLE_ENABLE/g;
+s/NV34TCL_LINE_STIPPLE_PATTERN/NVFXTCL_LINE_STIPPLE_PATTERN/g;
+s/NV40TCL_LINE_STIPPLE_PATTERN/NVFXTCL_LINE_STIPPLE_PATTERN/g;
+s/NV34TCL_VTX_ATTR_1F/NVFXTCL_VTX_ATTR_1F/g;
+s/NV40TCL_VTX_ATTR_1F/NVFXTCL_VTX_ATTR_1F/g;
+s/NV34TCL_VP_UPLOAD_FROM_ID/NVFXTCL_VP_UPLOAD_FROM_ID/g;
+s/NV40TCL_VP_UPLOAD_FROM_ID/NVFXTCL_VP_UPLOAD_FROM_ID/g;
+s/NV34TCL_VP_START_FROM_ID/NVFXTCL_VP_START_FROM_ID/g;
+s/NV40TCL_VP_START_FROM_ID/NVFXTCL_VP_START_FROM_ID/g;
+s/NV34TCL_POINT_SIZE/NVFXTCL_POINT_SIZE/g;
+s/NV40TCL_POINT_SIZE/NVFXTCL_POINT_SIZE/g;
+s/NV34TCL_POINT_SPRITE/NVFXTCL_POINT_SPRITE/g;
+s/NV40TCL_POINT_SPRITE/NVFXTCL_POINT_SPRITE/g;
+s/NV34TCL_VP_UPLOAD_CONST_ID/NVFXTCL_VP_UPLOAD_CONST_ID/g;
+s/NV40TCL_VP_UPLOAD_CONST_ID/NVFXTCL_VP_UPLOAD_CONST_ID/g;
+s/NV34TCL_VP_UPLOAD_CONST_X/NVFXTCL_VP_UPLOAD_CONST_X/g;
+s/NV40TCL_VP_UPLOAD_CONST_X/NVFXTCL_VP_UPLOAD_CONST_X/g;
+s/NV34TCL_VP_UPLOAD_CONST_Y/NVFXTCL_VP_UPLOAD_CONST_Y/g;
+s/NV40TCL_VP_UPLOAD_CONST_Y/NVFXTCL_VP_UPLOAD_CONST_Y/g;
+s/NV34TCL_VP_UPLOAD_CONST_Z/NVFXTCL_VP_UPLOAD_CONST_Z/g;
+s/NV40TCL_VP_UPLOAD_CONST_Z/NVFXTCL_VP_UPLOAD_CONST_Z/g;
+s/NV34TCL_VP_UPLOAD_CONST_W/NVFXTCL_VP_UPLOAD_CONST_W/g;
+s/NV40TCL_VP_UPLOAD_CONST_W/NVFXTCL_VP_UPLOAD_CONST_W/g;
diff --git a/renouveau.xml b/renouveau.xml
index f73ef04..13fa3bc 100644
--- a/renouveau.xml
+++ b/renouveau.xml
@@ -11,7 +11,7 @@
       <bitfield name="jump" high="29" low="29"/>
       <bitfield name="method" high="30" low="30">
 	<value name="increment" value="0"/>
-	<value name="constant" value="1" />
+	<value name="constant" value="1"/>
       </bitfield>
     </instruction>
   </fifo>
@@ -441,14 +441,14 @@
       <item value="0x0028" name="DSDT"/>
       <!-- nv30+ texture formats -->
       <item value="0x0032" name="A16"/> <!-- also L16/I16 -->
-      <item value="0x0033" name="HILO16" />
+      <item value="0x0033" name="HILO16"/>
       <item value="0x0035" name="A16_RECT"/> <!-- also L16_RECT/I16_RECT -->
-      <item value="0x0036" name="HILO16_RECT" />
+      <item value="0x0036" name="HILO16_RECT"/>
       <item value="0x003f"/><!-- nv30: seen in test_logic_op, used for glDrawPixels GL_RGBA, GL_UNSIGNED_BYTE -->
-      <item value="0x0044" name="HILO8" />
-      <item value="0x0045" name="SIGNED_HILO8" />
-      <item value="0x0046" name="HILO8_RECT" />
-      <item value="0x0047" name="SIGNED_HILO8_RECT" />
+      <item value="0x0044" name="HILO8"/>
+      <item value="0x0045" name="SIGNED_HILO8"/>
+      <item value="0x0046" name="HILO8_RECT"/>
+      <item value="0x0047" name="SIGNED_HILO8_RECT"/>
       <item value="0x004a" name="FLOAT_RGBA16_NV"/> <!-- also FLOAT_RG16_NV -->
       <item value="0x004b" name="FLOAT_RGBA32_NV"/> <!-- also FLOAT_RG32_NV -->
       <item value="0x004c" name="FLOAT_R32_NV"/>
@@ -1139,7 +1139,7 @@
       <bitfield name="H" high="31" low="16" type="int"/>
     </reg32>
   </object>
-  <object id="0x005f" name="NV04_IMAGE_BLIT"  parent="0x001f">
+  <object id="0x005f" name="NV04_IMAGE_BLIT" parent="0x001f">
     <!-- XXX: figure out which object is really which -->
     <reg32 offset="0x0190" name="ROP" type="object"/>
     <reg32 offset="0x0198" name="BETA4" type="object"/>
@@ -2684,12 +2684,12 @@
     <reg32 offset="0x01a4" name="DMA_FENCE" type="object"/>
     <reg32 offset="0x01a8" name="DMA_QUERY" type="object"/>
     <reg32 offset="0x0200" name="RT_HORIZ" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int" />
-      <bitfield name="W" high="31" low="16" type="int" />
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
     </reg32>
     <reg32 offset="0x0204" name="RT_VERT" type="bitfield">
-      <bitfield name="Y" high="15" low="0" type="int" />
-      <bitfield name="H" high="31" low="16" type="int" />
+      <bitfield name="Y" high="15" low="0" type="int"/>
+      <bitfield name="H" high="31" low="16" type="int"/>
     </reg32>
     <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
       <bitfield name="TYPE" high="11" low="8" type="enum" enum_name="nv40_rendertarget_type"/>
@@ -3281,9 +3281,7 @@
      <reg32 offset="0x1da4"/>
   </object>
 
-  <object id="0x0397" name="NV30TCL" parent="0x0497"/>
-  <object id="0x0497" name="NV35TCL" parent="0x0697"/>
-  <object id="0x0697" name="NV34TCL">
+  <object name="NVFXTCL" id="0xfa1e3040">
     <reg32 offset="0x0100" name="NOP"/>
     <reg32 offset="0x0104" name="NOTIFY"/>
     <reg32 offset="0x0180" name="DMA_NOTIFY" type="object"/>
@@ -3296,15 +3294,15 @@
     <reg32 offset="0x01a0" name="DMA_VTXBUF1" type="object"/>
     <reg32 offset="0x01a4" name="DMA_FENCE" type="object"/>
     <reg32 offset="0x01a8" name="DMA_QUERY" type="object"/>
-    <reg32 offset="0x01ac" name="DMA_IN_MEMORY7" type="object"/>
-    <reg32 offset="0x01b0" name="DMA_IN_MEMORY8" type="object"/>
+    <reg32 offset="0x01ac" name="DMA_UNK01AC" type="object"/>
+    <reg32 offset="0x01b0" name="DMA_UNK01B0" type="object"/>
     <reg32 offset="0x0200" name="RT_HORIZ" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int" />
-      <bitfield name="W" high="31" low="16" type="int" />
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
     </reg32>
     <reg32 offset="0x0204" name="RT_VERT" type="bitfield">
-      <bitfield name="Y" high="15" low="0" type="int" />
-      <bitfield name="H" high="31" low="16" type="int" />
+      <bitfield name="Y" high="15" low="0" type="int"/>
+      <bitfield name="H" high="31" low="16" type="int"/>
     </reg32>
     <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
       <bitfield name="LOG2_HEIGHT" high="31" low="24" type="int"/>
@@ -3313,10 +3311,7 @@
       <bitfield name="ZETA" high="7" low="5" type="enum" enum_name="nv40_rendertarget_depth_format"/>
       <bitfield name="COLOR" high="4" low="0" type="enum" enum_name="nv40_rendertarget_color_format"/>
     </reg32>
-    <reg32 offset="0x020c" name="COLOR0_PITCH" type="bitfield">
-      <bitfield name="COLOR0" high="15" low="0" type="int"/>
-      <bitfield name="ZETA" high="31" low="16" type="int"/>
-    </reg32>
+    <reg32 offset="0x020c" name="COLOR0_PITCH" type="hexa"/>
     <reg32 offset="0x0210" name="COLOR0_OFFSET" type="hexa"/>
     <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
     <reg32 offset="0x0218" name="COLOR1_OFFSET" type="hexa"/>
@@ -3326,24 +3321,7 @@
       <bitfield name="COLOR1" high="1" low="1" type="boolean"/>
       <bitfield name="COLOR0" high="0" low="0" type="boolean"/>
     </reg32>
-    <reg32 offset="0x022c" name="LMA_DEPTH_PITCH" type="int"/>
-    <reg32 offset="0x0230" name="LMA_DEPTH_OFFSET" type="hexa"/>
-    <reg32 offset="0x0234"/><!-- enable lma ? -->
-    <reg32 offset="0x023c" name="TX_UNITS_ENABLE" type="bitfield">
-      <bitfield name="TX0" high="0" low="0" type="boolean"/>
-      <bitfield name="TX1" high="1" low="1" type="boolean"/>
-      <bitfield name="TX2" high="2" low="2" type="boolean"/>
-      <bitfield name="TX3" high="3" low="3" type="boolean"/>
-      <bitfield name="TX4" high="4" low="4" type="boolean"/>
-      <bitfield name="TX5" high="5" low="5" type="boolean"/>
-      <bitfield name="TX6" high="6" low="6" type="boolean"/>
-      <bitfield name="TX7" high="7" low="7" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x0240" name="TX_MATRIX_ENABLE" size="8" type="boolean"/>
-    <reg32 offset="0x02b8" name="VIEWPORT_TX_ORIGIN" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
+    <reg32 offset="0x0234"/>
     <reg32 offset="0x02bc" name="VIEWPORT_CLIP_MODE"/>
     <reg32 offset="0x02c0" name="VIEWPORT_CLIP_HORIZ" size="8" stride="8" type="bitfield">
       <bitfield name="L" high="15" low="0" type="int"/>
@@ -3354,10 +3332,10 @@
       <bitfield name="D" high="31" low="16" type="int"/>
     </reg32>
     <reg32 offset="0x0300" name="DITHER_ENABLE" type="boolean"/>
-    <reg32 offset="0x0304" name="ALPHA_FUNC_ENABLE" type="boolean"/>
-    <reg32 offset="0x0308" name="ALPHA_FUNC_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x030c" name="ALPHA_FUNC_REF" type="int"/>
-    <reg32 offset="0x0310" name="BLEND_FUNC_ENABLE" type="boolean"/>
+    <reg32 offset="0x0304" name="ALPHA_TEST_ENABLE" type="boolean"/>
+    <reg32 offset="0x0308" name="ALPHA_TEST_FUNC" type="enum" enum_name="gl_comparison_op"/>
+    <reg32 offset="0x030c" name="ALPHA_TEST_REF" type="int"/>
+    <reg32 offset="0x0310" name="BLEND_ENABLE" type="boolean"/>
     <reg32 offset="0x0314" name="BLEND_FUNC_SRC" type="bitfield">
       <bitfield name="RGB" high="15" low="0" type="enum" enum_name="gl_blend_factor"/>
       <bitfield name="ALPHA" high="31" low="16" type="enum" enum_name="gl_blend_factor"/>
@@ -3372,13 +3350,7 @@
       <bitfield name="R" high="23" low="16" type="int"/>
       <bitfield name="A" high="31" low="24" type="int"/>
     </reg32>
-    <reg32 offset="0x0320" name="BLEND_EQUATION" type="enum" enum_name="gl_blend_equation"/>
-    <reg32 offset="0x0324" name="COLOR_MASK" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="boolean"/>
-      <bitfield name="G" high="15" low="8" type="boolean"/>
-      <bitfield name="R" high="23" low="16" type="boolean"/>
-      <bitfield name="A" high="31" low="24" type="boolean"/>
-    </reg32>
+    <reg32 offset="0x0324" name="COLOR_MASK" type="bitfield"/>
     <reg32 offset="0x0328" name="STENCIL_FRONT_ENABLE" type="boolean"/>
     <reg32 offset="0x032c" name="STENCIL_FRONT_MASK" type="int"/>
     <reg32 offset="0x0330" name="STENCIL_FRONT_FUNC_FUNC" type="enum" enum_name="gl_comparison_op"/>
@@ -3396,6 +3368,275 @@
     <reg32 offset="0x0360" name="STENCIL_BACK_OP_ZFAIL" type="enum" enum_name="gl_stencil_op"/>
     <reg32 offset="0x0364" name="STENCIL_BACK_OP_ZPASS" type="enum" enum_name="gl_stencil_op"/>
     <reg32 offset="0x0368" name="SHADE_MODEL" type="enum" enum_name="gl_shade_model"/>
+    <reg32 offset="0x0374" name="COLOR_LOGIC_OP_ENABLE" type="boolean"/>
+    <reg32 offset="0x0378" name="COLOR_LOGIC_OP" type="enum" enum_name="gl_logic_op"/>
+    <reg32 offset="0x0394" name="DEPTH_RANGE_NEAR" type="float"/>
+    <reg32 offset="0x0398" name="DEPTH_RANGE_FAR" type="float"/>
+    <reg32 offset="0x03b0"/>
+    <reg32 offset="0x03b8" name="LINE_WIDTH" type="int"/>
+    <reg32 offset="0x03bc" name="LINE_SMOOTH_ENABLE" type="boolean"/>
+    <reg32 offset="0x08c0" name="SCISSOR_HORIZ" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x08c4" name="SCISSOR_VERT" type="bitfield">
+      <bitfield name="Y" high="15" low="0" type="int"/>
+      <bitfield name="H" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x08cc" name="FOG_MODE"/>
+    <reg32 offset="0x08d0" name="FOG_EQUATION_CONSTANT" type="float"/>
+    <reg32 offset="0x08d4" name="FOG_EQUATION_LINEAR" type="float"/>
+    <reg32 offset="0x08d8" name="FOG_EQUATION_QUADRATIC" type="float"/>
+    <reg32 offset="0x08e4" name="FP_ADDRESS" type="bitfield">
+      <bitfield name="DMA0" high="0" low="0" type="boolean"/>
+      <bitfield name="DMA1" high="1" low="1" type="boolean"/>
+      <bitfield name="OFFSET" high="31" low="2" type="program" program_type="NV30_FP"/>
+    </reg32>
+    <reg32 offset="0x0a00" name="VIEWPORT_HORIZ" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x0a04" name="VIEWPORT_VERT" type="bitfield">
+      <bitfield name="Y" high="15" low="0" type="int"/>
+      <bitfield name="H" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x0a20" name="VIEWPORT_TRANSLATE_X" type="float"/>
+    <reg32 offset="0x0a24" name="VIEWPORT_TRANSLATE_Y" type="float"/>
+    <reg32 offset="0x0a28" name="VIEWPORT_TRANSLATE_Z" type="float"/>
+    <reg32 offset="0x0a2c" name="VIEWPORT_TRANSLATE_W" type="float"/>
+    <reg32 offset="0x0a30" name="VIEWPORT_SCALE_X" type="float"/>
+    <reg32 offset="0x0a34" name="VIEWPORT_SCALE_Y" type="float"/>
+    <reg32 offset="0x0a38" name="VIEWPORT_SCALE_Z" type="float"/>
+    <reg32 offset="0x0a3c" name="VIEWPORT_SCALE_W" type="float"/>
+    <reg32 offset="0x0a60" name="POLYGON_OFFSET_POINT_ENABLE" type="boolean"/>
+    <reg32 offset="0x0a64" name="POLYGON_OFFSET_LINE_ENABLE" type="boolean"/>
+    <reg32 offset="0x0a68" name="POLYGON_OFFSET_FILL_ENABLE" type="boolean"/>
+    <reg32 offset="0x0a6c" name="DEPTH_FUNC" type="enum" enum_name="gl_comparison_op"/>
+    <reg32 offset="0x0a70" name="DEPTH_WRITE_ENABLE" type="boolean"/>
+    <reg32 offset="0x0a74" name="DEPTH_TEST_ENABLE" type="boolean"/>
+    <reg32 offset="0x0a78" name="POLYGON_OFFSET_FACTOR" type="float"/>
+    <reg32 offset="0x0a7c" name="POLYGON_OFFSET_UNITS" type="float"/>
+    <reg32 offset="0x0a80" name="VTX_ATTR_3I_XY" size="16" stride="8" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="Y" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x0a84" name="VTX_ATTR_3I_Z" size="16" stride="8" type="bitfield">
+      <bitfield name="Z" high="15" low="0" type="int"/>
+    </reg32>
+    <reg32 offset="0x0b80" name="VP_UPLOAD_INST" size="4" type="hexa"/>
+    <reg32 offset="0x1428"/>
+    <reg32 offset="0x142c" name="VERTEX_TWO_SIDE_ENABLE" type="boolean"/>
+    <reg32 offset="0x1454"/>
+    <reg32 offset="0x145c"/>
+    <reg32 offset="0x1478" name="CLIP_PLANE_ENABLE" type="bitfield">
+      <bitfield name="PLANE0" high="1" low="1" type="boolean"/>
+      <bitfield name="PLANE1" high="5" low="5" type="boolean"/>
+      <bitfield name="PLANE2" high="9" low="9" type="boolean"/>
+      <bitfield name="PLANE3" high="13" low="13" type="boolean"/>
+      <bitfield name="PLANE4" high="17" low="17" type="boolean"/>
+      <bitfield name="PLANE5" high="21" low="21" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x147c" name="POLYGON_STIPPLE_ENABLE" type="boolean"/>
+    <reg32 offset="0x1480" name="POLYGON_STIPPLE_PATTERN" size="32" type="hexa"/>
+    <reg32 offset="0x1500" name="VTX_ATTR_3F_X" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1504" name="VTX_ATTR_3F_Y" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1508" name="VTX_ATTR_3F_Z" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1680" name="VTXBUF_ADDRESS" size="16" stride="4" type="bitfield">
+      <bitfield name="DMA1" high="31" low="31" type="boolean"/>
+      <bitfield name="OFFSET" high="27" low="0" type="hexa"/>
+    </reg32>
+    <reg32 offset="0x1718"/>
+    <reg32 offset="0x1740" name="VTXFMT" size="16" type="bitfield">
+      <bitfield name="TYPE" high="3" low="0" type="enum" enum_name="nv40_vtxfmt_type"/>
+      <bitfield name="SIZE" high="7" low="4" type="int"/>
+      <bitfield name="STRIDE" high="15" low="8" type="int"/>
+    </reg32>
+    <reg32 offset="0x17c8" name="QUERY_RESET"/>
+    <reg32 offset="0x17cc" name="QUERY_UNK17CC"/>
+    <reg32 offset="0x1800" name="QUERY_GET" type="bitfield">
+      <bitfield name="UNK24" high="31" low="24" type="int"/>
+      <bitfield name="OFFSET" high="23" low="0" type="hexa"/>
+    </reg32>
+    <reg32 offset="0x1808" name="BEGIN_END" type="enum" enum_name="nv10_begin_end"/>
+    <reg32 offset="0x180c" name="VB_ELEMENT_U16" type="bitfield">
+      <bitfield name="I0" high="15" low="0" type="int"/>
+      <bitfield name="I1" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x1810" name="VB_ELEMENT_U32" type="int"/>
+    <reg32 offset="0x1814" name="VB_VERTEX_BATCH" type="bitfield">
+      <bitfield name="OFFSET" high="23" low="0" type="int"/>
+      <bitfield name="COUNT" high="31" low="24" type="int"/>
+    </reg32>
+    <reg32 offset="0x1818" name="VERTEX_DATA" type="float"/>
+    <reg32 offset="0x181c" name="IDXBUF_ADDRESS" type="hexa"/>
+    <reg32 offset="0x1820" name="IDXBUF_FORMAT" type="bitfield">
+      <bitfield name="TYPE" high="7" low="4" type="enum" enum_name="nv40_idxfmt_type"/>
+      <bitfield name="DMA1" high="0" low="0" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x1824" name="VB_INDEX_BATCH" type="bitfield">
+      <bitfield name="COUNT" high="31" low="24" type="int"/>
+      <bitfield name="START" high="23" low="0" type="int"/>
+    </reg32>
+    <reg32 offset="0x1828" name="POLYGON_MODE_FRONT" type="enum" enum_name="gl_polygon_mode"/>
+    <reg32 offset="0x182c" name="POLYGON_MODE_BACK" type="enum" enum_name="gl_polygon_mode"/>
+    <reg32 offset="0x1830" name="CULL_FACE" type="enum" enum_name="gl_cull_face"/>
+    <reg32 offset="0x1834" name="FRONT_FACE" type="enum" enum_name="gl_front_face"/>
+    <reg32 offset="0x1838" name="POLYGON_SMOOTH_ENABLE" type="boolean"/>
+    <reg32 offset="0x183c" name="CULL_FACE_ENABLE" type="boolean"/>
+    <reg32 offset="0x1880" name="VTX_ATTR_2F_X" size="16" stride="8" type="float"/>
+    <reg32 offset="0x1884" name="VTX_ATTR_2F_Y" size="16" stride="8" type="float"/>
+    <reg32 offset="0x1900" name="VTX_ATTR_2I" size="16" stride="4" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="Y" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x1940" name="VTX_ATTR_4UB" size="16" type="bitfield">
+      <bitfield name="X" high="7" low="0" type="int"/>
+      <bitfield name="Y" high="15" low="8" type="int"/>
+      <bitfield name="Z" high="23" low="16" type="int"/>
+      <bitfield name="W" high="31" low="24" type="int"/>
+    </reg32>
+    <reg32 offset="0x1980" name="VTX_ATTR_4I_XY" size="16" stride="8" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="Y" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x1984" name="VTX_ATTR_4I_ZW" size="16" stride="8" type="bitfield">
+      <bitfield name="Z" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x1a00" name="TEX_OFFSET" size="8" stride="32" type="hexa"/>
+    <reg32 offset="0x1a04" name="TEX_FORMAT" type="bitfield" size="16" stride="32">
+      <bitfield name="DMA0" high="0" low="0" type="boolean"/>
+      <bitfield name="DMA1" high="1" low="1" type="boolean"/>
+      <bitfield name="CUBIC" high="2" low="2" type="boolean"/>
+      <bitfield name="NO_BORDER" high="3" low="3" type="boolean"/>
+      <bitfield name="DIMS" high="7" low="4" type="enum" enum_name="nv30_texture_dims"/>
+    </reg32>
+    <reg32 offset="0x1a08" name="TEX_WRAP" type="bitfield" size="16" stride="32">
+      <bitfield name="S" high="3" low="0" type="enum" enum_name="nv40_texture_wrap"/>
+      <bitfield name="T" high="11" low="8" type="enum" enum_name="nv40_texture_wrap"/>
+      <bitfield name="EXPAND_NORMAL" high="15" low="12" type="boolean"/>
+      <bitfield name="R" high="19" low="16" type="enum" enum_name="nv40_texture_wrap"/>
+      <bitfield name="RCOMP" high="31" low="28" type="enum" enum_name="nv40_texture_compare"/>
+    </reg32>
+    <reg32 offset="0x1a0c" name="TEX_ENABLE" type="bitfield" size="16" stride="32"/>
+    <reg32 offset="0x1a10" name="TEX_SWIZZLE" type="bitfield" size="16" stride="32">
+      <bitfield name="S1_W" high="1" low="0" type="enum" enum_name="nv40_texture_swz1"/>
+      <bitfield name="S1_Z" high="3" low="2" type="enum" enum_name="nv40_texture_swz1"/>
+      <bitfield name="S1_Y" high="5" low="4" type="enum" enum_name="nv40_texture_swz1"/>
+      <bitfield name="S1_X" high="7" low="6" type="enum" enum_name="nv40_texture_swz1"/>
+      <bitfield name="S0_W" high="9" low="8" type="enum" enum_name="nv40_texture_swz0"/>
+      <bitfield name="S0_Z" high="11" low="10" type="enum" enum_name="nv40_texture_swz0"/>
+      <bitfield name="S0_Y" high="13" low="12" type="enum" enum_name="nv40_texture_swz0"/>
+      <bitfield name="S0_X" high="15" low="14" type="enum" enum_name="nv40_texture_swz0"/>
+    </reg32>
+    <reg32 offset="0x1a14" name="TEX_FILTER" type="bitfield" size="16" stride="32">
+      <bitfield name="MIN" high="19" low="16" type="enum" enum_name="nv04_tx_min_filter"/>
+      <bitfield name="MAG" high="27" low="24" type="enum" enum_name="nv04_tx_mag_filter"/>
+      <bitfield name="SIGNED_BLUE" high="28" low="28" type="boolean"/>
+      <bitfield name="SIGNED_GREEN" high="29" low="29" type="boolean"/>
+      <bitfield name="SIGNED_RED" high="30" low="30" type="boolean"/>
+      <bitfield name="SIGNED_ALPHA" high="31" low="31" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x1a18" name="TEX_SIZE0" size="8" stride="32" type="bitfield">
+      <bitfield name="H" high="15" low="0" type="int"/>
+      <bitfield name="W" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x1a1c" name="TEX_BORDER_COLOR" size="8" stride="32" type="bitfield">
+      <bitfield name="B" high="7" low="0" type="int"/>
+      <bitfield name="G" high="15" low="8" type="int"/>
+      <bitfield name="R" high="23" low="16" type="int"/>
+      <bitfield name="A" high="31" low="24" type="int"/>
+    </reg32>
+    <reg32 offset="0x1c00" name="VTX_ATTR_4F_X" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1c04" name="VTX_ATTR_4F_Y" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1c08" name="VTX_ATTR_4F_Z" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1c0c" name="VTX_ATTR_4F_W" size="16" stride="16" type="float"/>
+    <reg32 offset="0x1d60" name="FP_CONTROL" type="bitfield"/>
+    <reg32 offset="0x1d7c" name="MULTISAMPLE_CONTROL" type="bitfield">
+      <bitfield name="ENABLE" high="0" low="0" type="boolean"/>
+      <bitfield name="SAMPLE_ALPHA_TO_COVERAGE" high="4" low="4" type="boolean"/>
+      <bitfield name="SAMPLE_ALPHA_TO_ONE" high="8" low="8" type="boolean"/>
+      <bitfield name="SAMPLE_COVERAGE" high="31" low="16" type="hexa"/>
+    </reg32>
+    <reg32 offset="0x1d80"/>
+    <reg32 offset="0x1d84"/>
+    <reg32 offset="0x1d88"/>
+    <reg32 offset="0x1d8c" name="CLEAR_VALUE_DEPTH"/>
+    <reg32 offset="0x1d90" name="CLEAR_VALUE_COLOR" type="bitfield">
+      <bitfield name="B" high="7" low="0" type="int"/>
+      <bitfield name="G" high="15" low="8" type="int"/>
+      <bitfield name="R" high="23" low="16" type="int"/>
+      <bitfield name="A" high="31" low="24" type="int"/>
+    </reg32>
+    <reg32 offset="0x1d94" name="CLEAR_BUFFERS" type="bitfield">
+      <bitfield name="COLOR_A" high="7" low="7" type="boolean"/>
+      <bitfield name="COLOR_B" high="6" low="6" type="boolean"/>
+      <bitfield name="COLOR_G" high="5" low="5" type="boolean"/>
+      <bitfield name="COLOR_R" high="4" low="4" type="boolean"/>
+      <bitfield name="STENCIL" high="1" low="1" type="boolean"/>
+      <bitfield name="DEPTH" high="0" low="0" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x1da4"/>
+    <reg32 offset="0x1db4" name="LINE_STIPPLE_ENABLE" type="boolean"/>
+    <reg32 offset="0x1db8" name="LINE_STIPPLE_PATTERN" type="bitfield">
+      <bitfield name="FACTOR" high="15" low="0" type="int"/>
+      <bitfield name="PATTERN" high="31" low="16" type="hexa"/>
+    </reg32>
+    <reg32 offset="0x1e40" name="VTX_ATTR_1F" size="16" type="float"/>
+    <reg32 offset="0x1e9c" name="VP_UPLOAD_FROM_ID" type="hexa"/>
+    <reg32 offset="0x1ea0" name="VP_START_FROM_ID" type="hexa"/>
+    <reg32 offset="0x1ee0" name="POINT_SIZE" type="float"/>
+    <reg32 offset="0x1ee8" name="POINT_SPRITE" type="bitfield">
+      <bitfield high="0" low="0" name="ENABLE" type="boolean"/>
+      <bitfield enum_name="nv20_point_sprite_r_mode" high="2" low="1" name="R_MODE" type="enum"/>
+      <bitfield high="8" low="8" name="COORD_REPLACE_0" type="boolean"/>
+      <bitfield high="9" low="9" name="COORD_REPLACE_1" type="boolean"/>
+      <bitfield high="10" low="10" name="COORD_REPLACE_2" type="boolean"/>
+      <bitfield high="11" low="11" name="COORD_REPLACE_3" type="boolean"/>
+      <bitfield high="12" low="12" name="COORD_REPLACE_4" type="boolean"/>
+      <bitfield high="13" low="13" name="COORD_REPLACE_5" type="boolean"/>
+      <bitfield high="14" low="14" name="COORD_REPLACE_6" type="boolean"/>
+      <bitfield high="15" low="15" name="COORD_REPLACE_7" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x1efc" name="VP_UPLOAD_CONST_ID" type="hexa"/>
+    <reg32 offset="0x1f00" name="VP_UPLOAD_CONST_X" size="4" stride="16" type="float"/>
+    <reg32 offset="0x1f04" name="VP_UPLOAD_CONST_Y" size="4" stride="16" type="float"/>
+    <reg32 offset="0x1f08" name="VP_UPLOAD_CONST_Z" size="4" stride="16" type="float"/>
+    <reg32 offset="0x1f0c" name="VP_UPLOAD_CONST_W" size="4" stride="16" type="float"/>
+    </object>
+
+  <object id="0x0397" name="NV30TCL" parent="0x0497"/>
+  <object id="0x0497" name="NV35TCL" parent="0x0697"/>
+  <object id="0x0697" name="NV34TCL">
+    <reg32 offset="0x020c" name="COLOR0_PITCH" type="bitfield">
+      <bitfield name="COLOR0" high="15" low="0" type="int"/>
+      <bitfield name="ZETA" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x022c" name="LMA_DEPTH_PITCH" type="int"/>
+    <reg32 offset="0x0230" name="LMA_DEPTH_OFFSET" type="hexa"/>
+    <!-- enable lma ? -->
+    <reg32 offset="0x023c" name="TX_UNITS_ENABLE" type="bitfield">
+      <bitfield name="TX0" high="0" low="0" type="boolean"/>
+      <bitfield name="TX1" high="1" low="1" type="boolean"/>
+      <bitfield name="TX2" high="2" low="2" type="boolean"/>
+      <bitfield name="TX3" high="3" low="3" type="boolean"/>
+      <bitfield name="TX4" high="4" low="4" type="boolean"/>
+      <bitfield name="TX5" high="5" low="5" type="boolean"/>
+      <bitfield name="TX6" high="6" low="6" type="boolean"/>
+      <bitfield name="TX7" high="7" low="7" type="boolean"/>
+    </reg32>
+    <reg32 offset="0x0240" name="TX_MATRIX_ENABLE" size="8" type="boolean"/>
+    <reg32 offset="0x02b8" name="VIEWPORT_TX_ORIGIN" type="bitfield">
+      <bitfield name="X" high="15" low="0" type="int"/>
+      <bitfield name="Y" high="31" low="16" type="int"/>
+    </reg32>
+    <reg32 offset="0x0320" name="BLEND_EQUATION" type="enum" enum_name="gl_blend_equation"/>
+    <reg32 offset="0x0324" name="COLOR_MASK" type="bitfield">
+      <bitfield name="B" high="7" low="0" type="boolean"/>
+      <bitfield name="G" high="15" low="8" type="boolean"/>
+      <bitfield name="R" high="23" low="16" type="boolean"/>
+      <bitfield name="A" high="31" low="24" type="boolean"/>
+    </reg32>
     <reg32 offset="0x036c" name="FOG_ENABLE" type="boolean"/>
     <reg32 offset="0x0370" name="FOG_COLOR" type="bitfield">
       <bitfield name="R" high="7" low="0" type="int"/>
@@ -3403,8 +3644,6 @@
       <bitfield name="B" high="23" low="16" type="int"/>
       <bitfield name="A" high="31" low="24" type="int"/>
     </reg32>
-    <reg32 offset="0x0374" name="COLOR_LOGIC_OP_ENABLE" type="boolean"/>
-    <reg32 offset="0x0378" name="COLOR_LOGIC_OP_OP" type="enum" enum_name="gl_logic_op"/>
     <reg32 offset="0x037c" name="NORMALIZE_ENABLE" type="boolean"/>
     <!-- <reg32 offset="0x0380" name="LINE_WIDTH" type="float"/> -->
     <reg32 offset="0x0390" name="COLOR_MATERIAL" type="bitfield">
@@ -3417,15 +3656,11 @@
       <bitfield name="BACK_DIFFUSE_ENABLE" high="12" low="12" type="boolean"/>
       <bitfield name="BACK_SPECULAR_ENABLE" high="14" low="14" type="boolean"/>
     </reg32>
-    <reg32 offset="0x0394" name="DEPTH_RANGE_NEAR" type="float"/>
-    <reg32 offset="0x0398" name="DEPTH_RANGE_FAR" type="float"/>
     <reg32 offset="0x03a0" name="COLOR_MATERIAL_FRONT_R" type="float"/>
     <reg32 offset="0x03a4" name="COLOR_MATERIAL_FRONT_G" type="float"/>
     <reg32 offset="0x03a8" name="COLOR_MATERIAL_FRONT_B" type="float"/>
-    <reg32 offset="0x03b0"/><!-- related to point sprite/point parameter -->
+    <!-- related to point sprite/point parameter -->
     <reg32 offset="0x03b4" name="COLOR_MATERIAL_FRONT_A" type="float"/>
-    <reg32 offset="0x03b8" name="LINE_WIDTH" type="int"/>
-    <reg32 offset="0x03bc" name="LINE_SMOOTH_ENABLE" type="boolean"/>
     <reg32 offset="0x0400" name="TX_GEN_S" size="8" stride="16" type="enum" enum_name="gl_texgen_mode"/>
     <reg32 offset="0x0404" name="TX_GEN_T" size="8" stride="16" type="enum" enum_name="gl_texgen_mode"/>
     <reg32 offset="0x0408" name="TX_GEN_R" size="8" stride="16" type="enum" enum_name="gl_texgen_mode"/>
@@ -3441,24 +3676,7 @@
     <reg32 offset="0x0800" name="TX5_MATRIX" size="16" type="float"/>
     <reg32 offset="0x0840" name="TX6_MATRIX" size="16" type="float"/>
     <reg32 offset="0x0880" name="TX7_MATRIX" size="16" type="float"/>
-    <reg32 offset="0x08c0" name="SCISSOR_HORIZ" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x08c4" name="SCISSOR_VERT" type="bitfield">
-      <bitfield name="Y" high="15" low="0" type="int"/>
-      <bitfield name="H" high="31" low="16" type="int"/>
-    </reg32>
     <reg32 offset="0x08c8" name="FOG_COORD_DIST"/>
-    <reg32 offset="0x08cc" name="FOG_MODE"/>
-    <reg32 offset="0x08d0" name="FOG_EQUATION_CONSTANT" type="float"/>
-    <reg32 offset="0x08d4" name="FOG_EQUATION_LINEAR" type="float"/>
-    <reg32 offset="0x08d8" name="FOG_EQUATION_QUADRATIC" type="float"/>
-    <reg32 offset="0x08e4" name="FP_ACTIVE_PROGRAM" type="bitfield">
-      <bitfield name="DMA0" high="0" low="0" type="boolean"/>
-      <bitfield name="DMA1" high="1" low="1" type="boolean"/>
-      <bitfield name="OFFSET" high="31" low="2" type="program" program_type="NV30_FP"/>
-    </reg32>
     <reg32 offset="0x08ec" name="RC_COLOR0" type="bitfield">
       <bitfield name="B" high="7" low="0" type="int"/>
       <bitfield name="G" high="15" low="8" type="int"/>
@@ -3563,42 +3781,10 @@
       <bitfield name="SCALE" high="16" low="17" type="enum" enum_name="nv10_rc_scale"/>
     </reg32>
     <reg32 offset="0x0918"/>
-    <reg32 offset="0x0a00" name="VIEWPORT_HORIZ" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x0a04" name="VIEWPORT_VERT" type="bitfield">
-      <bitfield name="Y" high="15" low="0" type="int"/>
-      <bitfield name="H" high="31" low="16" type="int"/>
-    </reg32>
     <reg32 offset="0x0a10" name="LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_R" type="float"/>
     <reg32 offset="0x0a14" name="LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_G" type="float"/>
     <reg32 offset="0x0a18" name="LIGHT_MODEL_FRONT_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_B" type="float"/>
-    <reg32 offset="0x0a20" name="VIEWPORT_TRANSLATE_X" type="float"/>
-    <reg32 offset="0x0a24" name="VIEWPORT_TRANSLATE_Y" type="float"/>
-    <reg32 offset="0x0a28" name="VIEWPORT_TRANSLATE_Z" type="float"/>
-    <reg32 offset="0x0a2c" name="VIEWPORT_TRANSLATE_W" type="float"/>
-    <reg32 offset="0x0a30" name="VIEWPORT_SCALE_X" type="float"/>
-    <reg32 offset="0x0a34" name="VIEWPORT_SCALE_Y" type="float"/>
-    <reg32 offset="0x0a38" name="VIEWPORT_SCALE_Z" type="float"/>
-    <reg32 offset="0x0a3c" name="VIEWPORT_SCALE_W" type="float"/>
-    <reg32 offset="0x0a60" name="POLYGON_OFFSET_POINT_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a64" name="POLYGON_OFFSET_LINE_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a68" name="POLYGON_OFFSET_FILL_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a6c" name="DEPTH_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x0a70" name="DEPTH_WRITE_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a74" name="DEPTH_TEST_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a78" name="POLYGON_OFFSET_FACTOR" type="float"/>
-    <reg32 offset="0x0a7c" name="POLYGON_OFFSET_UNITS" type="float"/>
-    <reg32 offset="0x0a80" name="VTX_ATTR_3I_XY" size="16" stride="8" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x0a84" name="VTX_ATTR_3I_Z" size="16" stride="8" type="bitfield">
-      <bitfield name="Z" high="15" low="0" type="int"/>
-    </reg32>
     <reg32 offset="0x0b00" size="4" type="hexa"/><!-- related to tx units, disable/enable tx shader? -->
-    <reg32 offset="0x0b80" name="VP_UPLOAD_INST" size="4" type="hexa"/>
     <reg32 offset="0x0e00" name="TX0_CLIP_PLANE_A" size="4" stride="16" type="float"/>
     <reg32 offset="0x0e04" name="TX0_CLIP_PLANE_B" size="4" stride="16" type="float"/>
     <reg32 offset="0x0e08" name="TX0_CLIP_PLANE_C" size="4" stride="16" type="float"/>
@@ -3663,45 +3849,18 @@
     <reg32 offset="0x1400" name="FRONT_MATERIAL_SHININESS" size="6" type="float"/>
     <reg32 offset="0x1420" name="ENABLED_LIGHTS"/>
     <reg32 offset="0x1424"/>
-    <reg32 offset="0x1428"/>
-    <reg32 offset="0x142c" name="VERTEX_TWO_SIDE_ENABLE" type="boolean"/>
     <reg32 offset="0x1430"/>
     <reg32 offset="0x1434"/>
     <reg32 offset="0x1450" name="FP_REG_CONTROL" type="bitfield">
       <bitfield name="UNK1" high="31" low="16" type="int"/>
       <bitfield name="UNK0" high="15" low="0" type="int"/>
     </reg32>
-    <reg32 offset="0x1454"/>
     <reg32 offset="0x1458"/>
-    <reg32 offset="0x145c"/>
-    <reg32 offset="0x1478" name="VP_CLIP_PLANES_ENABLE" type="bitfield">
-      <bitfield name="PLANE0" high="1" low="1" type="boolean"/>
-      <bitfield name="PLANE1" high="5" low="5" type="boolean"/>
-      <bitfield name="PLANE2" high="9" low="9" type="boolean"/>
-      <bitfield name="PLANE3" high="13" low="13" type="boolean"/>
-      <bitfield name="PLANE4" high="17" low="17" type="boolean"/>
-      <bitfield name="PLANE5" high="21" low="21" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x147c" name="POLYGON_STIPPLE_ENABLE" type="boolean"/>
-    <reg32 offset="0x1480" name="POLYGON_STIPPLE_PATTERN" size="32" type="hexa"/>
-    <reg32 offset="0x1500" name="VTX_ATTR_3F_X" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1504" name="VTX_ATTR_3F_Y" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1508" name="VTX_ATTR_3F_Z" size="16" stride="16" type="float"/>
     <reg32 offset="0x1600" name="VP_CLIP_PLANE_A" size="6" stride="16" type="float"/>
     <reg32 offset="0x1604" name="VP_CLIP_PLANE_B" size="6" stride="16" type="float"/>
     <reg32 offset="0x1608" name="VP_CLIP_PLANE_C" size="6" stride="16" type="float"/>
     <reg32 offset="0x160c" name="VP_CLIP_PLANE_D" size="6" stride="16" type="float"/>
-    <reg32 offset="0x1680" name="VTXBUF_ADDRESS" size="16" stride="4" type="bitfield">
-      <bitfield name="DMA1" high="31" low="31" type="boolean"/>
-      <bitfield name="OFFSET" high="27" low="0" type="hexa"/>
-    </reg32>
     <reg32 offset="0x1710"/>
-    <reg32 offset="0x1718"/>
-    <reg32 offset="0x1740" name="VTXFMT" size="16" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="enum" enum_name="nv40_vtxfmt_type"/>
-      <bitfield name="SIZE" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
     <reg32 offset="0x17a0" name="LIGHT_MODEL_BACK_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_R" type="float"/>
     <reg32 offset="0x17a4" name="LIGHT_MODEL_BACK_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_G" type="float"/>
     <reg32 offset="0x17a8" name="LIGHT_MODEL_BACK_SIDE_PRODUCT_AMBIENT_PLUS_EMISSION_B" type="float"/>
@@ -3709,66 +3868,13 @@
     <reg32 offset="0x17b4" name="COLOR_MATERIAL_BACK_G" type="float"/>
     <reg32 offset="0x17b8" name="COLOR_MATERIAL_BACK_B" type="float"/>
     <reg32 offset="0x17c0" name="COLOR_MATERIAL_BACK_A" type="float"/>
-    <reg32 offset="0x17c8" name="QUERY_RESET"/>
-    <reg32 offset="0x17cc" name="QUERY_UNK17CC"/>
     <reg32 offset="0x17e0" type="float"/>
     <reg32 offset="0x17e4" type="float"/>
     <reg32 offset="0x17e8" type="float"/>
-    <reg32 offset="0x1800" name="QUERY_GET" type="bitfield">
-      <bitfield name="UNK24" high="31" low="24" type="int"/>
-      <bitfield name="OFFSET" high="23" low="0" type="hexa"/>
-    </reg32>
-    <reg32 offset="0x1808" name="VERTEX_BEGIN_END" type="enum" enum_name="nv10_begin_end"/>
-    <reg32 offset="0x180c" name="VB_ELEMENT_U16" type="bitfield">
-      <bitfield name="I0" high="15" low="0" type="int"/>
-      <bitfield name="I1" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1810" name="VB_ELEMENT_U32" type="int"/>
-    <reg32 offset="0x1814" name="VB_VERTEX_BATCH" type="bitfield">
-      <bitfield name="OFFSET" high="23" low="0" type="int"/>
-      <bitfield name="COUNT" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1818" name="VERTEX_DATA" type="float"/>
-    <reg32 offset="0x181c" name="IDXBUF_ADDRESS" type="hexa"/>
-    <reg32 offset="0x1820" name="IDXBUF_FORMAT" type="bitfield">
-      <bitfield name="TYPE" high="7" low="4" type="enum" enum_name="nv40_idxfmt_type"/>
-      <bitfield name="DMA1" high="0" low="0" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x1824" name="VB_INDEX_BATCH" type="bitfield">
-      <bitfield name="COUNT" high="31" low="24" type="int"/>
-      <bitfield name="START" high="23" low="0" type="int"/>
-    </reg32>
-    <reg32 offset="0x1828" name="POLYGON_MODE_FRONT" type="enum" enum_name="gl_polygon_mode"/>
-    <reg32 offset="0x182c" name="POLYGON_MODE_BACK" type="enum" enum_name="gl_polygon_mode"/>
-    <reg32 offset="0x1830" name="CULL_FACE" type="enum" enum_name="gl_cull_face"/>
-    <reg32 offset="0x1834" name="FRONT_FACE" type="enum" enum_name="gl_front_face"/>
-    <reg32 offset="0x1838" name="POLYGON_SMOOTH_ENABLE" type="boolean"/>
-    <reg32 offset="0x183c" name="CULL_FACE_ENABLE" type="boolean"/>
     <reg32 offset="0x1840" name="TX_PALETTE_OFFSET" size="8" type="hexa"/>
-    <reg32 offset="0x1880" name="VTX_ATTR_2F_X" size="16" stride="8" type="float"/>
-    <reg32 offset="0x1884" name="VTX_ATTR_2F_Y" size="16" stride="8" type="float"/>
-    <reg32 offset="0x1900" name="VTX_ATTR_2I" size="16" stride="4" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1940" name="VTX_ATTR_4UB" size="16" type="bitfield">
-      <bitfield name="X" high="7" low="0" type="int"/>
-      <bitfield name="Y" high="15" low="8" type="int"/>
-      <bitfield name="Z" high="23" low="16" type="int"/>
-      <bitfield name="W" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1980" name="VTX_ATTR_4I_XY" size="16" stride="8" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1984" name="VTX_ATTR_4I_ZW" size="16" stride="8" type="bitfield">
-      <bitfield name="Z" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
     <!-- Some NV30 (highend) appear to have 8 texture units, whereas lowend ones may have only 4
 	 We should check whether this is a hw limit, or a limit set by sw (all nv3x having 8 tx units
 	 in this case). -->
-    <reg32 offset="0x1a00" name="TX_OFFSET" size="8" stride="32" type="hexa"/>
     <reg32 offset="0x1a04" name="TX_FORMAT" size="8" stride="32" type="bitfield">
       <bitfield name="DMA0" high="0" low="0" type="boolean"/>
       <bitfield name="DMA1" high="1" low="1" type="boolean"/>
@@ -3814,20 +3920,6 @@
       <bitfield name="SIGNED_RED" high="30" low="30" type="boolean"/>
       <bitfield name="SIGNED_ALPHA" high="31" low="31" type="boolean"/>
     </reg32>
-    <reg32 offset="0x1a18" name="TX_NPOT_SIZE" size="8" stride="32" type="bitfield">
-      <bitfield name="H" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1a1c" name="TX_BORDER_COLOR" size="8" stride="32" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="int"/>
-      <bitfield name="G" high="15" low="8" type="int"/>
-      <bitfield name="R" high="23" low="16" type="int"/>
-      <bitfield name="A" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1c00" name="VTX_ATTR_4F_X" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c04" name="VTX_ATTR_4F_Y" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c08" name="VTX_ATTR_4F_Z" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c0c" name="VTX_ATTR_4F_W" size="16" stride="16" type="float"/>
     <reg32 offset="0x1d60" name="FP_CONTROL" type="bitfield">
       <bitfield name="USES_KIL" high="7" low="7" type="boolean"/>
       <bitfield name="USED_REGS_MINUS1_DIV2" high="3" low="0" type="int"/>
@@ -3835,40 +3927,9 @@
     <reg32 offset="0x1d78" name="DEPTH_UNK17D8" type="bitfield">
       <bitfield name="CLAMP" high="7" low="4" type="boolean"/>
     </reg32>
-    <reg32 offset="0x1d7c" name="MULTISAMPLE_CONTROL" type="bitfield">
-      <bitfield name="ENABLE" high="0" low="0" type="boolean"/>
-      <bitfield name="SAMPLE_ALPHA_TO_COVERAGE" high="4" low="4" type="boolean"/>
-      <bitfield name="SAMPLE_ALPHA_TO_ONE" high="8" low="8" type="boolean"/>
-      <bitfield name="SAMPLE_COVERAGE" high="31" low="16" type="hexa"/>
-    </reg32>
-    <reg32 offset="0x1d80"/>
-    <reg32 offset="0x1d84"/>
-    <reg32 offset="0x1d88"/>
-    <reg32 offset="0x1d8c" name="CLEAR_DEPTH_VALUE"/>
-    <reg32 offset="0x1d90" name="CLEAR_COLOR_VALUE" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="int"/>
-      <bitfield name="G" high="15" low="8" type="int"/>
-      <bitfield name="R" high="23" low="16" type="int"/>
-      <bitfield name="A" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1d94" name="CLEAR_BUFFERS" type="bitfield">
-      <bitfield name="COLOR_A" high="7" low="7" type="boolean"/>
-      <bitfield name="COLOR_B" high="6" low="6" type="boolean"/>
-      <bitfield name="COLOR_G" high="5" low="5" type="boolean"/>
-      <bitfield name="COLOR_R" high="4" low="4" type="boolean"/>
-      <bitfield name="STENCIL" high="1" low="1" type="boolean"/>
-      <bitfield name="DEPTH" high="0" low="0" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x1da4"/>
     <reg32 offset="0x1dac" name="DO_VERTICES"/><!-- hum, nv_texture_shader shows something else with 0x1db0 -->
     <reg32 offset="0x1db0"/>
-    <reg32 offset="0x1db4" name="LINE_STIPPLE_ENABLE" type="boolean"/>
-    <reg32 offset="0x1db8" name="LINE_STIPPLE_PATTERN" type="bitfield">
-      <bitfield name="FACTOR" high="15" low="0" type="int"/>
-      <bitfield name="PATTERN" high="31" low="16" type="hexa"/>
-    </reg32>
     <reg32 offset="0x1e20" name="BACK_MATERIAL_SHININESS" size="6" type="float"/>
-    <reg32 offset="0x1e40" name="VTX_ATTR_1F" size="16" type="float"/>
     <reg32 offset="0x1e94" name="ENGINE" type="bitfield">
       <bitfield name="FP" high="0" low="0" type="boolean"/>
       <bitfield name="VP" high="1" low="1" type="boolean"/>
@@ -3876,72 +3937,19 @@
       <!-- bit 4: ???, or FP if not bit 0 -->
       <!-- bit 8: ???, used with multisample enabled, draw pixels, logic op -->
     </reg32>
-    <reg32 offset="0x1e9c" name="VP_UPLOAD_FROM_ID" type="hexa"/>
-    <reg32 offset="0x1ea0" name="VP_START_FROM_ID" type="hexa"/>
     <reg32 offset="0x1ec0" name="POINT_PARAMETERS" size="8" type="float"/>
-    <reg32 offset="0x1ee0" name="POINT_SIZE" type="float"/>
     <reg32 offset="0x1ee4" name="POINT_PARAMETERS_ENABLE" type="boolean"/>
-    <reg32 offset="0x1ee8" name="POINT_SPRITE" type="bitfield">
-      <bitfield high="0" low="0" name="ENABLE" type="boolean" />
-      <bitfield enum_name="nv20_point_sprite_r_mode" high="2" low="1" name="R_MODE" type="enum" />
-      <bitfield high="8" low="8" name="COORD_REPLACE_0" type="boolean" />
-      <bitfield high="9" low="9" name="COORD_REPLACE_1" type="boolean" />
-      <bitfield high="10" low="10" name="COORD_REPLACE_2" type="boolean" />
-      <bitfield high="11" low="11" name="COORD_REPLACE_3" type="boolean" />
-      <bitfield high="12" low="12" name="COORD_REPLACE_4" type="boolean" />
-      <bitfield high="13" low="13" name="COORD_REPLACE_5" type="boolean" />
-      <bitfield high="14" low="14" name="COORD_REPLACE_6" type="boolean" />
-      <bitfield high="15" low="15" name="COORD_REPLACE_7" type="boolean" />
-    </reg32>
-    <reg32 offset="0x1efc" name="VP_UPLOAD_CONST_ID" type="hexa"/>
-    <reg32 offset="0x1f00" name="VP_UPLOAD_CONST_X" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f04" name="VP_UPLOAD_CONST_Y" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f08" name="VP_UPLOAD_CONST_Z" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f0c" name="VP_UPLOAD_CONST_W" size="4" stride="16" type="float"/>
     <reg32 offset="0x1f80" name="UNK1f80" size="16"/>
-  </object>
+    </object>
 
   <object id="0x4097" name="NV40TCL">
     <reg32 offset="0x0050" name="REF_CNT" type="hexa"/><!-- Hum, isn't it a software method ? -->
-    <reg32 offset="0x0100" name="NOP"/>
-    <reg32 offset="0x0104" name="NOTIFY"/>
     <reg32 offset="0x0120"/>
     <reg32 offset="0x0124"/>
     <reg32 offset="0x0128"/>
-    <reg32 offset="0x0180" name="DMA_NOTIFY" type="object"/>
-    <reg32 offset="0x0184" name="DMA_TEXTURE0" type="object"/>
-    <reg32 offset="0x0188" name="DMA_TEXTURE1" type="object"/>
-    <reg32 offset="0x018c" name="DMA_COLOR1" type="object"/>
-    <reg32 offset="0x0194" name="DMA_COLOR0" type="object"/>
-    <reg32 offset="0x0198" name="DMA_ZETA" type="object"/>
-    <reg32 offset="0x019c" name="DMA_VTXBUF0" type="object"/>
-    <reg32 offset="0x01a0" name="DMA_VTXBUF1" type="object"/>
-    <reg32 offset="0x01a4" name="DMA_FENCE" type="object"/>
-    <reg32 offset="0x01a8" name="DMA_QUERY" type="object"/>
-    <reg32 offset="0x01ac" name="DMA_UNK01AC" type="object"/>
-    <reg32 offset="0x01b0" name="DMA_UNK01B0" type="object"/>
     <reg32 offset="0x01b4" name="DMA_COLOR2" type="object"/>
     <reg32 offset="0x01b8" name="DMA_COLOR3" type="object"/>
-    <reg32 offset="0x0200" name="RT_HORIZ" type="bitfield">
-      <bitfield name="W" high="31" low="16" type="int" />
-      <bitfield name="X" high="15" low="0" type="int" />
-    </reg32>
-    <reg32 offset="0x0204" name="RT_VERT" type="bitfield">
-      <bitfield name="H" high="31" low="16" type="int" />
-      <bitfield name="Y" high="15" low="0" type="int" />
-    </reg32>
-    <reg32 offset="0x0208" name="RT_FORMAT" type="bitfield">
-      <bitfield name="LOG2_HEIGHT" high="31" low="24" type="int"/>
-      <bitfield name="LOG2_WIDTH" high="23" low="16" type="int"/>
-      <bitfield name="TYPE" high="11" low="8" type="enum" enum_name="nv40_rendertarget_type"/>
-      <bitfield name="ZETA" high="7" low="5" type="enum" enum_name="nv40_rendertarget_depth_format"/>
-      <bitfield name="COLOR" high="4" low="0" type="enum" enum_name="nv40_rendertarget_color_format"/>
-    </reg32>
     <reg32 offset="0x020c" name="COLOR0_PITCH" type="int"/>
-    <reg32 offset="0x0210" name="COLOR0_OFFSET" type="hexa"/>
-    <reg32 offset="0x0214" name="ZETA_OFFSET" type="hexa"/>
-    <reg32 offset="0x0218" name="COLOR1_OFFSET" type="hexa"/>
-    <reg32 offset="0x021c" name="COLOR1_PITCH" type="int"/>
     <reg32 offset="0x0220" name="RT_ENABLE" type="bitfield">
       <bitfield name="MRT" high="4" low="4" type="boolean"/>
       <bitfield name="COLOR3" high="3" low="3" type="boolean"/>
@@ -3950,7 +3958,6 @@
       <bitfield name="COLOR0" high="0" low="0" type="boolean"/>
     </reg32>
     <reg32 offset="0x022c" name="ZETA_PITCH" type="int"/>
-    <reg32 offset="0x0234"/>
     <reg32 offset="0x0240"/>
     <reg32 offset="0x0244"/>
     <reg32 offset="0x0248"/>
@@ -3960,28 +3967,6 @@
     <reg32 offset="0x0288" name="COLOR2_OFFSET" type="hexa"/>
     <reg32 offset="0x028c" name="COLOR3_OFFSET" type="hexa"/>
     <reg32 offset="0x02b8"/>
-    <reg32 offset="0x02bc"/>
-    <reg32 offset="0x02c0" name="VIEWPORT_CLIP_HORIZ" size="8" stride="8"/>
-    <reg32 offset="0x02c4" name="VIEWPORT_CLIP_VERT" size="8" stride="8"/>
-    <reg32 offset="0x0300" name="DITHER_ENABLE" type="boolean"/>
-    <reg32 offset="0x0304" name="ALPHA_TEST_ENABLE" type="boolean"/>
-    <reg32 offset="0x0308" name="ALPHA_TEST_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x030c" name="ALPHA_TEST_REF" type="int"/>
-    <reg32 offset="0x0310" name="BLEND_ENABLE" type="boolean"/>
-    <reg32 offset="0x0314" name="BLEND_FUNC_SRC" type="bitfield">
-      <bitfield name="RGB" high="15" low="0" type="enum" enum_name="gl_blend_factor"/>
-      <bitfield name="ALPHA" high="31" low="16" type="enum" enum_name="gl_blend_factor"/>
-    </reg32>
-    <reg32 offset="0x0318" name="BLEND_FUNC_DST" type="bitfield">
-      <bitfield name="RGB" high="15" low="0" type="enum" enum_name="gl_blend_factor"/>
-      <bitfield name="ALPHA" high="31" low="16" type="enum" enum_name="gl_blend_factor"/>
-    </reg32>
-    <reg32 offset="0x031c" name="BLEND_COLOR" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="int"/>
-      <bitfield name="G" high="15" low="8" type="int"/>
-      <bitfield name="R" high="23" low="16" type="int"/>
-      <bitfield name="A" high="31" low="24" type="int"/>
-    </reg32>
     <reg32 offset="0x0320" name="BLEND_EQUATION" type="bitfield">
       <bitfield name="RGB" high="15" low="0" type="enum" enum_name="gl_blend_equation"/>
       <bitfield name="ALPHA" high="31" low="16" type="enum" enum_name="gl_blend_equation"/>
@@ -3992,23 +3977,6 @@
       <bitfield name="BUFFER0_R" high="23" low="16" type="boolean"/>
       <bitfield name="BUFFER0_A" high="31" low="24" type="boolean"/>
     </reg32>
-    <reg32 offset="0x0328" name="STENCIL_FRONT_ENABLE" type="boolean"/>
-    <reg32 offset="0x032c" name="STENCIL_FRONT_MASK" type="int"/>
-    <reg32 offset="0x0330" name="STENCIL_FRONT_FUNC_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x0334" name="STENCIL_FRONT_FUNC_REF" type="int"/>
-    <reg32 offset="0x0338" name="STENCIL_FRONT_FUNC_MASK" type="int"/>
-    <reg32 offset="0x033c" name="STENCIL_FRONT_OP_FAIL" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0340" name="STENCIL_FRONT_OP_ZFAIL" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0344" name="STENCIL_FRONT_OP_ZPASS" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0348" name="STENCIL_BACK_ENABLE" type="boolean"/>
-    <reg32 offset="0x034c" name="STENCIL_BACK_MASK" type="int"/>
-    <reg32 offset="0x0350" name="STENCIL_BACK_FUNC_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x0354" name="STENCIL_BACK_FUNC_REF" type="int"/>
-    <reg32 offset="0x0358" name="STENCIL_BACK_FUNC_MASK" type="int"/>
-    <reg32 offset="0x035c" name="STENCIL_BACK_OP_FAIL" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0360" name="STENCIL_BACK_OP_ZFAIL" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0364" name="STENCIL_BACK_OP_ZPASS" type="enum" enum_name="gl_stencil_op"/>
-    <reg32 offset="0x0368" name="SHADE_MODEL" type="enum" enum_name="gl_shade_model"/>
     <reg32 offset="0x0370" name="MRT_COLOR_MASK" type="bitfield">
       <bitfield name="BUFFER1_A" high="4" low="4" type="boolean"/>
       <bitfield name="BUFFER1_R" high="5" low="5" type="boolean"/>
@@ -4023,162 +3991,26 @@
       <bitfield name="BUFFER3_G" high="14" low="14" type="boolean"/>
       <bitfield name="BUFFER3_B" high="15" low="15" type="boolean"/>
     </reg32>
-    <reg32 offset="0x0374" name="COLOR_LOGIC_OP_ENABLE" type="boolean"/>
-    <reg32 offset="0x0378" name="COLOR_LOGIC_OP" type="enum" enum_name="gl_logic_op"/>
     <reg32 offset="0x037c"/>
     <reg32 offset="0x0380"/>
     <reg32 offset="0x0384" type="float"/>
     <reg32 offset="0x0388" type="float"/>
-    <reg32 offset="0x0394" name="DEPTH_RANGE_NEAR" type="float"/>
-    <reg32 offset="0x0398" name="DEPTH_RANGE_FAR" type="float"/>
-    <reg32 offset="0x03b0"/>
-    <reg32 offset="0x03b8" name="LINE_WIDTH" type="int"/>
-    <reg32 offset="0x03bc" name="LINE_SMOOTH_ENABLE" type="boolean"/>
     <reg32 offset="0x03c0" name="UNK03C0" size="16"/>
     <reg32 offset="0x0400" name="UNK0400" size="16"/>
     <reg32 offset="0x0440" name="UNK0440" size="32"/>
-    <reg32 offset="0x08c0" name="SCISSOR_HORIZ" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x08c4" name="SCISSOR_VERT" type="bitfield">
-      <bitfield name="Y" high="15" low="0" type="int"/>
-      <bitfield name="H" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x08cc" name="FOG_MODE"/>
-    <reg32 offset="0x08d0" name="FOG_EQUATION_CONSTANT" type="float"/>
-    <reg32 offset="0x08d4" name="FOG_EQUATION_LINEAR" type="float"/>
-    <reg32 offset="0x08d8" name="FOG_EQUATION_QUADRATIC" type="float"/>
-    <reg32 offset="0x08e4" name="FP_ADDRESS" type="bitfield">
-      <bitfield name="OFFSET" high="31" low="8" type="hexa"/>
-      <bitfield name="DMA1" high="1" low="1" type="boolean"/>
-      <bitfield name="DMA0" high="0" low="0" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x0a00" name="VIEWPORT_HORIZ" type="bitfield">
-      <bitfield name="W" high="31" low="16" type="int" />
-      <bitfield name="X" high="15" low="0" type="int" />
-    </reg32>
-    <reg32 offset="0x0a04" name="VIEWPORT_VERT" type="bitfield">
-      <bitfield name="H" high="31" low="16" type="int" />
-      <bitfield name="Y" high="15" low="0" type="int" />
-    </reg32>
-    <reg32 offset="0x0a20" name="VIEWPORT_TRANSLATE_X" type="float"/>
-    <reg32 offset="0x0a24" name="VIEWPORT_TRANSLATE_Y" type="float"/>
-    <reg32 offset="0x0a28" name="VIEWPORT_TRANSLATE_Z" type="float"/>
-    <reg32 offset="0x0a2c" name="VIEWPORT_TRANSLATE_W" type="float"/>
-    <reg32 offset="0x0a30" name="VIEWPORT_SCALE_X" type="float"/>
-    <reg32 offset="0x0a34" name="VIEWPORT_SCALE_Y" type="float"/>
-    <reg32 offset="0x0a38" name="VIEWPORT_SCALE_Z" type="float"/>
-    <reg32 offset="0x0a3c" name="VIEWPORT_SCALE_W" type="float"/>
-    <reg32 offset="0x0a60" name="POLYGON_OFFSET_POINT_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a64" name="POLYGON_OFFSET_LINE_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a68" name="POLYGON_OFFSET_FILL_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a6c" name="DEPTH_FUNC" type="enum" enum_name="gl_comparison_op"/>
-    <reg32 offset="0x0a70" name="DEPTH_WRITE_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a74" name="DEPTH_TEST_ENABLE" type="boolean"/>
-    <reg32 offset="0x0a78" name="POLYGON_OFFSET_FACTOR" type="float"/>
-    <reg32 offset="0x0a7c" name="POLYGON_OFFSET_UNITS" type="float"/>
-    <reg32 offset="0x0a80" name="VTX_ATTR_3I_XY" size="16" stride="8" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x0a84" name="VTX_ATTR_3I_Z" size="16" stride="8" type="bitfield">
-      <bitfield name="Z" high="15" low="0" type="int"/>
-    </reg32>
-	<reg32 offset="0x0b00" name="TEX_FILTER_OPTIMIZATION" type="bitfield">
+    <reg32 offset="0x0b00" name="TEX_FILTER_OPTIMIZATION" type="bitfield">
       <bitfield name="TRILINEAR" high="4" low="0" type="enum" enum_name="nv40_trilinear_optimization"/>
 	  <bitfield name="ANISO_SAMPLE" high="8" low="6" type="enum" enum_name="nv40_ansio_sample_optimization"/>
       <bitfield name="UNKNOWN" high="14" low="10" type="enum" enum_name="nv40_unknown_optimization"/>
     </reg32>
     <reg32 offset="0x0b40" name="UNK0B40" size="8"/>
-    <reg32 offset="0x0b80" name="VP_UPLOAD_INST" size="4" type="hexa"/>
-    <reg32 offset="0x1428"/>
-    <reg32 offset="0x142c" name="VERTEX_TWO_SIDE_ENABLE" type="boolean"/>
     <reg32 offset="0x1450"/>
-    <reg32 offset="0x1454"/>
-    <reg32 offset="0x145c"/>
-    <reg32 offset="0x1478" name="CLIP_PLANE_ENABLE" type="bitfield">
-      <bitfield name="PLANE0" high="1" low="1" type="boolean"/>
-      <bitfield name="PLANE1" high="5" low="5" type="boolean"/>
-      <bitfield name="PLANE2" high="9" low="9" type="boolean"/>
-      <bitfield name="PLANE3" high="13" low="13" type="boolean"/>
-      <bitfield name="PLANE4" high="17" low="17" type="boolean"/>
-      <bitfield name="PLANE5" high="21" low="21" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x147c" name="POLYGON_STIPPLE_ENABLE" type="boolean"/>
-    <reg32 offset="0x1480" name="POLYGON_STIPPLE_PATTERN" size="32" type="hexa"/>
-    <reg32 offset="0x1500" name="VTX_ATTR_3F_X" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1504" name="VTX_ATTR_3F_Y" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1508" name="VTX_ATTR_3F_Z" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1680" name="VTXBUF_ADDRESS" size="16" stride="4" type="bitfield">
-      <bitfield name="DMA1" high="31" low="31" type="boolean"/>
-      <bitfield name="OFFSET" high="27" low="0" type="hexa"/>
-    </reg32>
     <reg32 offset="0x1714" name="VTX_CACHE_INVALIDATE"/>
-    <reg32 offset="0x1718"/>
-    <reg32 offset="0x1740" name="VTXFMT" size="16" type="bitfield">
-      <bitfield name="TYPE" high="3" low="0" type="enum" enum_name="nv40_vtxfmt_type"/>
-      <bitfield name="SIZE" high="7" low="4" type="int"/>
-      <bitfield name="STRIDE" high="15" low="8" type="int"/>
-    </reg32>
-    <reg32 offset="0x17c8" name="QUERY_RESET"/>
-    <reg32 offset="0x17cc" name="QUERY_UNK17CC"/>
-    <reg32 offset="0x1800" name="QUERY_GET" type="bitfield">
-      <bitfield name="UNK24" high="31" low="24" type="int"/>
-      <bitfield name="OFFSET" high="23" low="0" type="hexa"/>
-    </reg32>
     <reg32 offset="0x1804"/>
-    <reg32 offset="0x1808" name="BEGIN_END" type="enum" enum_name="nv10_begin_end"/>
-    <reg32 offset="0x180c" name="VB_ELEMENT_U16" type="bitfield">
-      <bitfield name="1" high="31" low="16" type="int"/>
-      <bitfield name="0" high="15" low="0" type="int"/>
-    </reg32>
-    <reg32 offset="0x1810" name="VB_ELEMENT_U32" type="int"/>
-    <reg32 offset="0x1814" name="VB_VERTEX_BATCH" type="bitfield">
-      <bitfield name="COUNT" high="31" low="24" type="int"/>
-      <bitfield name="START" high="23" low="0" type="int"/>
-    </reg32>
-    <reg32 offset="0x1818" name="VERTEX_DATA" type="float"/>
-    <reg32 offset="0x181c" name="IDXBUF_ADDRESS" type="hexa"/>
-    <reg32 offset="0x1820" name="IDXBUF_FORMAT" type="bitfield">
-      <bitfield name="TYPE" high="7" low="4" type="enum" enum_name="nv40_idxfmt_type"/>
-      <bitfield name="DMA1" high="0" low="0" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x1824" name="VB_INDEX_BATCH" type="bitfield">
-      <bitfield name="COUNT" high="31" low="24" type="int"/>
-      <bitfield name="START" high="23" low="0" type="int"/>
-    </reg32>
-    <reg32 offset="0x1828" name="POLYGON_MODE_FRONT" type="enum" enum_name="gl_polygon_mode"/>
-    <reg32 offset="0x182c" name="POLYGON_MODE_BACK" type="enum" enum_name="gl_polygon_mode"/>
-    <reg32 offset="0x1830" name="CULL_FACE" type="enum" enum_name="gl_cull_face"/>
-    <reg32 offset="0x1834" name="FRONT_FACE" type="enum" enum_name="gl_front_face"/>
-    <reg32 offset="0x1838" name="POLYGON_SMOOTH_ENABLE" type="boolean"/>
-    <reg32 offset="0x183c" name="CULL_FACE_ENABLE" type="boolean"/>
     <reg32 offset="0x1840" name="TEX_SIZE1" size="8" stride="4" type="bitfield">
       <bitfield name="DEPTH" high="31" low="20" type="int"/>
       <bitfield name="PITCH" high="15" low="0" type="int"/>
     </reg32>
-    <reg32 offset="0x1880" name="VTX_ATTR_2F_X" size="16" stride="8" type="float"/>
-    <reg32 offset="0x1884" name="VTX_ATTR_2F_Y" size="16" stride="8" type="float"/>
-    <reg32 offset="0x1900" name="VTX_ATTR_2I" size="16" stride="4" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1940" name="VTX_ATTR_4UB" size="16" type="bitfield">
-      <bitfield name="X" high="7" low="0" type="int"/>
-      <bitfield name="Y" high="15" low="8" type="int"/>
-      <bitfield name="Z" high="23" low="16" type="int"/>
-      <bitfield name="W" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1980" name="VTX_ATTR_4I_XY" size="16" stride="8" type="bitfield">
-      <bitfield name="X" high="15" low="0" type="int"/>
-      <bitfield name="Y" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1984" name="VTX_ATTR_4I_ZW" size="16" stride="8" type="bitfield">
-      <bitfield name="Z" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-    <reg32 offset="0x1a00" name="TEX_OFFSET" size="16" stride="32" type="hexa"/>
     <reg32 offset="0x1a04" name="TEX_FORMAT" size="16" stride="32" type="bitfield">
       <bitfield name="MIPMAP_COUNT" high="19" low="16" type="int"/>
       <bitfield name="RECT" high="14" low="14" type="boolean"/>
@@ -4223,20 +4055,6 @@
       <bitfield name="MIN" high="19" low="16" type="enum" enum_name="nv04_tx_min_filter"/>
       <bitfield name="MAG" high="27" low="24" type="enum" enum_name="nv04_tx_mag_filter"/>
     </reg32>
-    <reg32 offset="0x1a18" name="TEX_SIZE0" size="16" stride="32" type="bitfield">
-      <bitfield name="H" high="15" low="0" type="int"/>
-      <bitfield name="W" high="31" low="16" type="int"/>
-    </reg32>
-   <reg32 offset="0x1a1c" name="TEX_BORDER_COLOR" size="16" stride="32" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="int"/>
-      <bitfield name="G" high="15" low="8" type="int"/>
-      <bitfield name="R" high="23" low="16" type="int"/>
-      <bitfield name="A" high="31" low="24" type="int"/>
-    </reg32>
-    <reg32 offset="0x1c00" name="VTX_ATTR_4F_X" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c04" name="VTX_ATTR_4F_Y" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c08" name="VTX_ATTR_4F_Z" size="16" stride="16" type="float"/>
-    <reg32 offset="0x1c0c" name="VTX_ATTR_4F_W" size="16" stride="16" type="float"/>
     <reg32 offset="0x1d0c"/>
     <reg32 offset="0x1d60" name="FP_CONTROL" type="bitfield">
       <bitfield name="TEMP_COUNT" high="31" low="24" type="int"/>
@@ -4246,58 +4064,12 @@
     <reg32 offset="0x1d6c"/>
     <reg32 offset="0x1d70"/>
     <reg32 offset="0x1d78"/>
-    <reg32 offset="0x1d7c" name="MULTISAMPLE_CONTROL" type="bitfield"/>
-    <reg32 offset="0x1d80"/>
-    <reg32 offset="0x1d84"/>
-    <reg32 offset="0x1d88"/>
-    <reg32 offset="0x1d8c" name="CLEAR_VALUE_DEPTH"/>
-    <reg32 offset="0x1d90" name="CLEAR_VALUE_COLOR" type="bitfield">
-      <bitfield name="B" high="7" low="0" type="int" />
-      <bitfield name="G" high="15" low="8" type="int" />
-      <bitfield name="R" high="23" low="16" type="int" />
-      <bitfield name="A" high="31" low="24" type="int" />
-    </reg32>
-    <reg32 offset="0x1d94" name="CLEAR_BUFFERS" type="bitfield">
-      <bitfield name="COLOR_A" high="7" low="7" type="boolean"/>
-      <bitfield name="COLOR_B" high="6" low="6" type="boolean"/>
-      <bitfield name="COLOR_G" high="5" low="5" type="boolean"/>
-      <bitfield name="COLOR_R" high="4" low="4" type="boolean"/>
-      <bitfield name="STENCIL" high="1" low="1" type="boolean"/>
-      <bitfield name="DEPTH" high="0" low="0" type="boolean"/>
-    </reg32>
-    <reg32 offset="0x1da4"/>
-    <reg32 offset="0x1db4" name="LINE_STIPPLE_ENABLE" type="boolean"/>
-    <reg32 offset="0x1db8" name="LINE_STIPPLE_PATTERN" type="bitfield">
-      <bitfield name="FACTOR" high="15" low="0" type="int"/>
-      <bitfield name="PATTERN" high="31" low="16" type="hexa"/>
-    </reg32>
-    <reg32 offset="0x1e40" name="VTX_ATTR_1F" size="16" type="float"/>
     <reg32 offset="0x1e94"/>
     <reg32 offset="0x1e98"/>
-    <reg32 offset="0x1e9c" name="VP_UPLOAD_FROM_ID" type="hexa"/>
-    <reg32 offset="0x1ea0" name="VP_START_FROM_ID" type="hexa"/>
     <reg32 offset="0x1ea4"/>
     <reg32 offset="0x1ea8"/>
     <reg32 offset="0x1eac"/>
-    <reg32 offset="0x1ee0" name="POINT_SIZE" type="float"/>
-    <reg32 offset="0x1ee8" name="POINT_SPRITE" type="bitfield">
-      <bitfield high="0" low="0" name="ENABLE" type="boolean" />
-      <bitfield enum_name="nv20_point_sprite_r_mode" high="2" low="1" name="R_MODE" type="enum" />
-      <bitfield high="8" low="8" name="COORD_REPLACE_0" type="boolean" />
-      <bitfield high="9" low="9" name="COORD_REPLACE_1" type="boolean" />
-      <bitfield high="10" low="10" name="COORD_REPLACE_2" type="boolean" />
-      <bitfield high="11" low="11" name="COORD_REPLACE_3" type="boolean" />
-      <bitfield high="12" low="12" name="COORD_REPLACE_4" type="boolean" />
-      <bitfield high="13" low="13" name="COORD_REPLACE_5" type="boolean" />
-      <bitfield high="14" low="14" name="COORD_REPLACE_6" type="boolean" />
-      <bitfield high="15" low="15" name="COORD_REPLACE_7" type="boolean" />
-    </reg32>
     <reg32 offset="0x1ef8"/>
-    <reg32 offset="0x1efc" name="VP_UPLOAD_CONST_ID" type="hexa"/>
-    <reg32 offset="0x1f00" name="VP_UPLOAD_CONST_X" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f04" name="VP_UPLOAD_CONST_Y" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f08" name="VP_UPLOAD_CONST_Z" size="4" stride="16" type="float"/>
-    <reg32 offset="0x1f0c" name="VP_UPLOAD_CONST_W" size="4" stride="16" type="float"/>
     <reg32 offset="0x1fc4"/>
     <reg32 offset="0x1fc8"/>
     <reg32 offset="0x1fcc"/>
@@ -4308,7 +4080,7 @@
     <reg32 offset="0x1fe8"/>
     <reg32 offset="0x1ff0" name="VP_ATTRIB_EN"/>
     <reg32 offset="0x1ff4" name="VP_RESULT_EN"/>
-  </object>
+    </object>
   <object id="0x4497" name="NV44TCL" parent="0x4097">
     <reg32 offset="0x038c"/>
     <reg32 offset="0x03a0"/>
@@ -4880,10 +4652,10 @@
       <bitfield name="LAYER" high="18" low="10" type="int"/>
     </reg32>
     <reg32 offset="0x1a00" name="COLOR_MASK" size="8" type="bitfield">
-	<bitfield name="R" high="3" low="0" type="boolean" />
-	<bitfield name="G" high="7" low="4" type="boolean" />
-	<bitfield name="B" high="11" low="8" type="boolean" />
-	<bitfield name="A" high="15" low="12" type="boolean" />
+	<bitfield name="R" high="3" low="0" type="boolean"/>
+	<bitfield name="G" high="7" low="4" type="boolean"/>
+	<bitfield name="B" high="11" low="8" type="boolean"/>
+	<bitfield name="A" high="15" low="12" type="boolean"/>
     </reg32>
     <reg32 offset="0x1a2c"/>
     <reg32 offset="0x1a80" name="STRMOUT_ADDRESS_HIGH" size="4" stride="16" type="hexa"/>
@@ -5093,75 +4865,75 @@
 
   <program name="NV30_FP">
     <reg32 offset="0x0000" name="OP" type="bitfield">
-      <bitfield name="PROGRAM_END" high="0" low="0" type="boolean" />
-      <bitfield name="UNK" high="7" low="7" type="int" />
-      <bitfield name="COND_WRITE_ENABLE" high="8" low="8" type="boolean" />
+      <bitfield name="PROGRAM_END" high="0" low="0" type="boolean"/>
+      <bitfield name="UNK" high="7" low="7" type="int"/>
+      <bitfield name="COND_WRITE_ENABLE" high="8" low="8" type="boolean"/>
       <bitfield name="OUTMASK" high="12" low="9" type="enum" enum_name="nv30_fp_op_output_mask"/>
       <bitfield name="INPUT_SRC" high="16" low="13" type="enum" enum_name="nv30_fp_op_input_src"/>
-      <bitfield name="TEX_UNIT" high="20" low="17" type="int" />
+      <bitfield name="TEX_UNIT" high="20" low="17" type="int"/>
       <bitfield name="PRECISION" high="23" low="22" type="enum" enum_name="nv30_fp_op_precision"/>
       <bitfield name="OPCODE" high="29" low="24" type="enum" enum_name="nv30_fp_op_opcode"/>
-      <bitfield name="OUT_SAT" high="31" low="31" type="boolean" />
+      <bitfield name="OUT_SAT" high="31" low="31" type="boolean"/>
     </reg32>
     <reg32 offset="0x0004" name="OP" type="bitfield">
       <bitfield name="COND" high="20" low="18" type="enum" enum_name="nv30_fp_op_cond"/>
-      <bitfield name="SWZ_X" high="22" low="21" type="int" />
-      <bitfield name="SWZ_Y" high="24" low="23" type="int" />
-      <bitfield name="SWZ_Z" high="26" low="25" type="int" />
-      <bitfield name="SWZ_W" high="28" low="27" type="int" />
-      <bitfield name="OUT_ABS" high="29" low="29" type="boolean" />
+      <bitfield name="SWZ_X" high="22" low="21" type="int"/>
+      <bitfield name="SWZ_Y" high="24" low="23" type="int"/>
+      <bitfield name="SWZ_Z" high="26" low="25" type="int"/>
+      <bitfield name="SWZ_W" high="28" low="27" type="int"/>
+      <bitfield name="OUT_ABS" high="29" low="29" type="boolean"/>
     </reg32>
     <reg32 offset="0x0008" name="OP" type="bitfield">
       <bitfield name="SCALE" high="30" low="28" type="enum" enum_name="nv30_fp_op_scale"/>
     </reg32>
     <reg32 offset="0x000c" name="OP" type="bitfield">
-      <bitfield name="INDEX_INPUT" high="30" low="30" type="int" />
+      <bitfield name="INDEX_INPUT" high="30" low="30" type="int"/>
     </reg32>
   </program>
 
   <program name="NV40_FP">
     <reg32 offset="0x0000" name="OP" type="bitfield">
-      <bitfield name="PROGRAM_END" high="0" low="0" type="boolean" />
-      <bitfield name="UNK" high="7" low="7" type="int" />
-      <bitfield name="COND_WRITE_ENABLE" high="8" low="8" type="boolean" />
-      <bitfield name="OUTMASK" high="12" low="9" type="int" />
-      <bitfield name="INPUT_SRC" high="16" low="13" type="int" />
-      <bitfield name="TEX_UNIT" high="20" low="17" type="int" />
-      <bitfield name="PRECISION" high="23" low="22" type="int" />
-      <bitfield name="OPCODE" high="29" low="24" type="int" />
-      <bitfield name="OUT_SAT" high="31" low="31" type="boolean" />
+      <bitfield name="PROGRAM_END" high="0" low="0" type="boolean"/>
+      <bitfield name="UNK" high="7" low="7" type="int"/>
+      <bitfield name="COND_WRITE_ENABLE" high="8" low="8" type="boolean"/>
+      <bitfield name="OUTMASK" high="12" low="9" type="int"/>
+      <bitfield name="INPUT_SRC" high="16" low="13" type="int"/>
+      <bitfield name="TEX_UNIT" high="20" low="17" type="int"/>
+      <bitfield name="PRECISION" high="23" low="22" type="int"/>
+      <bitfield name="OPCODE" high="29" low="24" type="int"/>
+      <bitfield name="OUT_SAT" high="31" low="31" type="boolean"/>
     </reg32>
     <reg32 offset="0x0004" name="PARAM0" type="bitfield">
-      <bitfield name="COND" high="20" low="18" type="int" />
-      <bitfield name="SWZ_X" high="22" low="21" type="int" />
-      <bitfield name="SWZ_Y" high="24" low="23" type="int" />
-      <bitfield name="SWZ_Z" high="26" low="25" type="int" />
-      <bitfield name="SWZ_W" high="28" low="27" type="int" />
-      <bitfield name="OUT_ABS" high="29" low="29" type="boolean" />
+      <bitfield name="COND" high="20" low="18" type="int"/>
+      <bitfield name="SWZ_X" high="22" low="21" type="int"/>
+      <bitfield name="SWZ_Y" high="24" low="23" type="int"/>
+      <bitfield name="SWZ_Z" high="26" low="25" type="int"/>
+      <bitfield name="SWZ_W" high="28" low="27" type="int"/>
+      <bitfield name="OUT_ABS" high="29" low="29" type="boolean"/>
     </reg32>
     <reg32 offset="0x0008" name="PARAM1" type="bitfield">
       <!-- IF -->
-      <bitfield name="ELSE_ID" high="9" low="2" type="int" />
+      <bitfield name="ELSE_ID" high="9" low="2" type="int"/>
       <!-- CAL -->
-      <bitfield name="IADDR" high="9" low="2" type="int" />
+      <bitfield name="IADDR" high="9" low="2" type="int"/>
       <!-- LOOP -->
-      <bitfield name="LOOP_COUNT" high="9" low="2" type="int" />
-      <bitfield name="LOOP_INDEX" high="27" low="10" type="int" />
-      <bitfield name="LOOP_INCR" high="26" low="19" type="int" />
+      <bitfield name="LOOP_COUNT" high="9" low="2" type="int"/>
+      <bitfield name="LOOP_INDEX" high="27" low="10" type="int"/>
+      <bitfield name="LOOP_INCR" high="26" low="19" type="int"/>
       <!-- REP -->
-      <bitfield name="COUNT1" high="9" low="2" type="int" />
-      <bitfield name="COUNT2" high="27" low="10" type="int" />
-      <bitfield name="COUNT3" high="26" low="19" type="int" />
+      <bitfield name="COUNT1" high="9" low="2" type="int"/>
+      <bitfield name="COUNT2" high="27" low="10" type="int"/>
+      <bitfield name="COUNT3" high="26" low="19" type="int"/>
 
-      <bitfield name="SRC_SCALE" high="29" low="28" type="int" />
-      <bitfield name="IS_BRANCH" high="31" low="31" type="boolean" />
+      <bitfield name="SRC_SCALE" high="29" low="28" type="int"/>
+      <bitfield name="IS_BRANCH" high="31" low="31" type="boolean"/>
     </reg32>
     <reg32 offset="0x000c" name="PARAM2" type="bitfield">
       <!-- REP/IF -->
-      <bitfield name="END_ID" high="9" low="2" type="int" />
+      <bitfield name="END_ID" high="9" low="2" type="int"/>
 
-      <bitfield name="ADDR_INDEX" high="22" low="19" type="int" />
-      <bitfield name="INDEX_INPUT" high="30" low="30" type="int" />
+      <bitfield name="ADDR_INDEX" high="22" low="19" type="int"/>
+      <bitfield name="INDEX_INPUT" high="30" low="30" type="int"/>
     </reg32>
   </program>
 
-- 
1.6.6.1.476.g01ddb
