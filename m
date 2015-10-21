From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Wed, 21 Oct 2015 08:45:30 +0000
Message-ID: <bug-90871-8800-ZVxle5mTda@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850457270=="
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


--===============1850457270==
Content-Type: multipart/alternative; boundary="1445417130.CAa8a6aA1.18155"; charset="UTF-8"


--1445417130.CAa8a6aA1.18155
Date: Wed, 21 Oct 2015 08:45:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #51 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
Hi,

(In reply to Ilia Mirkin from comment #48)
> or (b) make the assumption that rect support is an all-or-nothing thing -- either
> no configs have it or they all do, so no need to check it when evaluating
> fbconfig validity.

To be clear what Ilia is suggesting here (I believe) is to drop the entire
check for GL_ARB_texture_rectangle and instead only check the
GLX_TEXTURE_RECTANGLE_BIT_EXT bit in the value returned for
GLX_BIND_TO_TEXTURE_TARGETS_EXT, and if that is not set then check for
GLX_TEXTURE_2D_BIT_EXT

I agree with Ilia that this should work fine and should fix the detection
problem. Actually I was discussing this bug with Ben Skeggs a couple of day ago
and he suggested to do exactly this.

I can also confirm that with the glPushMatrix call in the right place, and the
rectangle support detection fixed things work fine on a nv34 card.

Regards,

Hans

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445417130.CAa8a6aA1.18155
Date: Wed, 21 Oct 2015 08:45:30 +0000
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
   title="RESOLVED NOTOURBUG - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c51">Comment # 51</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>Hi,

(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90871#c48">comment #48</a>)
<span class="quote">&gt; or (b) make the assumption that rect support is an all-or-nothing thing -- either
&gt; no configs have it or they all do, so no need to check it when evaluating
&gt; fbconfig validity.</span >

To be clear what Ilia is suggesting here (I believe) is to drop the entire
check for GL_ARB_texture_rectangle and instead only check the
GLX_TEXTURE_RECTANGLE_BIT_EXT bit in the value returned for
GLX_BIND_TO_TEXTURE_TARGETS_EXT, and if that is not set then check for
GLX_TEXTURE_2D_BIT_EXT

I agree with Ilia that this should work fine and should fix the detection
problem. Actually I was discussing this bug with Ben Skeggs a couple of day ago
and he suggested to do exactly this.

I can also confirm that with the glPushMatrix call in the right place, and the
rectangle support detection fixed things work fine on a nv34 card.

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

--1445417130.CAa8a6aA1.18155--

--===============1850457270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1850457270==--
