From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74695] [NV86] GPU hangs on resume, causing X to crash
Date: Fri, 07 Feb 2014 22:15:41 +0000
Message-ID: <bug-74695-8800-cqALbetzEo@http.bugs.freedesktop.org/>
References: <bug-74695-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114484659=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74695-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1114484659==
Content-Type: multipart/alternative; boundary="1391811341.Ae023bEE2.29363"; charset="us-ascii"


--1391811341.Ae023bEE2.29363
Date: Fri, 7 Feb 2014 22:15:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74695

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Oh, I didn't notice you were already running 3.13 -- I highly doubt 3.13.x
would help. 3.14-rc1 MIGHT but that's a low chance.

An interesting observation is that your BSP engine refuses MMIO writes when
coming back from sleep, but it was fine on original boot. We're probably not
initializing something we should be... :( [The BSP engine in itself isn't that
important -- it's for h264 decoding, but it's an unfortunate indicator.]

And then you end up with a bunch of

[ 5298.803245] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020ea1200
on channel 0x0000fc33 [compiz[2007]] PGRAPH/DISPATCH/M2M_IN reason: NULL_DMAOBJ

Which eventually kill X as well.

It's not super-clear from your report, but did this work prior to Ubuntu 13.04?
If so, can you figure out what kernel version you were using back when it did
work?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391811341.Ae023bEE2.29363
Date: Fri, 7 Feb 2014 22:15:41 +0000
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
   title="NEW --- - [NV86] GPU hangs on resume, causing X to crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] GPU hangs on resume, causing X to crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74695">bug 74695</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Oh, I didn't notice you were already running 3.13 -- I highly doubt 3.13.x
would help. 3.14-rc1 MIGHT but that's a low chance.

An interesting observation is that your BSP engine refuses MMIO writes when
coming back from sleep, but it was fine on original boot. We're probably not
initializing something we should be... :( [The BSP engine in itself isn't that
important -- it's for h264 decoding, but it's an unfortunate indicator.]

And then you end up with a bunch of

[ 5298.803245] nouveau E[     PFB][0000:02:00.0] trapped read at 0x0020ea1200
on channel 0x0000fc33 [compiz[2007]] PGRAPH/DISPATCH/M2M_IN reason: NULL_DMAOBJ

Which eventually kill X as well.

It's not super-clear from your report, but did this work prior to Ubuntu 13.04?
If so, can you figure out what kernel version you were using back when it did
work?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391811341.Ae023bEE2.29363--

--===============1114484659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1114484659==--
