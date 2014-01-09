From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 09 Jan 2014 23:06:05 +0000
Message-ID: <bug-58378-8800-rzOiO4YOhi@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1581836219=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1581836219==
Content-Type: multipart/alternative; boundary="1389308766.FbC45.19663"; charset="us-ascii"


--1389308766.FbC45.19663
Date: Thu, 9 Jan 2014 23:06:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #79 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
You're welcome! :-)

I did do this in my very own interest, because the OL6/RHEL6 install on my main
work laptop all of a sudden had this distortion issue when RHEL updated the
drm/nouveau module to an affected codebase in RHEL 6.5, so I definitely needed
a solution for this (other than get a new laptop)...

One final request from my side, as I don't have commercial RHEL6 support (I am
using the free OL6 clone):

Hoping that you have pretty good contact/access to Ben Skeggs (who I think
officially owns the nouveau modules at Red Hat), can you please approach him
and ask him to please take care of the fact that Red Hat also applies a
(backported) version of this patch to their mainline stock RHEL 6.5 kernels?

That would be great, as this is definitely needed to ensure that all those
people with the affected older/low-end NVIDIA notebook chips - such as myself
(and all the other now unfortunately silent people who initially created this
issue) - will no longer be affected by this issue in the current RHEL 6 kernels
(or don't need the explicit workaround using the kernel parameter PCRYPT=0)?

Thanks a million for your kind help & best regards from Germany,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389308766.FbC45.19663
Date: Thu, 9 Jan 2014 23:06:06 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c79">Comment # 79</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>You're welcome! :-)

I did do this in my very own interest, because the OL6/RHEL6 install on my main
work laptop all of a sudden had this distortion issue when RHEL updated the
drm/nouveau module to an affected codebase in RHEL 6.5, so I definitely needed
a solution for this (other than get a new laptop)...

One final request from my side, as I don't have commercial RHEL6 support (I am
using the free OL6 clone):

Hoping that you have pretty good contact/access to Ben Skeggs (who I think
officially owns the nouveau modules at Red Hat), can you please approach him
and ask him to please take care of the fact that Red Hat also applies a
(backported) version of this patch to their mainline stock RHEL 6.5 kernels?

That would be great, as this is definitely needed to ensure that all those
people with the affected older/low-end NVIDIA notebook chips - such as myself
(and all the other now unfortunately silent people who initially created this
issue) - will no longer be affected by this issue in the current RHEL 6 kernels
(or don't need the explicit workaround using the kernel parameter PCRYPT=0)?

Thanks a million for your kind help &amp; best regards from Germany,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389308766.FbC45.19663--

--===============1581836219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1581836219==--
