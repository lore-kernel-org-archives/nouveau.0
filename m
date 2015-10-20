From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 20 Oct 2015 17:36:05 +0000
Message-ID: <bug-90871-8800-pl5hXooaXG@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0806975383=="
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


--===============0806975383==
Content-Type: multipart/alternative; boundary="1445362565.A6baC2101.30153"; charset="UTF-8"


--1445362565.A6baC2101.30153
Date: Tue, 20 Oct 2015 17:36:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #46 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Hans de Goede from comment #44)
> Hi Ilia,
> 
> (In reply to Ilia Mirkin from comment #43)
> > Created attachment 118995 [details]
> > updated test program
> > 
> > With this I get the same results whether I set has_texture_rectangle = 1 or
> > 0. Attached the full updated source file, or use the patch below.
> 
> Thanks for the updated test program, this seems to fix things on nv3x. There
> still is an issue with then test program though (also reproduced on intel
> gfx) the program is supposed to change the color of the "box" when you click
> a mouse button (pressing a key exits the program), but currently when using
> rectangle textures it draws a red box on startup and then on a mouse click
> everything goes gray, where as the box should turn blue. As said this
> happens on intel gfx too, so I think there still is an issue with the test
> program when using rectangle textures.

Just my incompetence -- glMatrixMode has to go *before* glPushMatrix, not
after. Oops. Moving it up makes the program behave as expected, at least on
intel/hsw.

> 
> As for epoxy not seeing the extension, I believe that that is an epoxy
> issue, as said the extension is clearly listed in both glxinfo and glxgears
> -info output.

Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
before calling gl functions, which means their output is invalid. Not an epoxy
issue. Rearranging the test program's code to fix this is annoying though.

I wonder if this is a real issue in xfwm code as well.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1445362565.A6baC2101.30153
Date: Tue, 20 Oct 2015 17:36:05 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c46">Comment # 46</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Hans de Goede from <a href="show_bug.cgi?id=90871#c44">comment #44</a>)
<span class="quote">&gt; Hi Ilia,
&gt; 
&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90871#c43">comment #43</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=118995" name="attach_118995" title="updated test program">attachment 118995</a> <a href="attachment.cgi?id=118995&amp;action=edit" title="updated test program">[details]</a></span>
&gt; &gt; updated test program
&gt; &gt; 
&gt; &gt; With this I get the same results whether I set has_texture_rectangle = 1 or
&gt; &gt; 0. Attached the full updated source file, or use the patch below.
&gt; 
&gt; Thanks for the updated test program, this seems to fix things on nv3x. There
&gt; still is an issue with then test program though (also reproduced on intel
&gt; gfx) the program is supposed to change the color of the &quot;box&quot; when you click
&gt; a mouse button (pressing a key exits the program), but currently when using
&gt; rectangle textures it draws a red box on startup and then on a mouse click
&gt; everything goes gray, where as the box should turn blue. As said this
&gt; happens on intel gfx too, so I think there still is an issue with the test
&gt; program when using rectangle textures.</span >

Just my incompetence -- glMatrixMode has to go *before* glPushMatrix, not
after. Oops. Moving it up makes the program behave as expected, at least on
intel/hsw.

<span class="quote">&gt; 
&gt; As for epoxy not seeing the extension, I believe that that is an epoxy
&gt; issue, as said the extension is clearly listed in both glxinfo and glxgears
&gt; -info output.</span >

Pretty sure it's what I said -- the test program doesn't do a glXMakeCurrent
before calling gl functions, which means their output is invalid. Not an epoxy
issue. Rearranging the test program's code to fix this is annoying though.

I wonder if this is a real issue in xfwm code as well.</pre>
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

--1445362565.A6baC2101.30153--

--===============0806975383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0806975383==--
