From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Mon, 19 Oct 2015 13:13:39 +0000
Message-ID: <bug-90871-8800-TxqxymdZbt@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2107555439=="
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


--===============2107555439==
Content-Type: multipart/alternative; boundary="1445260419.edc8f0031.25910"; charset="UTF-8"


--1445260419.edc8f0031.25910
Date: Mon, 19 Oct 2015 13:13:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #40 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi All,

(In reply to Olivier Fourdan from comment #11)
> Created attachment 116536 [details]
> test program

So after some time away from this bug, I'm back onto it. The problem is that
the test program ends up using
GL_TEXTURE_2D type textures / GLX_TEXTURE_2D_EXT target, where it should be
using GL_TEXTURE_RECTANGLE_ARB.

The root cause for this seems to be that epoxy_has_glx_extension (dpy, screen,
"GL_ARB_texture_rectangle") always returns false, even though the extension is
there, as confirmed with both glxinfo and glxgears-info.

Now the extension in question is not a glx-extension, but a gl-extension, so
I've also tried calling:
epoxy_has_gl_extension ("GL_ARB_texture_rectangle") but that always returns
false too.

Simply forcing has_texture_rectangle = true to work around this (epoxy?) bug
actually results in the test program not working anywhere at all (tried both on
newer nvidia cards with nouveau and on intel gfx), not sure why. Can you
provide a version of the test program where setting has_texture_rectangle =
true actually works, or does this work for you ?

As for the fallback to GL_TEXTURE_2D / GLX_TEXTURE_2D_EXT not working on nv3x,
this is something which could likely be made to work, but that is quite a bit
of work and will be slow. I believe it would be better to first try to get
GL_TEXTURE_RECTANGLE_ARB to work, and then see if we still need to get
GL_TEXTURE_2D to work at all.

Also in the GL_TEXTURE_2D fallback path you should probably check for npot
support for 2d textures (rect textures always support npot) and if that is not
available refuse to do compositing at all.

Regards,

Hans

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445260419.edc8f0031.25910
Date: Mon, 19 Oct 2015 13:13:39 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c40">Comment # 40</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi All,

(In reply to Olivier Fourdan from <a href="show_bug.cgi?id=90871#c11">comment #11</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=116536" name="attach_116536" title="test program">attachment 116536</a> <a href="attachment.cgi?id=116536&amp;action=edit" title="test program">[details]</a></span>
&gt; test program</span >

So after some time away from this bug, I'm back onto it. The problem is that
the test program ends up using
GL_TEXTURE_2D type textures / GLX_TEXTURE_2D_EXT target, where it should be
using GL_TEXTURE_RECTANGLE_ARB.

The root cause for this seems to be that epoxy_has_glx_extension (dpy, screen,
&quot;GL_ARB_texture_rectangle&quot;) always returns false, even though the extension is
there, as confirmed with both glxinfo and glxgears-info.

Now the extension in question is not a glx-extension, but a gl-extension, so
I've also tried calling:
epoxy_has_gl_extension (&quot;GL_ARB_texture_rectangle&quot;) but that always returns
false too.

Simply forcing has_texture_rectangle = true to work around this (epoxy?) bug
actually results in the test program not working anywhere at all (tried both on
newer nvidia cards with nouveau and on intel gfx), not sure why. Can you
provide a version of the test program where setting has_texture_rectangle =
true actually works, or does this work for you ?

As for the fallback to GL_TEXTURE_2D / GLX_TEXTURE_2D_EXT not working on nv3x,
this is something which could likely be made to work, but that is quite a bit
of work and will be slow. I believe it would be better to first try to get
GL_TEXTURE_RECTANGLE_ARB to work, and then see if we still need to get
GL_TEXTURE_2D to work at all.

Also in the GL_TEXTURE_2D fallback path you should probably check for npot
support for 2d textures (rect textures always support npot) and if that is not
available refuse to do compositing at all.

Regards,

Hans</pre>
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

--1445260419.edc8f0031.25910--

--===============2107555439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2107555439==--
