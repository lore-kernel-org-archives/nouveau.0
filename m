From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34179] Nouveau 3D driver: nv50_pc_emit.c:863
 assertion error kills Compiz
Date: Mon, 14 Feb 2011 18:32:18 -0800 (PST)
Message-ID: <20110215023218.BE45D2DC101@annarchy.freedesktop.org>
References: <bug-34179-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34179-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=34179

--- Comment #2 from Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-14 18:32:17 PST ---
This is fixed by the nv50 part of the commit:
commit 7401590dedf6f2abb1f0f0db988be90acb1fb84f
Author: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date:   Mon Feb 7 14:54:17 2011 +0100

    nv50,nvc0: do not forget to apply sign mode to saved TGSI inputs

diff --git a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
index d6b80c3..ce9300a 100644
--- a/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
+++ b/src/gallium/drivers/nv50/nv50_tgsi_to_nc.c
@@ -1130,7 +1130,7 @@ emit_fetch(struct bld_context *bld, const struct
tgsi_full_instruction *insn,
    case TGSI_FILE_INPUT:
       res = bld_saved_input(bld, idx, swz);
       if (res && (insn->Instruction.Opcode != TGSI_OPCODE_TXP))
-         return res;
+         break;

       res = new_value(bld->pc, bld->ti->input_file, type);
       res->reg.id = bld->ti->input_map[idx][swz];

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
