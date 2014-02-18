From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75094] NV92 is faster and runs games fine than NVE6,
	why?
Date: Tue, 18 Feb 2014 19:19:14 +0000
Message-ID: <bug-75094-8800-tpTLn2dhon@http.bugs.freedesktop.org/>
References: <bug-75094-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0339915407=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75094-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0339915407==
Content-Type: multipart/alternative; boundary="1392751154.3BDFCb1.19490"; charset="us-ascii"


--1392751154.3BDFCb1.19490
Date: Tue, 18 Feb 2014 19:19:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75094

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #3)
> A pose this question only to make things more clear to me, because I own a
> 650TI, too. I have the following dmesg output during boot:
> 
> nouveau  [     DRM] 4 available performance level(s)
> nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz voltage 100mV
> nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz voltage 80mV
> nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory 1080MHz voltage
> 60mV
> nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory 1080MHz voltage
> 40mV

With newer kernels (3.13+), the output is a little different and you'll also
see a 'c' line which indicates the current speed. (I believe with pre-3.13 you
also saw a 'c' line but it was probably empty for Kepler cards.) I'm not sure
how accurate those readouts are for kepler on pre-3.13.

Like I said, nouveau can't change clock frequencies, so it'll be in whatever
level the vbios leaves it in. (Which might not be one of the listed levels at
all!) Often, for Fermi and newer, it's the lowest or second-lowest one.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392751154.3BDFCb1.19490
Date: Tue, 18 Feb 2014 19:19:14 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094">bug 75094</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75094#c3">comment #3</a>)
<span class="quote">&gt; A pose this question only to make things more clear to me, because I own a
&gt; 650TI, too. I have the following dmesg output during boot:
&gt; 
&gt; nouveau  [     DRM] 4 available performance level(s)
&gt; nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz voltage 100mV
&gt; nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz voltage 80mV
&gt; nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory 1080MHz voltage
&gt; 60mV
&gt; nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory 1080MHz voltage
&gt; 40mV</span >

With newer kernels (3.13+), the output is a little different and you'll also
see a 'c' line which indicates the current speed. (I believe with pre-3.13 you
also saw a 'c' line but it was probably empty for Kepler cards.) I'm not sure
how accurate those readouts are for kepler on pre-3.13.

Like I said, nouveau can't change clock frequencies, so it'll be in whatever
level the vbios leaves it in. (Which might not be one of the listed levels at
all!) Often, for Fermi and newer, it's the lowest or second-lowest one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392751154.3BDFCb1.19490--

--===============0339915407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0339915407==--
