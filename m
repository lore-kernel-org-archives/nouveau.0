From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 10/12] nvc0: use PRIxPTR for sizeof()
Date: Tue, 20 May 2014 19:40:04 -0400
Message-ID: <1400629206-4447-11-git-send-email-imirkin@alum.mit.edu>
References: <1400629206-4447-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400629206-4447-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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
Cc: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Christoph Bumiller <christoph.bumiller-D4IDLmZPRBc@public.gmane.org>

Reviewed-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 src/gallium/drivers/nouveau/nvc0/nvc0_program.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
index 1d59fc4..8724cc5 100644
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_program.c
@@ -512,7 +512,7 @@ nvc0_program_dump(struct nvc0_program *prog)
 
    if (prog->type != PIPE_SHADER_COMPUTE) {
       for (pos = 0; pos < sizeof(prog->hdr) / sizeof(prog->hdr[0]); ++pos)
-         debug_printf("HDR[%02lx] = 0x%08x\n",
+         debug_printf("HDR[%02"PRIxPTR"] = 0x%08x\n",
                       pos * sizeof(prog->hdr[0]), prog->hdr[pos]);
    }
    debug_printf("shader binary code (0x%x bytes):", prog->code_size);
-- 
1.8.5.5
