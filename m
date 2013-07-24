From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Wed, 24 Jul 2013 11:58:49 +0000
Message-ID: <bug-58556-8800-78iWJvoBaR@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0155176626=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0155176626==
Content-Type: multipart/alternative; boundary="1374667129.7a2F812.18870"; charset="us-ascii"


--1374667129.7a2F812.18870
Date: Wed, 24 Jul 2013 11:58:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #6 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
(In reply to comment #5)
> Great find Matyas
> 
> If you're interested in cutting short the sequence you can forcepost the
> card, thus it should have you the suspend/resume trick. Use
> nouveau.config=NvForcePost=1
> 
> Curious if the above will give you acceleration or only a working
> output/monitor
> (ie. try it with and without noaccel=1)
> 
> Cheers

Hi,
On my MBP, if I do not use noaccel=1, then the whole system crashes.

I have tried NvForcePost=1 with noaccel, the result was a switched off screen,
but system seems to boot.
With accel, screen switches off and crashes.

Is there any config which would activate accel for 9400 but no accel for 9600?
This would be very helpful for me.

Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374667129.7a2F812.18870
Date: Wed, 24 Jul 2013 11:58:49 +0000
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
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c5">comment #5</a>)
<span class="quote">&gt; Great find Matyas
&gt; 
&gt; If you're interested in cutting short the sequence you can forcepost the
&gt; card, thus it should have you the suspend/resume trick. Use
&gt; nouveau.config=NvForcePost=1
&gt; 
&gt; Curious if the above will give you acceleration or only a working
&gt; output/monitor
&gt; (ie. try it with and without noaccel=1)
&gt; 
&gt; Cheers</span >

Hi,
On my MBP, if I do not use noaccel=1, then the whole system crashes.

I have tried NvForcePost=1 with noaccel, the result was a switched off screen,
but system seems to boot.
With accel, screen switches off and crashes.

Is there any config which would activate accel for 9400 but no accel for 9600?
This would be very helpful for me.

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374667129.7a2F812.18870--

--===============0155176626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0155176626==--
