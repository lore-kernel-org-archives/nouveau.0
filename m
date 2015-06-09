From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90871] NV30: Xfwm4 use_compositing - garbled display
Date: Tue, 09 Jun 2015 00:53:45 +0000
Message-ID: <bug-90871-8800-WMTjWPlAZB@http.bugs.freedesktop.org/>
References: <bug-90871-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272142360=="
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


--===============1272142360==
Content-Type: multipart/alternative; boundary="1433786025.bFc8Aac1.18078"; charset="UTF-8"


--1433786025.bFc8Aac1.18078
Date: Mon, 8 Jun 2015 10:53:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90871

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

What I actually wanted to write,
epoxy support is related to the usage, enablement of the OpenGL, right?
And here it is about compositing part.
If I understood this library simplifies writing code related to OpenGL.

About distro versions "regression",
I expected the Xorg/Mesa/libdrm from Fedora 21 to work also on Fedora 22,
but surprise, surprise, it didn't happen.

I tested also
[Mesa-announce] Mesa 10.5.7
http://lists.freedesktop.org/archives/mesa-announce/2015-June/000157.html
No effect positivo.

Also it is not possible to test whether the NV30 works with 'modesetting':

Driver "modesetting"
~~~~~~
Require OpenGL version 2.1 or later.
(EE) modeset(0): Failed to initialize glamor at ScreenInit() time.
(EE) 
Fatal server error:
(EE) AddScreen/ScreenInit failed for driver 0
(EE) 
(EE) Server terminated with error (1). Closing log file.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Driver "modesetting"
Option "AccelMethod" "none"
~~~~~~
(II) AIGLX: Screen 0 is not DRI2 capable
(EE) AIGLX: reverting to software rendering
(II) AIGLX: Loaded and initialized swrast
(II) GLX: Initialized DRISWRAST GL provider for screen 0
(EE) 
Fatal server error:
(EE) failed to create screen resources(EE) 
(EE) Server terminated with error (1). Closing log file.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Therefore for now I can not conclude what this is all about.
At least Xpresent rendering works, although "serrated" - not quite tear-free.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1433786025.bFc8Aac1.18078
Date: Mon, 8 Jun 2015 10:53:45 -0700
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
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: Xfwm4 use_compositing - garbled display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90871">bug 90871</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
What I actually wanted to write,
epoxy support is related to the usage, enablement of the OpenGL, right?
And here it is about compositing part.
If I understood this library simplifies writing code related to OpenGL.

About distro versions &quot;regression&quot;,
I expected the Xorg/Mesa/libdrm from Fedora 21 to work also on Fedora 22,
but surprise, surprise, it didn't happen.

I tested also
[Mesa-announce] Mesa 10.5.7
<a href="http://lists.freedesktop.org/archives/mesa-announce/2015-June/000157.html">http://lists.freedesktop.org/archives/mesa-announce/2015-June/000157.html</a>
No effect positivo.

Also it is not possible to test whether the NV30 works with 'modesetting':

Driver &quot;modesetting&quot;
~~~~~~
Require OpenGL version 2.1 or later.
(EE) modeset(0): Failed to initialize glamor at ScreenInit() time.
(EE) 
Fatal server error:
(EE) AddScreen/ScreenInit failed for driver 0
(EE) 
(EE) Server terminated with error (1). Closing log file.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Driver &quot;modesetting&quot;
Option &quot;AccelMethod&quot; &quot;none&quot;
~~~~~~
(II) AIGLX: Screen 0 is not DRI2 capable
(EE) AIGLX: reverting to software rendering
(II) AIGLX: Loaded and initialized swrast
(II) GLX: Initialized DRISWRAST GL provider for screen 0
(EE) 
Fatal server error:
(EE) failed to create screen resources(EE) 
(EE) Server terminated with error (1). Closing log file.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Therefore for now I can not conclude what this is all about.
At least Xpresent rendering works, although &quot;serrated&quot; - not quite tear-free.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1433786025.bFc8Aac1.18078--

--===============1272142360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1272142360==--
