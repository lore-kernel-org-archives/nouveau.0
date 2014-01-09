From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Handling UMAD with a negative modifier,
	or why glsl-fs-atan-3 was failing
Date: Thu, 9 Jan 2014 02:16:56 -0500
Message-ID: <CAKb7UvgLOOc-iRrgo5rzoSappTBvqK9XTP7C8rtexwv8ORNWNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

So I figured out what was going on. The shader has a

UMAD TEMP[0].x, TEMP[0].xxxx, -TEMP[5].xxxx, TEMP[0].xxxx

instruction, in which the -TEMP[5].xxxx got emitted as

cvt neg u32 $r1 u32 $r1

If instead I fudge mkOp() to force a s32 dtype on OP_NEG, everything
starts to work. Similarly, if I fudge emitCVT to basically do the same
thing, it also works. (Of note -- changing both stype and dtype to s32
does _not_ work, which makes sense.) I'm not sure which approach is
the right one -- advice? It's a very short patch either way. Perhaps
someone with a NVC0+ card could check that piglit test and see if my
patch breaks things...

Thanks,

  -ilia

--- a/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp
+++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_build_util.cpp
@@ -70,6 +70,9 @@
    insn->setDef(0, dst);
    insn->setSrc(0, src);

+   if (op == OP_NEG && ty == TYPE_U32)
+      insn->dType = TYPE_S32;
+
    insert(insn);
    return insn;
 }
