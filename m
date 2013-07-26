From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61460] With Option     "NoAccel" "0", xorg fails...
Date: Fri, 26 Jul 2013 08:01:07 +0000
Message-ID: <bug-61460-8800-u3p1wSqcom@http.bugs.freedesktop.org/>
References: <bug-61460-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1215333478=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61460-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1215333478==
Content-Type: multipart/alternative; boundary="1374825667.D27d2223.10458"; charset="us-ascii"


--1374825667.D27d2223.10458
Date: Fri, 26 Jul 2013 08:01:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61460

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
It's not particularly clear (to me) where the bug is. Certainly there appears
to be an issue in the xf86-video-nouveau EXA implementation when the card dies,
it starts dereferencing NULL-ish pointers. However I think that the card dying
is the primary issue...

The bug here starts out with

[    6.760320] nouveau E[     DRM] GPU lockup - switching to software fbcon

before anything really happens, and then X starts, and PGRAPH is variously
freaking out. The nouveau GPU reset logic isn't so great... my experience is
that oftentimes only a reboot really fixes a GPU lockup. (Sometimes it's fine
though.)

In the altlinux.org bug there's also a GPU lockup detected, and it's not likely
to be due to the fact that X died, but rather the other way around. (Lockups
aren't necessarily detected immediately...)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374825667.D27d2223.10458
Date: Fri, 26 Jul 2013 08:01:07 +0000
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
   title="NEW --- - With Option &quot;NoAccel&quot; &quot;0&quot;, xorg fails..."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61460#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - With Option &quot;NoAccel&quot; &quot;0&quot;, xorg fails..."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61460">bug 61460</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>It's not particularly clear (to me) where the bug is. Certainly there appears
to be an issue in the xf86-video-nouveau EXA implementation when the card dies,
it starts dereferencing NULL-ish pointers. However I think that the card dying
is the primary issue...

The bug here starts out with

[    6.760320] nouveau E[     DRM] GPU lockup - switching to software fbcon

before anything really happens, and then X starts, and PGRAPH is variously
freaking out. The nouveau GPU reset logic isn't so great... my experience is
that oftentimes only a reboot really fixes a GPU lockup. (Sometimes it's fine
though.)

In the altlinux.org bug there's also a GPU lockup detected, and it's not likely
to be due to the fact that X died, but rather the other way around. (Lockups
aren't necessarily detected immediately...)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374825667.D27d2223.10458--

--===============1215333478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1215333478==--
