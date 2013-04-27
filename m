From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61953] arbitrary memory access corrupts kernel
 memory, eventually crashing the kernel
Date: Sat, 27 Apr 2013 10:33:42 +0000
Message-ID: <bug-61953-8800-RPtsnFpxBM@http.bugs.freedesktop.org/>
References: <bug-61953-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1810042167=="
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


--===============1810042167==
Content-Type: multipart/alternative; boundary="1367058822.CFA32.29899"; charset="us-ascii"


--1367058822.CFA32.29899
Date: Sat, 27 Apr 2013 10:33:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61953

--- Comment #10 from Adrian Knoth <adi-5gjw4BGRu82yAo/rNOIehoJPQCENF9+z@public.gmane.org> ---
(In reply to comment #9)

> I had Xephyr -dumb and ran ardour3 for three hours, something that has never
> been possible before on this machine (kernel crashes after 2-45mins).
> 
> It was also possible to run it without the -dumb flag, but I only tested it
> for 20 minutes, so that's not long enough for a definite answer.

Xephyr (without -dumb) successfully papering over the problem for days now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367058822.CFA32.29899
Date: Sat, 27 Apr 2013 10:33:42 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - arbitrary memory access corrupts kernel memory, eventually crashing the kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61953">bug 61953</a>
              from <span class="vcard"><a class="email" href="mailto:adi&#64;drcomp.erfurt.thur.de" title="Adrian Knoth &lt;adi&#64;drcomp.erfurt.thur.de&gt;"> <span class="fn">Adrian Knoth</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61953#c9">comment #9</a>)

<span class="quote">&gt; I had Xephyr -dumb and ran ardour3 for three hours, something that has never
&gt; been possible before on this machine (kernel crashes after 2-45mins).
&gt; 
&gt; It was also possible to run it without the -dumb flag, but I only tested it
&gt; for 20 minutes, so that's not long enough for a definite answer.</span >

Xephyr (without -dumb) successfully papering over the problem for days now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367058822.CFA32.29899--

--===============1810042167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1810042167==--
