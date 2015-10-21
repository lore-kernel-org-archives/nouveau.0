From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Wed, 21 Oct 2015 08:39:46 +0000
Message-ID: <bug-90871-8800-xN3ClIcD2n@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0190102809=="
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


--===============0190102809==
Content-Type: multipart/alternative; boundary="1445416786.dDE5fa11.16185"; charset="UTF-8"


--1445416786.dDE5fa11.16185
Date: Wed, 21 Oct 2015 08:39:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #49 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Olivier Fourdan from comment #47)
> Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
> and Poma will be able to test I guess.

Looking at http://git.xfce.org/xfce/xfwm4/tree/src/compositor.c, you have at
least the following issues:

    screen_info->has_texture_rectangle =
        epoxy_has_glx_extension (myScreenGetXDisplay (screen_info),
                                 screen_info->screen,
                                 "GL_ARB_texture_rectangle");

    screen_info->has_texture_non_power_of_two =
        epoxy_has_glx_extension (myScreenGetXDisplay (screen_info),
                                 screen_info->screen,
                                 "GL_ARB_texture_non_power_of_two");

These are not GLX exts, they are GL exts, so you have to use
epoxy_has_gl_extension. However you have to make sure that a GL context is
active (i.e. glXMakeCurrent) before trying to do epoxy_has_gl_extension.

redraw_glx_texture -- this needs to add a width/height scale to the GL_TEXTURE
matrix for rect textures, since they use non-normalized coordinates. This
probably never came up before since the checks above didn't succeed.

If you don't have has_texture_rectangle *and* you don't have
has_texture_non_power_of_two that means that you can only use POT sized pixmaps
with GL_TEXTURE_2D. Probably not worth supporting that. AFAIK ~every driver
supports ARB_texture_rectangle... except seemingly nv04 (but nv10+ has it).

Marking this as NOTOURBUG for now, if issues persist, feel free to open a new
issue.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445416786.dDE5fa11.16185
Date: Wed, 21 Oct 2015 08:39:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>ASSIGNED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href="show_bug.cgi?id=90871#c47">comment #47</a>)
<span class="quote">&gt; Yes, most likely. This code is still early beta in xfwm4. I'll try to fix it
&gt; and Poma will be able to test I guess.</span >

Looking at <a href="http://git.xfce.org/xfce/xfwm4/tree/src/compositor.c">http://git.xfce.org/xfce/xfwm4/tree/src/compositor.c</a>, you have at
least the following issues:

    screen_info-&gt;has_texture_rectangle =
        epoxy_has_glx_extension (myScreenGetXDisplay (screen_info),
                                 screen_info-&gt;screen,
                                 &quot;GL_ARB_texture_rectangle&quot;);

    screen_info-&gt;has_texture_non_power_of_two =
        epoxy_has_glx_extension (myScreenGetXDisplay (screen_info),
                                 screen_info-&gt;screen,
                                 &quot;GL_ARB_texture_non_power_of_two&quot;);

These are not GLX exts, they are GL exts, so you have to use
epoxy_has_gl_extension. However you have to make sure that a GL context is
active (i.e. glXMakeCurrent) before trying to do epoxy_has_gl_extension.

redraw_glx_texture -- this needs to add a width/height scale to the GL_TEXTURE
matrix for rect textures, since they use non-normalized coordinates. This
probably never came up before since the checks above didn't succeed.

If you don't have has_texture_rectangle *and* you don't have
has_texture_non_power_of_two that means that you can only use POT sized pixmaps
with GL_TEXTURE_2D. Probably not worth supporting that. AFAIK ~every driver
supports ARB_texture_rectangle... except seemingly nv04 (but nv10+ has it).

Marking this as NOTOURBUG for now, if issues persist, feel free to open a new
issue.</pre>
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

--1445416786.dDE5fa11.16185--

--===============0190102809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0190102809==--
