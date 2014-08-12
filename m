From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Tue, 12 Aug 2014 20:51:56 +0000
Message-ID: <bug-82527-8800-jdZJe6weJN@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0537938919=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0537938919==
Content-Type: multipart/alternative; boundary="1407876716.CeeDD2b1.19953"; charset="us-ascii"


--1407876716.CeeDD2b1.19953
Date: Tue, 12 Aug 2014 20:51:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82527

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The bug you reference was about DP. But display stuff got a substantial rework
in 3.16 (with an eye to DP) and even more changes are queued for 3.17. Would
you mind giving the linux-3.17 branch a shot
(http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.17)? If that
doesn't help, please provide a boot log with

nouveau.debug=VBIOS=trace,DISP=debug,I2C=debug,DRM=debug

in the kernel commandline (or otherwise passed to the module). Also mention how
the monitor is connected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407876716.CeeDD2b1.19953
Date: Tue, 12 Aug 2014 20:51:56 +0000
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
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527">bug 82527</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The bug you reference was about DP. But display stuff got a substantial rework
in 3.16 (with an eye to DP) and even more changes are queued for 3.17. Would
you mind giving the linux-3.17 branch a shot
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.17">http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.17</a>)? If that
doesn't help, please provide a boot log with

nouveau.debug=VBIOS=trace,DISP=debug,I2C=debug,DRM=debug

in the kernel commandline (or otherwise passed to the module). Also mention how
the monitor is connected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407876716.CeeDD2b1.19953--

--===============0537938919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0537938919==--
