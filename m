From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Mon, 19 Oct 2015 21:52:52 +0000
Message-ID: <bug-90871-8800-UG9vO9BEvT@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1211523656=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90871-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1211523656==
Content-Type: multipart/alternative; boundary="1445291572.73B80621.4183"; charset="UTF-8"


--1445291572.73B80621.4183
Date: Mon, 19 Oct 2015 21:52:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #43 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 118995
  --> https://bugs.freedesktop.org/attachment.cgi?id=118995&action=edit
updated test program

With this I get the same results whether I set has_texture_rectangle = 1 or 0.
Attached the full updated source file, or use the patch below.

--- attachment.cgi?id=116536    2015-10-19 17:50:43.552881224 -0400
+++ bug-90871.c 2015-10-19 17:51:09.383618103 -0400
@@ -103,7 +103,11 @@

     glPushMatrix ();

-    glScaled (1.0, 1.0, 1.0);
+    glMatrixMode(GL_TEXTURE);
+    if (texture_type == GL_TEXTURE_RECTANGLE_ARB)
+        glScaled (pixmap_width, pixmap_height, 1.0);
+    else
+        glScaled (1.0, 1.0, 1.0);
     glTranslated (0.0, 0.0, 0.0);

     glBegin (GL_QUADS);
@@ -147,8 +151,8 @@
     int fb_match;
     VisualID xvisual_id;

-    has_texture_rectangle =
-        epoxy_has_glx_extension (dpy, screen, "GL_ARB_texture_rectangle");
+    has_texture_rectangle = 1; /*
+        epoxy_has_gl_extension ("GL_ARB_texture_rectangle");*/
     if (has_texture_rectangle)
     {
         printf ("Using texture type GL_TEXTURE_RECTANGLE_ARB\n");

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445291572.73B80621.4183
Date: Mon, 19 Oct 2015 21:52:52 +0000
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
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=118995" name="attach_118995" title="updated test program">attachment 118995</a> <a href="attachment.cgi?id=118995&amp;action=edit" title="updated test program">[details]</a></span>
updated test program

With this I get the same results whether I set has_texture_rectangle = 1 or 0.
Attached the full updated source file, or use the patch below.

--- attachment.cgi?id=116536    2015-10-19 17:50:43.552881224 -0400
+++ bug-90871.c 2015-10-19 17:51:09.383618103 -0400
&#64;&#64; -103,7 +103,11 &#64;&#64;

     glPushMatrix ();

-    glScaled (1.0, 1.0, 1.0);
+    glMatrixMode(GL_TEXTURE);
+    if (texture_type == GL_TEXTURE_RECTANGLE_ARB)
+        glScaled (pixmap_width, pixmap_height, 1.0);
+    else
+        glScaled (1.0, 1.0, 1.0);
     glTranslated (0.0, 0.0, 0.0);

     glBegin (GL_QUADS);
&#64;&#64; -147,8 +151,8 &#64;&#64;
     int fb_match;
     VisualID xvisual_id;

-    has_texture_rectangle =
-        epoxy_has_glx_extension (dpy, screen, &quot;GL_ARB_texture_rectangle&quot;);
+    has_texture_rectangle = 1; /*
+        epoxy_has_gl_extension (&quot;GL_ARB_texture_rectangle&quot;);*/
     if (has_texture_rectangle)
     {
         printf (&quot;Using texture type GL_TEXTURE_RECTANGLE_ARB\n&quot;);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445291572.73B80621.4183--

--===============1211523656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1211523656==--
