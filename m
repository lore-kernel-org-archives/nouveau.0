From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Fri, 29 Mar 2013 20:12:08 +0000
Message-ID: <bug-61953-8800-dEK2nNFD7C@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1062431228=="
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


--===============1062431228==
Content-Type: multipart/alternative; boundary="1364587928.484aab02.6152"; charset="us-ascii"


--1364587928.484aab02.6152
Date: Fri, 29 Mar 2013 20:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #6 from Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> ---
(In reply to comment #5)
> Unaffected: Kernel 3.2.x and before

Correction, 3.2.x is affected, too.

On earlier 3.2.x kernels (sorry for the lack of precision), it takes weeks to
trigger the bug, but with the recent update in Debian unstable (3.2.42-2), it
crashes as fast as hand-rolled 3.8.x (and basically every version in between).


For the sake of reproducibility, is there a tool that mimics the behaviour of a
GTK canvas? Or basically something to allocate video memory from the X server
and then moving this area around?

I've noticed that especially hover effects (images that change on onMouseOver)
in chromium are among the first elements to show screen corruption. My
hypothesis is that these elements are already rendered off-screen and then
moved to the visible area. During this process (off-screen rendering or
moving), something goes wrong.

And maybe this something has the potential to write at arbitrary physical
addresses.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364587928.484aab02.6152
Date: Fri, 29 Mar 2013 20:12:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:adi&#64;drcomp.erfurt.thur.de" title="Adrian Knoth &lt;adi&#64;drcomp.erfurt.thur.de&gt;"> <span class="fn">Adrian Knoth</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61953#c5">comment #5</a>)
<span class="quote">&gt; Unaffected: Kernel 3.2.x and before</span >

Correction, 3.2.x is affected, too.

On earlier 3.2.x kernels (sorry for the lack of precision), it takes weeks to
trigger the bug, but with the recent update in Debian unstable (3.2.42-2), it
crashes as fast as hand-rolled 3.8.x (and basically every version in between).


For the sake of reproducibility, is there a tool that mimics the behaviour of a
GTK canvas? Or basically something to allocate video memory from the X server
and then moving this area around?

I've noticed that especially hover effects (images that change on onMouseOver)
in chromium are among the first elements to show screen corruption. My
hypothesis is that these elements are already rendered off-screen and then
moved to the visible area. During this process (off-screen rendering or
moving), something goes wrong.

And maybe this something has the potential to write at arbitrary physical
addresses.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364587928.484aab02.6152--

--===============1062431228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1062431228==--
