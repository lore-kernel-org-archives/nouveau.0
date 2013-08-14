From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64493] X server crashes when launch Savage XR
Date: Wed, 14 Aug 2013 23:03:39 +0000
Message-ID: <bug-64493-8800-psQitBrUWP@http.bugs.freedesktop.org/>
References: <bug-64493-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0256258171=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64493-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0256258171==
Content-Type: multipart/alternative; boundary="1376521419.dCdB1.11066"; charset="us-ascii"


--1376521419.dCdB1.11066
Date: Wed, 14 Aug 2013 23:03:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64493

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[  4863.494] (EE) Segmentation fault at address 0xde5

This is likely a simple null pointer dereference. Install the debug versions of
the libraries (xf86-video-nouveau, mesa, X), and run X inside gdb (or just use
gdb to look up where in the code it's dying based on the addresses it prints).

Not sure about the assertion that LIBGL_ALWAYS_SOFTWARE=1 + X crash = not a bug
in nouveau. There's still the ddx...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376521419.dCdB1.11066
Date: Wed, 14 Aug 2013 23:03:39 +0000
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
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493">bug 64493</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[  4863.494] (EE) Segmentation fault at address 0xde5

This is likely a simple null pointer dereference. Install the debug versions of
the libraries (xf86-video-nouveau, mesa, X), and run X inside gdb (or just use
gdb to look up where in the code it's dying based on the addresses it prints).

Not sure about the assertion that LIBGL_ALWAYS_SOFTWARE=1 + X crash = not a bug
in nouveau. There's still the ddx...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376521419.dCdB1.11066--

--===============0256258171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0256258171==--
