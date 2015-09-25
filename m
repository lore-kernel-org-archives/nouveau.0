From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Fri, 25 Sep 2015 14:41:40 +0000
Message-ID: <bug-90871-8800-D76FYZ6Qyy@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1087019866=="
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


--===============1087019866==
Content-Type: multipart/alternative; boundary="1443192100.CDafAf41.31123"; charset="UTF-8"


--1443192100.CDafAf41.31123
Date: Fri, 25 Sep 2015 14:41:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #38 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to Hans de Goede from comment #35)
> The problem is the next messages. It seems that something (not fptest
> directly) is calling glTexImage2D with a npot width / height, where as nv3x
> is not npot capable.

I've been working on getting to the bottom of this one. The NPOT problem
is only part of the story (and can be worked around I believe)

The real problem seems to be that nv3x cards only support swizzled textures
and not linear ones. This makes it sorta hard to do texture-from-pixmap.
Specifically when trying to use glXBindTexImageEXT with a local client we
end up in gallium/state_trackers/dri/dri_drawable.c: dri_set_tex_buffer2()
which calls nv30_miptree_from_handle() on the first call on a certain pixmap
and is a nop after that.
dri_set_tex_buffer2() does call drawable->update_tex_buffer() every time but
that currently is a nop

There are 2 possible solutions here:
1) Make nv30_miptree_from_handle() create a new bo rather then calling
   bo_from_handle() when called to create a texture (rather then a front /
   back buffer), and override the default nop drawable->update_tex_buffer()
   with a function calling nv30_transfer_rect to copy the linear pixmap
   data into the swizzled texture we've newly allocated
2) Solution one involves a blit, so is not going to be very fast, so
   alternatively we could simply stop claiming that GLX_EXT_texture_from_pixmap
   is supported on nv3x (it does work on nv4x already as that has support
   for linear textures)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1443192100.CDafAf41.31123
Date: Fri, 25 Sep 2015 14:41:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to Hans de Goede from <a href="show_bug.cgi?id=90871#c35">comment #35</a>)
<span class="quote">&gt; The problem is the next messages. It seems that something (not fptest
&gt; directly) is calling glTexImage2D with a npot width / height, where as nv3x
&gt; is not npot capable.</span >

I've been working on getting to the bottom of this one. The NPOT problem
is only part of the story (and can be worked around I believe)

The real problem seems to be that nv3x cards only support swizzled textures
and not linear ones. This makes it sorta hard to do texture-from-pixmap.
Specifically when trying to use glXBindTexImageEXT with a local client we
end up in gallium/state_trackers/dri/dri_drawable.c: dri_set_tex_buffer2()
which calls nv30_miptree_from_handle() on the first call on a certain pixmap
and is a nop after that.
dri_set_tex_buffer2() does call drawable-&gt;update_tex_buffer() every time but
that currently is a nop

There are 2 possible solutions here:
1) Make nv30_miptree_from_handle() create a new bo rather then calling
   bo_from_handle() when called to create a texture (rather then a front /
   back buffer), and override the default nop drawable-&gt;update_tex_buffer()
   with a function calling nv30_transfer_rect to copy the linear pixmap
   data into the swizzled texture we've newly allocated
2) Solution one involves a blit, so is not going to be very fast, so
   alternatively we could simply stop claiming that GLX_EXT_texture_from_pixmap
   is supported on nv3x (it does work on nv4x already as that has support
   for linear textures)</pre>
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

--1443192100.CDafAf41.31123--

--===============1087019866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1087019866==--
