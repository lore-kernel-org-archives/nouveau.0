From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89455] [NVC0/Gallium] Unigine Heaven black and white
	boxes
Date: Tue, 28 Apr 2015 06:01:45 +0000
Message-ID: <bug-89455-8800-FgbMKjQP4S@http.bugs.freedesktop.org/>
References: <bug-89455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0453674945=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0453674945==
Content-Type: multipart/alternative; boundary="1430200904.60FdB6cb1.25048"; charset="UTF-8"


--1430200904.60FdB6cb1.25048
Date: Tue, 28 Apr 2015 06:01:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89455

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This patch seems to improve things for me (on a GF108). Pretty sure this is
incomplete though.

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 248f98d..0420bf2 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
@@ -2433,6 +2433,8 @@ Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
          src1 = fetchSrc(1, c);
          geni = mkOp2(op, dstTy, dst0[c], src0, src1);
          geni->subOp = tgsi::opcodeToSubOp(tgsi.getOpcode());
+         if (dstTy == TYPE_F32)
+            geni->ftz = true;
       }
       break;
    case TGSI_OPCODE_MAD:
@@ -2442,7 +2444,9 @@ Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
          src0 = fetchSrc(0, c);
          src1 = fetchSrc(1, c);
          src2 = fetchSrc(2, c);
-         mkOp3(op, dstTy, dst0[c], src0, src1, src2);
+         geni = mkOp3(op, dstTy, dst0[c], src0, src1, src2);
+         if (dstTy == TYPE_F32)
+            geni->ftz = true;
       }
       break;
    case TGSI_OPCODE_MOV:

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1430200904.60FdB6cb1.25048
Date: Tue, 28 Apr 2015 06:01:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89455#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC0/Gallium] Unigine Heaven black and white boxes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89455">bug 89455</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This patch seems to improve things for me (on a GF108). Pretty sure this is
incomplete though.

diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
index 248f98d..0420bf2 100644
--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_from_tgsi.cpp
&#64;&#64; -2433,6 +2433,8 &#64;&#64; Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
          src1 = fetchSrc(1, c);
          geni = mkOp2(op, dstTy, dst0[c], src0, src1);
          geni-&gt;subOp = tgsi::opcodeToSubOp(tgsi.getOpcode());
+         if (dstTy == TYPE_F32)
+            geni-&gt;ftz = true;
       }
       break;
    case TGSI_OPCODE_MAD:
&#64;&#64; -2442,7 +2444,9 &#64;&#64; Converter::handleInstruction(const struct
tgsi_full_instruction *insn)
          src0 = fetchSrc(0, c);
          src1 = fetchSrc(1, c);
          src2 = fetchSrc(2, c);
-         mkOp3(op, dstTy, dst0[c], src0, src1, src2);
+         geni = mkOp3(op, dstTy, dst0[c], src0, src1, src2);
+         if (dstTy == TYPE_F32)
+            geni-&gt;ftz = true;
       }
       break;
    case TGSI_OPCODE_MOV:</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430200904.60FdB6cb1.25048--

--===============0453674945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0453674945==--
