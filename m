From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Mon, 19 Oct 2015 21:46:14 +0000
Message-ID: <bug-90871-8800-y2rsFNGg7Z@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0223252395=="
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


--===============0223252395==
Content-Type: multipart/alternative; boundary="1445291174.E8aB1.1676"; charset="UTF-8"


--1445291174.E8aB1.1676
Date: Mon, 19 Oct 2015 21:46:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #42 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #41)
> (In reply to Hans de Goede from comment #40)
> > Hi All,
> > 
> > (In reply to Olivier Fourdan from comment #11)
> > > Created attachment 116536 [details]
> > > test program
> > 
> > So after some time away from this bug, I'm back onto it. The problem is that
> > the test program ends up using
> > GL_TEXTURE_2D type textures / GLX_TEXTURE_2D_EXT target, where it should be
> > using GL_TEXTURE_RECTANGLE_ARB.
> > 
> > The root cause for this seems to be that epoxy_has_glx_extension (dpy,
> > screen, "GL_ARB_texture_rectangle") always returns false, even though the
> > extension is there, as confirmed with both glxinfo and glxgears-info.
> 
> Er yeah, it's not a GLX ext, no reason it'd be coming up in the GLX ext
> list. While similarly-named, they're entirely separate namespaces.
> 
> > 
> > Now the extension in question is not a glx-extension, but a gl-extension, so
> > I've also tried calling:
> > epoxy_has_gl_extension ("GL_ARB_texture_rectangle") but that always returns
> > false too.
> 
> That's surprising.
> 
> src/mesa/main/extensions.c:   { "GL_ARB_texture_rectangle",                 
> o(NV_texture_rectangle),                    GL,             2004 },
> src/mesa/state_tracker/st_extensions.c:   extensions->NV_texture_rectangle =
> GL_TRUE;
> 
> So it should actually always be exposed for any st/mesa-backed dri driver
> (including nv30).

Right, so the issue is that this is done before a GL context is made current.
Fixing the code is annoying so I also just hard-coded it to be always-true. And
I also just get a gray screen now. The issue is that Redraw() doesn't account
for the fact that rect textures are non-normalized. I'm going to hack on this
for a bit.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445291174.E8aB1.1676
Date: Mon, 19 Oct 2015 21:46:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c42">Comment # 42</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90871#c41">comment #41</a>)
<span class="quote">&gt; (In reply to Hans de Goede from <a href="show_bug.cgi?id=90871#c40">comment #40</a>)
&gt; &gt; Hi All,
&gt; &gt; 
&gt; &gt; (In reply to Olivier Fourdan from <a href="show_bug.cgi?id=90871#c11">comment #11</a>)
&gt; &gt; &gt; Created <span class=""><a href="attachment.cgi?id=116536" name="attach_116536" title="test program">attachment 116536</a> <a href="attachment.cgi?id=116536&amp;action=edit" title="test program">[details]</a></span>
&gt; &gt; &gt; test program
&gt; &gt; 
&gt; &gt; So after some time away from this bug, I'm back onto it. The problem is that
&gt; &gt; the test program ends up using
&gt; &gt; GL_TEXTURE_2D type textures / GLX_TEXTURE_2D_EXT target, where it should be
&gt; &gt; using GL_TEXTURE_RECTANGLE_ARB.
&gt; &gt; 
&gt; &gt; The root cause for this seems to be that epoxy_has_glx_extension (dpy,
&gt; &gt; screen, &quot;GL_ARB_texture_rectangle&quot;) always returns false, even though the
&gt; &gt; extension is there, as confirmed with both glxinfo and glxgears-info.
&gt; 
&gt; Er yeah, it's not a GLX ext, no reason it'd be coming up in the GLX ext
&gt; list. While similarly-named, they're entirely separate namespaces.
&gt; 
&gt; &gt; 
&gt; &gt; Now the extension in question is not a glx-extension, but a gl-extension, so
&gt; &gt; I've also tried calling:
&gt; &gt; epoxy_has_gl_extension (&quot;GL_ARB_texture_rectangle&quot;) but that always returns
&gt; &gt; false too.
&gt; 
&gt; That's surprising.
&gt; 
&gt; src/mesa/main/extensions.c:   { &quot;GL_ARB_texture_rectangle&quot;,                 
&gt; o(NV_texture_rectangle),                    GL,             2004 },
&gt; src/mesa/state_tracker/st_extensions.c:   extensions-&gt;NV_texture_rectangle =
&gt; GL_TRUE;
&gt; 
&gt; So it should actually always be exposed for any st/mesa-backed dri driver
&gt; (including nv30).</span >

Right, so the issue is that this is done before a GL context is made current.
Fixing the code is annoying so I also just hard-coded it to be always-true. And
I also just get a gray screen now. The issue is that Redraw() doesn't account
for the fact that rect textures are non-normalized. I'm going to hack on this
for a bit.</pre>
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

--1445291174.E8aB1.1676--

--===============0223252395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0223252395==--
