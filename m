From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Fri, 11 Sep 2015 14:41:58 +0000
Message-ID: <bug-90871-8800-NPfevVTM7Q@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1533046310=="
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


--===============1533046310==
Content-Type: multipart/alternative; boundary="1441982518.6bC2281.10315"; charset="UTF-8"


--1441982518.6bC2281.10315
Date: Fri, 11 Sep 2015 14:41:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #35 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi,

(In reply to Hans de Goede from comment #34)
> Ok' I've received this card now, and I can reproduce the problem. I'll
> investigate and try to fix this next week.

Ok, so as promised I've been investigating this one the last couple a days.

The fptest.c reproducer works to reproduce it, thanks.

At first I've tried different pitches / to swizzle / tile or not to tile on
various involved buffers on both the ddx and mesa side all to no good.

Today I had the bright idea (should have done that earlier) to run fptest
through apitrace and then glretrace, this resulted in the following messages:

27 @0 glXCreateWindow(dpy = 0x120b0f0, config = 0x125c9c0, win = 6291457, attri
27: warning: unsupported glXCreateWindow call
49: message: major api error 1: GL_INVALID_VALUE in glTexImage2D(invalid width
49 @0 glTexImage2D(target = GL_TEXTURE_2D, level = 0, internalformat = GL_RGBA,
49: warning: glGetError(glTexImage2D) = GL_INVALID_VALUE
88: message: major api error 1: GL_INVALID_VALUE in glTexImage2D(invalid width
88 @0 glTexImage2D(target = GL_TEXTURE_2D, level = 0, internalformat = GL_RGBA,
88: warning: glGetError(glTexImage2D) = GL_INVALID_VALUE
Rendered 2 frames in 0.0754768 secs, average of 26.4982 fps

The 27* messages are there when doing a glretrace on nv4x too, and the retrace
works fine on nv4x, so I believe that this warning can be ignored.

The problem is the next messages. It seems that something (not fptest directly)
is calling glTexImage2D with a npot width / height, where as nv3x is not npot
capable.

I'm a bit lost as to where this call is coming from, and as to whether or not
this is a fptest issue, or an issue with the code which is actually making the
glTexImage2D call. I'll ask Ben / Ilia for help.

Regards,

Hans

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441982518.6bC2281.10315
Date: Fri, 11 Sep 2015 14:41:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
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
           <td>NEW
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi,

(In reply to Hans de Goede from <a href="show_bug.cgi?id=90871#c34">comment #34</a>)
<span class="quote">&gt; Ok' I've received this card now, and I can reproduce the problem. I'll
&gt; investigate and try to fix this next week.</span >

Ok, so as promised I've been investigating this one the last couple a days.

The fptest.c reproducer works to reproduce it, thanks.

At first I've tried different pitches / to swizzle / tile or not to tile on
various involved buffers on both the ddx and mesa side all to no good.

Today I had the bright idea (should have done that earlier) to run fptest
through apitrace and then glretrace, this resulted in the following messages:

27 &#64;0 glXCreateWindow(dpy = 0x120b0f0, config = 0x125c9c0, win = 6291457, attri
27: warning: unsupported glXCreateWindow call
49: message: major api error 1: GL_INVALID_VALUE in glTexImage2D(invalid width
49 &#64;0 glTexImage2D(target = GL_TEXTURE_2D, level = 0, internalformat = GL_RGBA,
49: warning: glGetError(glTexImage2D) = GL_INVALID_VALUE
88: message: major api error 1: GL_INVALID_VALUE in glTexImage2D(invalid width
88 &#64;0 glTexImage2D(target = GL_TEXTURE_2D, level = 0, internalformat = GL_RGBA,
88: warning: glGetError(glTexImage2D) = GL_INVALID_VALUE
Rendered 2 frames in 0.0754768 secs, average of 26.4982 fps

The 27* messages are there when doing a glretrace on nv4x too, and the retrace
works fine on nv4x, so I believe that this warning can be ignored.

The problem is the next messages. It seems that something (not fptest directly)
is calling glTexImage2D with a npot width / height, where as nv3x is not npot
capable.

I'm a bit lost as to where this call is coming from, and as to whether or not
this is a fptest issue, or an issue with the code which is actually making the
glTexImage2D call. I'll ask Ben / Ilia for help.

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

--1441982518.6bC2281.10315--

--===============1533046310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1533046310==--
