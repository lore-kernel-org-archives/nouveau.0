From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Sat, 28 Mar 2015 06:03:59 +0000
Message-ID: <bug-89730-8800-LAscxxpfgc@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0753794988=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0753794988==
Content-Type: multipart/alternative; boundary="1427522639.Bd18CECA1.9792"; charset="UTF-8"


--1427522639.Bd18CECA1.9792
Date: Sat, 28 Mar 2015 06:03:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #14 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 114680
  --> https://bugs.freedesktop.org/attachment.cgi?id=114680&action=edit
nv50_exa NV50EXAPrepareComposite rm

OR

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 221160d..18a11a1 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -832,6 +832,8 @@ NV50EXAPrepareComposite(int op,
 {
     NV50EXA_LOCALS(pdpix);

+    NOUVEAU_FALLBACK("poma\n");
+
     if (!PUSH_SPACE(push, 256))
         NOUVEAU_FALLBACK("space\n");
     PUSH_RESET(push);


Both have a positive effect on Greeter Background image loading,
BUT produce various kinds of corruption within Desktop session.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427522639.Bd18CECA1.9792
Date: Sat, 28 Mar 2015 06:03:59 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114680" name="attach_114680" title="nv50_exa NV50EXAPrepareComposite rm">attachment 114680</a> <a href="attachment.cgi?id=114680&amp;action=edit" title="nv50_exa NV50EXAPrepareComposite rm">[details]</a></span>
nv50_exa NV50EXAPrepareComposite rm

OR

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 221160d..18a11a1 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
&#64;&#64; -832,6 +832,8 &#64;&#64; NV50EXAPrepareComposite(int op,
 {
     NV50EXA_LOCALS(pdpix);

+    NOUVEAU_FALLBACK(&quot;poma\n&quot;);
+
     if (!PUSH_SPACE(push, 256))
         NOUVEAU_FALLBACK(&quot;space\n&quot;);
     PUSH_RESET(push);


Both have a positive effect on Greeter Background image loading,
BUT produce various kinds of corruption within Desktop session.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427522639.Bd18CECA1.9792--

--===============0753794988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0753794988==--
