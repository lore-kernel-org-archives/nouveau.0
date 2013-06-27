From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Thu, 27 Jun 2013 13:04:53 +0000
Message-ID: <bug-66176-8800-IQjOh89QXw@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1242608529=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66176-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1242608529==
Content-Type: multipart/alternative; boundary="1372338293.c4EA782.11692"; charset="us-ascii"


--1372338293.c4EA782.11692
Date: Thu, 27 Jun 2013 13:04:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Although that seems too much as a start. Thus it would be nice to get the
non-memory engine(s) reclock first and then deal with memory/timings/etc

This can be done by forcing current code to ignore the memory clock stored in
vbios, i.e.

diff --git a/drm/nv40_pm.c b/drm/nv40_pm.c
index 3af5bcd..0be61db 100644
--- a/drm/nv40_pm.c
+++ b/drm/nv40_pm.c
@@ -191,7 +191,7 @@ nv40_pm_clocks_pre(struct drm_device *dev, struct
nouveau_pm_level *perflvl)
     }

     /* memory clock */
-    if (!perflvl->memory) {
+    if (1) {
         info->mpll_ctrl = 0x00000000;
         goto out;
     }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372338293.c4EA782.11692
Date: Thu, 27 Jun 2013 13:04:53 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Although that seems too much as a start. Thus it would be nice to get the
non-memory engine(s) reclock first and then deal with memory/timings/etc

This can be done by forcing current code to ignore the memory clock stored in
vbios, i.e.

diff --git a/drm/nv40_pm.c b/drm/nv40_pm.c
index 3af5bcd..0be61db 100644
--- a/drm/nv40_pm.c
+++ b/drm/nv40_pm.c
&#64;&#64; -191,7 +191,7 &#64;&#64; nv40_pm_clocks_pre(struct drm_device *dev, struct
nouveau_pm_level *perflvl)
     }

     /* memory clock */
-    if (!perflvl-&gt;memory) {
+    if (1) {
         info-&gt;mpll_ctrl = 0x00000000;
         goto out;
     }</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372338293.c4EA782.11692--

--===============1242608529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1242608529==--
