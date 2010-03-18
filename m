From: canbaby <canbaby-0GSiYjBpcig@public.gmane.org>
Subject: [PATCH] nv_driver: use field width format to dump chip
 family
Date: Thu, 18 Mar 2010 16:48:35 +0800
Message-ID: <1268902115.9988.1.camel@wucan-laptop>
Reply-To: canbaby-0GSiYjBpcig@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1815940308=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1815940308==
Content-Type: multipart/alternative; boundary="=-0CkC42Z0NmKx69nJMgCO"


--=-0CkC42Z0NmKx69nJMgCO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Is this the correct maillist to post things about xf86-video-nouveau?

This is my first nouveau patch, since I had a laptop with a GeForce
9300M GS card, I will play with it now.

This patch is just clean and simplified of codes.

---
 src/nv_driver.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index 4b00e3d..06bf160 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -182,14 +182,7 @@ NVIdentify(int flags)
     family = NVKnownFamilies;
     while(family->name && family->chipset)
     {
-        size_t len = strlen(family->name);
-        xf86ErrorF("\t%s", family->name);
-        while(len<maxLen+1)
-        {
-            xf86ErrorF(" ");
-            len++;
-        }
-        xf86ErrorF("(%s)\n", family->chipset);
+        xf86ErrorF("\t%-*s (%s)\n", maxLen, family->name,
family->chipset);
         family++;
     }
 }
-- 
1.6.4.GIT





--=-0CkC42Z0NmKx69nJMgCO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.28.3">
</HEAD>
<BODY>
<!--+GtkHTML:<DATA class="ClueFlow" key="orig" value="0">-->Is this the correct maillist to post things about xf86-video-nouveau?<BR>
<BR>
This is my first nouveau patch, since I had a laptop with a GeForce 9300M GS card, I will play with it now.<BR>
<BR>
This patch is just clean and simplified of codes.<BR>
<BR>
---<BR>
 src/nv_driver.c |&nbsp;&nbsp;&nbsp; 9 +--------<BR>
 1 files changed, 1 insertions(+), 8 deletions(-)<BR>
<BR>
diff --git a/src/nv_driver.c b/src/nv_driver.c<BR>
index 4b00e3d..06bf160 100644<BR>
--- a/src/nv_driver.c<BR>
+++ b/src/nv_driver.c<BR>
@@ -182,14 +182,7 @@ NVIdentify(int flags)<BR>
&nbsp;&nbsp;&nbsp;&nbsp; family = NVKnownFamilies;<BR>
&nbsp;&nbsp;&nbsp;&nbsp; while(family-&gt;name &amp;&amp; family-&gt;chipset)<BR>
&nbsp;&nbsp;&nbsp;&nbsp; {<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t len = strlen(family-&gt;name);<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86ErrorF(&quot;\t%s&quot;, family-&gt;name);<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while(len&lt;maxLen+1)<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86ErrorF(&quot; &quot;);<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len++;<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<BR>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86ErrorF(&quot;(%s)\n&quot;, family-&gt;chipset);<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xf86ErrorF(&quot;\t%-*s (%s)\n&quot;, maxLen, family-&gt;name, family-&gt;chipset);<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; family++;<BR>
&nbsp;&nbsp;&nbsp;&nbsp; }<BR>
 }<BR>
-- <BR>
1.6.4.GIT<BR>
<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-0CkC42Z0NmKx69nJMgCO--

--===============1815940308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1815940308==--
