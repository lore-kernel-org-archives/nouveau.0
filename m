From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Thu, 04 Jun 2015 06:08:09 +0000
Message-ID: <bug-89730-8800-10auSL517l@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641484374=="
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


--===============1641484374==
Content-Type: multipart/alternative; boundary="1433398089.ef6EE4da1.9270"; charset="UTF-8"


--1433398089.ef6EE4da1.9270
Date: Thu, 4 Jun 2015 06:08:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #37 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Loading background bitmap is solved with:

https://git.gnome.org/browse/gtk+/commit/?id=a34a022

$ git log --stat -1 -p gtk/gtkwindow.c
commit a34a0224e4fc6eff35fd41b7f318517b20b95713
Author: Jasper St. Pierre <jstpierre-bCkaWjLhF8TR7s880joybQ@public.gmane.org>
Date:   Fri Feb 13 18:21:42 2015 -0800

    gtkwindow: Don't set the background if the window is app-paintable

    This fixes transparent DND windows.
---
 gtk/gtkwindow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
index 4dbde2a..2b1bcca 100644
--- a/gtk/gtkwindow.c
+++ b/gtk/gtkwindow.c
@@ -7006,7 +7006,7 @@ gtk_window_realize (GtkWidget *widget)
   /* We don't need to set a background on the GdkWindow; with decorations
    * we draw the background ourself
    */
-  if (!priv->client_decorated)
+  if (!priv->client_decorated && !gtk_widget_get_app_paintable (widget))
     gtk_style_context_set_background (gtk_widget_get_style_context (widget),
gdk_window);

   attributes.x = allocation.x;


Backporting this particular commit(part of 3.15.7 release) to 3.14.x has no
effect,
so rather than upgrade from:

gtk3-3.14.13-2.fc21
glib2-2.42.2-1.fc21
atk-2.14.0-1.fc21

to:

gtk3-3.15.7-1.fc21
glib2-2.43.4-1.fc21
atk-2.15.1-1.fc21

this would actually be the best solution:

gtk3-3.16.3-1.fc22
glib2-2.44.1-1.fc22
atk-2.16.0-1.fc22


I thank Ilia and Andrew for their participation.


Ref.
https://bugs.freedesktop.org/show_bug.cgi?id=89730
https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433398089.ef6EE4da1.9270
Date: Thu, 4 Jun 2015 06:08:09 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Loading background bitmap is solved with:

<a href="https://git.gnome.org/browse/gtk+/commit/?id=a34a022">https://git.gnome.org/browse/gtk+/commit/?id=a34a022</a>

$ git log --stat -1 -p gtk/gtkwindow.c
commit a34a0224e4fc6eff35fd41b7f318517b20b95713
Author: Jasper St. Pierre &lt;<a href="mailto:jstpierre&#64;mecheye.net">jstpierre&#64;mecheye.net</a>&gt;
Date:   Fri Feb 13 18:21:42 2015 -0800

    gtkwindow: Don't set the background if the window is app-paintable

    This fixes transparent DND windows.
---
 gtk/gtkwindow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
index 4dbde2a..2b1bcca 100644
--- a/gtk/gtkwindow.c
+++ b/gtk/gtkwindow.c
&#64;&#64; -7006,7 +7006,7 &#64;&#64; gtk_window_realize (GtkWidget *widget)
   /* We don't need to set a background on the GdkWindow; with decorations
    * we draw the background ourself
    */
-  if (!priv-&gt;client_decorated)
+  if (!priv-&gt;client_decorated &amp;&amp; !gtk_widget_get_app_paintable (widget))
     gtk_style_context_set_background (gtk_widget_get_style_context (widget),
gdk_window);

   attributes.x = allocation.x;


Backporting this particular commit(part of 3.15.7 release) to 3.14.x has no
effect,
so rather than upgrade from:

gtk3-3.14.13-2.fc21
glib2-2.42.2-1.fc21
atk-2.14.0-1.fc21

to:

gtk3-3.15.7-1.fc21
glib2-2.43.4-1.fc21
atk-2.15.1-1.fc21

this would actually be the best solution:

gtk3-3.16.3-1.fc22
glib2-2.44.1-1.fc22
atk-2.16.0-1.fc22


I thank Ilia and Andrew for their participation.


Ref.
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="show_bug.cgi?id=89730">https://bugs.freedesktop.org/show_bug.cgi?id=89730</a>
<a href="https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079">https://bugs.launchpad.net/ubuntu/+source/lightdm-gtk-greeter/+bug/1459079</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433398089.ef6EE4da1.9270--

--===============1641484374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1641484374==--
