From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforece 4
Date: Sun, 09 Feb 2014 08:29:23 +0000
Message-ID: <bug-54587-8800-AQfzFthgwe@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1654934311=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1654934311==
Content-Type: multipart/alternative; boundary="1391934563.Ddf83.10167"; charset="us-ascii"


--1391934563.Ddf83.10167
Date: Sun, 9 Feb 2014 08:29:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54587

--- Comment #30 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #29)
> Do you yourself have a geforce 4?

I have a NV18 (GeForce4 MX 400) PCI card which shows no such issues at
1920x1200 over VGA with nouveau. Your description of the problem reads like an
analog issue, which is why I went for the "do your cables suck" option :) But
if the same hw doesn't show the issue with other software, clearly nouveau is
at fault.

However... who knows why. Certainly bus timings are an option. Perhaps the IGP
is configured a little differently than the other stuff. Unfortunately the
current code to handle all that for pre-nv50 is basically a sequence of
semi-random writes to semi-random places. Take a look at
drivers/gpu/drm/nouveau/dispnv04/ to see what I mean.

Chances are that in order to get any movement on this issue, you will need to
make a mmiotrace of the nvidia driver setting the resolution. See
https://wiki.ubuntu.com/X/MMIOTracing for how to do that. With trace in hand,
one could then try to match it up with what dispnv04 does. Good times...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391934563.Ddf83.10167
Date: Sun, 9 Feb 2014 08:29:23 +0000
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
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV1F] Flickering screen on Geforece 4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54587">bug 54587</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54587#c29">comment #29</a>)
<span class="quote">&gt; Do you yourself have a geforce 4?</span >

I have a NV18 (GeForce4 MX 400) PCI card which shows no such issues at
1920x1200 over VGA with nouveau. Your description of the problem reads like an
analog issue, which is why I went for the &quot;do your cables suck&quot; option :) But
if the same hw doesn't show the issue with other software, clearly nouveau is
at fault.

However... who knows why. Certainly bus timings are an option. Perhaps the IGP
is configured a little differently than the other stuff. Unfortunately the
current code to handle all that for pre-nv50 is basically a sequence of
semi-random writes to semi-random places. Take a look at
drivers/gpu/drm/nouveau/dispnv04/ to see what I mean.

Chances are that in order to get any movement on this issue, you will need to
make a mmiotrace of the nvidia driver setting the resolution. See
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> for how to do that. With trace in hand,
one could then try to match it up with what dispnv04 does. Good times...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391934563.Ddf83.10167--

--===============1654934311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1654934311==--
