From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Mon, 08 Apr 2013 20:39:25 +0000
Message-ID: <bug-61953-8800-mU7DveCZQ1@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0058828762=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61953-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0058828762==
Content-Type: multipart/alternative; boundary="1365453565.31E0ceA2.811"; charset="us-ascii"


--1365453565.31E0ceA2.811
Date: Mon, 8 Apr 2013 20:39:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #7 from Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> ---
(In reply to comment #6)

> I've noticed that especially hover effects (images that change on
> onMouseOver) in chromium are among the first elements to show screen
> corruption.

I guess we can remove the chromium hover corruption, it's a chromium bug which
is present on other video drivers (radeon, NVIDIA blob), too:


    https://code.google.com/p/chromium/issues/detail?id=227447


However, there is still some correlation with the video driver: if I disable
the flashplugin in chromium or stop using chromium altogether, the kernel
corruption occurs *much* later. So the original hypothesis still stands that
some apps (ardour3, maybe also libreoffice) can write to arbitrary physical
memory on my nouveau-based system.

A short test with the NVIDIA blob did not exhibit this issue, but I'd need to
run for several days to be sure.

Maybe a power management issue? (memory timing?)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365453565.31E0ceA2.811
Date: Mon, 8 Apr 2013 20:39:25 +0000
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
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:adi&#64;drcomp.erfurt.thur.de" title="Adrian Knoth &lt;adi&#64;drcomp.erfurt.thur.de&gt;"> <span class="fn">Adrian Knoth</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61953#c6">comment #6</a>)

<span class="quote">&gt; I've noticed that especially hover effects (images that change on
&gt; onMouseOver) in chromium are among the first elements to show screen
&gt; corruption.</span >

I guess we can remove the chromium hover corruption, it's a chromium bug which
is present on other video drivers (radeon, NVIDIA blob), too:


    <a href="https://code.google.com/p/chromium/issues/detail?id=227447">https://code.google.com/p/chromium/issues/detail?id=227447</a>


However, there is still some correlation with the video driver: if I disable
the flashplugin in chromium or stop using chromium altogether, the kernel
corruption occurs *much* later. So the original hypothesis still stands that
some apps (ardour3, maybe also libreoffice) can write to arbitrary physical
memory on my nouveau-based system.

A short test with the NVIDIA blob did not exhibit this issue, but I'd need to
run for several days to be sure.

Maybe a power management issue? (memory timing?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365453565.31E0ceA2.811--

--===============0058828762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0058828762==--
