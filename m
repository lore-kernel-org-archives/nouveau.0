From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 2/2] st: don't assert on empty fragment program
Date: Sun, 17 Jan 2010 22:36:00 +0100
Message-ID: <1263764160-8891-2-git-send-email-luca@luca-barbieri.com>
References: <1263764160-8891-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1263764160-8891-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Sauerbraten triggers this assert.
---
 src/mesa/state_tracker/st_atom_shader.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/src/mesa/state_tracker/st_atom_shader.c b/src/mesa/state_tracker/st_atom_shader.c
index 176f3ea..fce533a 100644
--- a/src/mesa/state_tracker/st_atom_shader.c
+++ b/src/mesa/state_tracker/st_atom_shader.c
@@ -79,8 +79,6 @@ translate_fp(struct st_context *st,
 
       stfp->num_input_slots = numIn;
 
-      assert(stfp->Base.Base.NumInstructions > 1);
-
       st_translate_fragment_program(st, stfp, stfp->input_to_slot);
    }
 }
-- 
1.6.3.3
