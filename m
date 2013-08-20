From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68075] nouveau inconsistent changing output
 connector names in xrandr
Date: Tue, 20 Aug 2013 16:13:38 +0000
Message-ID: <bug-68075-8800-MMV4JyDn1H@http.bugs.freedesktop.org/>
References: <bug-68075-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0344374543=="
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


--===============0344374543==
Content-Type: multipart/alternative; boundary="1377015218.7A0CF1.23828"; charset="us-ascii"


--1377015218.7A0CF1.23828
Date: Tue, 20 Aug 2013 16:13:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68075

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As far as I can see, everything's working totally fine from the kernel end.
There is one difference between the two "dvi plugged in at boot" cases, in that
in one, nouveau ends up as card0, in the other i915 does.

All the connectors seem fine, and are properly reporting status. There's
nothing funny in dmesg.

So... I think we should shift our attention to X. Can you attach your
Xorg.0.log for the same three cases? Although let's amend the first case ("no
dvi plugged in") to "no dvi plugged in at boot, then plugged in later" (since
that still functions, right).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377015218.7A0CF1.23828
Date: Tue, 20 Aug 2013 16:13:38 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68075#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau inconsistent changing output connector names in xrandr"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68075">bug 68075</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As far as I can see, everything's working totally fine from the kernel end.
There is one difference between the two &quot;dvi plugged in at boot&quot; cases, in that
in one, nouveau ends up as card0, in the other i915 does.

All the connectors seem fine, and are properly reporting status. There's
nothing funny in dmesg.

So... I think we should shift our attention to X. Can you attach your
Xorg.0.log for the same three cases? Although let's amend the first case (&quot;no
dvi plugged in&quot;) to &quot;no dvi plugged in at boot, then plugged in later&quot; (since
that still functions, right).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377015218.7A0CF1.23828--

--===============0344374543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0344374543==--
