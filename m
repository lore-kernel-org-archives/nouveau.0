From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37768] [NVA8] UT2003: Splash-screen is transparent
 with gnome-shell enabled
Date: Mon, 19 Aug 2013 14:44:02 +0000
Message-ID: <bug-37768-8800-P5U0hOedSm@http.bugs.freedesktop.org/>
References: <bug-37768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1306619546=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1306619546==
Content-Type: multipart/alternative; boundary="1376923441.deCa0.24645"; charset="us-ascii"


--1376923441.deCa0.24645
Date: Mon, 19 Aug 2013 14:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=37768

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you retest this with a more recent mesa (e.g. 9.1.6 or 9.2-git)? [And the
other stuff could stand an upgrade as well...]

In case that the problem persists, try to capture an apitrace, and see if the
problem still happens when you replay that apitrace
(https://github.com/apitrace/apitrace, although there are probably also distro
packages for it). If the problem happens with the apitrace, compress/upload it
to this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376923441.deCa0.24645
Date: Mon, 19 Aug 2013 14:44:01 +0000
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
   title="NEW --- - [NVA8] UT2003: Splash-screen is transparent with gnome-shell enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37768#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] UT2003: Splash-screen is transparent with gnome-shell enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37768">bug 37768</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you retest this with a more recent mesa (e.g. 9.1.6 or 9.2-git)? [And the
other stuff could stand an upgrade as well...]

In case that the problem persists, try to capture an apitrace, and see if the
problem still happens when you replay that apitrace
(<a href="https://github.com/apitrace/apitrace">https://github.com/apitrace/apitrace</a>, although there are probably also distro
packages for it). If the problem happens with the apitrace, compress/upload it
to this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376923441.deCa0.24645--

--===============1306619546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1306619546==--
