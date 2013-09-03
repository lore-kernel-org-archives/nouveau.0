From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 03 Sep 2013 17:54:59 +0000
Message-ID: <bug-68075-8800-A1vPpKEgaL@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511176178=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68075-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1511176178==
Content-Type: multipart/alternative; boundary="1378230899.f11776C1.4191"; charset="us-ascii"


--1378230899.f11776C1.4191
Date: Tue, 3 Sep 2013 17:54:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68075

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you provide the segfault backtrace? Is it in nouveau code, or in xorg code?
(Would be great if you could also make sure to get the segfault on binaries
with debug symbols.)

Are you still getting the original issue of "no outputs detected"... or
whatever it was (sorry, I'm being lazy about re-reading the old notes)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378230899.f11776C1.4191
Date: Tue, 3 Sep 2013 17:54:59 +0000
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
   title="NEW --- - nouveau inconsistent changing output connector names in xrandr"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68075#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau inconsistent changing output connector names in xrandr"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68075">bug 68075</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you provide the segfault backtrace? Is it in nouveau code, or in xorg code?
(Would be great if you could also make sure to get the segfault on binaries
with debug symbols.)

Are you still getting the original issue of &quot;no outputs detected&quot;... or
whatever it was (sorry, I'm being lazy about re-reading the old notes)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378230899.f11776C1.4191--

--===============1511176178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1511176178==--
