From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54786] random crashes of X with failed to idle
 channel 0xcccc0000
Date: Fri, 15 Feb 2013 10:53:17 +0000
Message-ID: <bug-54786-8800-R1MPqZnPfN@http.bugs.freedesktop.org/>
References: <bug-54786-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0308904745=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54786-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0308904745==
Content-Type: multipart/alternative; boundary="1360925597.ABA1c7DF1.8259"; charset="us-ascii"


--1360925597.ABA1c7DF1.8259
Date: Fri, 15 Feb 2013 10:53:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54786

--- Comment #2 from Mark Einon <mark.einon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've run a bisect on Linus' master branch, and narrowed the issue down to this
one line change, which isn't much to go on. It looks like the change of struct
type has caused issues where it is used elsewhere :

commit 7707b701ebfea64afa6bfb23aa318fd687892754
Author: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Commit: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

    drm/nv40/mpeg: fix context handling

    It slipped in thanks to typeless API.

    Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
b/drivers/gpu/drm/n
index 1241857..f7c581a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
@@ -38,7 +38,7 @@ struct nv40_mpeg_priv {
 };

 struct nv40_mpeg_chan {
- struct nouveau_mpeg base;
+ struct nouveau_mpeg_chan base;
 };

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360925597.ABA1c7DF1.8259
Date: Fri, 15 Feb 2013 10:53:17 +0000
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
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - random crashes of X with failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54786">bug 54786</a>
              from <span class="vcard"><a class="email" href="mailto:mark.einon&#64;gmail.com" title="Mark Einon &lt;mark.einon&#64;gmail.com&gt;"> <span class="fn">Mark Einon</span></a>
</span></b>
        <pre>I've run a bisect on Linus' master branch, and narrowed the issue down to this
one line change, which isn't much to go on. It looks like the change of struct
type has caused issues where it is used elsewhere :

commit 7707b701ebfea64afa6bfb23aa318fd687892754
Author: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
Commit: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

    drm/nv40/mpeg: fix context handling

    It slipped in thanks to typeless API.

    Signed-off-by: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

diff --git a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
b/drivers/gpu/drm/n
index 1241857..f7c581a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/engine/mpeg/nv40.c
&#64;&#64; -38,7 +38,7 &#64;&#64; struct nv40_mpeg_priv {
 };

 struct nv40_mpeg_chan {
- struct nouveau_mpeg base;
+ struct nouveau_mpeg_chan base;
 };</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360925597.ABA1c7DF1.8259--

--===============0308904745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0308904745==--
