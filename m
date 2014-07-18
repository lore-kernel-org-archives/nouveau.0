From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/5] nvc0: mark shader header if fp64 is used
Date: Fri, 18 Jul 2014 09:57:27 -0400
Message-ID: <1405691849-18853-4-git-send-email-imirkin@alum.mit.edu>
References: <1405691849-18853-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1405691849-18853-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
index c624e21..ce0207a 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
@@ -640,6 +640,8 @@ nvc0_program_translate(struct nvc0_program *prog, uint16_t chipset)
    */
    if (info->io.globalAccess)
       prog->hdr[0] |= 1 << 16;
+   if (info->io.fp64)
+      prog->hdr[0] |= 1 << 27;
 
    if (prog->pipe.stream_output.num_outputs)
       prog->tfb = nvc0_program_create_tfb_state(info,
-- 
1.8.5.5
