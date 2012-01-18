From: =?UTF-8?B?VmlrdG9yIE5vdm90bsO9?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: [PATCH] drm/nouveau/i2c: Fix i2c initialization on cards
 with DCB older than 1.5
Date: Wed, 18 Jan 2012 14:28:41 +0100
Message-ID: <4F16C909.4050503@seznam.cz>
Reply-To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Signed-off-by: Viktor Novotny <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
---
Hi,
I think I found a bug - my NV11 fails to init i2c ports and is then unable to read EDID.
It's because while i2c_table in nouveau_i2c.c:324 returns null for this card,
i2c is initialized anyway at line 341 and wrong i2c table format is then selected at line 350.
This patch fixes the problem on NV11 and was tested also on NV25. I hope no cards but those
with legacy i2c table have i2c table version set to 0.

Regards
	Viktor

 drivers/gpu/drm/nouveau/nouveau_i2c.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_i2c.c b/drivers/gpu/drm/nouveau/nouveau_i2c.c
index 820ae7f..57bcbc3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_i2c.c
+++ b/drivers/gpu/drm/nouveau/nouveau_i2c.c
@@ -344,14 +344,15 @@ nouveau_i2c_init(struct drm_device *dev)
 		if (i2c[5]) legacy[0][1] = i2c[5];
 		if (i2c[6]) legacy[1][0] = i2c[6];
 		if (i2c[7]) legacy[1][1] = i2c[7];
+		version = 0;
 	}
 
-	if (i2c && version >= 0x30) {
+	if (version >= 0x30) {
 		entry     = i2c[1] + i2c;
 		entries   = i2c[2];
 		recordlen = i2c[3];
 	} else
-	if (i2c) {
+	if (version > 0) {
 		entry     = i2c;
 		entries   = 16;
 		recordlen = 4;
-- 
1.7.8.3
