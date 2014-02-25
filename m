From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34220] Detects Load on output and blinks screen
	every ~30secs
Date: Tue, 25 Feb 2014 22:51:37 +0000
Message-ID: <bug-34220-8800-vVcy53ch2s@http.bugs.freedesktop.org/>
References: <bug-34220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0421807904=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0421807904==
Content-Type: multipart/alternative; boundary="1393368697.2BdA6AD5.4697"; charset="us-ascii"


--1393368697.2BdA6AD5.4697
Date: Tue, 25 Feb 2014 22:51:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=34220

--- Comment #12 from johnlu best <johnlubest-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> Sounds like the bug here is that nouveau causes the VGA display to blink
> on/off when checking whether it is connected. (And, to exacerbate the issue,
> there's something polling every 30s to see if the monitor is connected/what
> modes it has or something.)
> 
> Could someone with an affected monitor try to
> 
> cat /sys/class/drm/card0-VGA-0/(In reply to comment #11)
> Sounds like the bug here is that nouveau causes the VGA display to blink
> on/off when checking whether it is connected. (And, to exacerbate the issue,
> there's something polling every 30s to see if the monitor is connected/what
> modes it has or something.)
> 
> Could someone with an affected monitor try to
> 
> cat /sys/class/drm/card0-VGA-0/status
> 
> (or whatever card/connector the thing is on)
> 
> and see if that action causes the monitor to blink on/off? If not, check
> /sys/.../modes and .../edid and .../dpms. I'm guessing at least one of those
> will cause the blinking issue.
> 
> My understanding of the VGA DDC stuff is that the monitor doesn't even have
> to be powered on in order to get at that stuff (I guess power is supplied in
> the VGA cable itself), much less have to try to show a picture. Although
> perhaps not all monitors comply with that ideal.
> 
> BTW, please be sure to test it out with the latest kernel, just in case this
> has been fixed.

I can confirm that blinking issue after cat /sys/class/drm/card0-VGA-0/status
every ~30 seconds. I'm using nvidia 7300 gt. do you need more data?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393368697.2BdA6AD5.4697
Date: Tue, 25 Feb 2014 22:51:37 +0000
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
   title="NEW --- - Detects Load on output and blinks screen every ~30secs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34220#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Detects Load on output and blinks screen every ~30secs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34220">bug 34220</a>
              from <span class="vcard"><a class="email" href="mailto:johnlubest&#64;yahoo.com" title="johnlu best &lt;johnlubest&#64;yahoo.com&gt;"> <span class="fn">johnlu best</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=34220#c11">comment #11</a>)
<span class="quote">&gt; Sounds like the bug here is that nouveau causes the VGA display to blink
&gt; on/off when checking whether it is connected. (And, to exacerbate the issue,
&gt; there's something polling every 30s to see if the monitor is connected/what
&gt; modes it has or something.)
&gt; 
&gt; Could someone with an affected monitor try to
&gt; 
&gt; cat /sys/class/drm/card0-VGA-0/(In reply to <a href="show_bug.cgi?id=34220#c11">comment #11</a>)
&gt; Sounds like the bug here is that nouveau causes the VGA display to blink
&gt; on/off when checking whether it is connected. (And, to exacerbate the issue,
&gt; there's something polling every 30s to see if the monitor is connected/what
&gt; modes it has or something.)
&gt; 
&gt; Could someone with an affected monitor try to
&gt; 
&gt; cat /sys/class/drm/card0-VGA-0/status
&gt; 
&gt; (or whatever card/connector the thing is on)
&gt; 
&gt; and see if that action causes the monitor to blink on/off? If not, check
&gt; /sys/.../modes and .../edid and .../dpms. I'm guessing at least one of those
&gt; will cause the blinking issue.
&gt; 
&gt; My understanding of the VGA DDC stuff is that the monitor doesn't even have
&gt; to be powered on in order to get at that stuff (I guess power is supplied in
&gt; the VGA cable itself), much less have to try to show a picture. Although
&gt; perhaps not all monitors comply with that ideal.
&gt; 
&gt; BTW, please be sure to test it out with the latest kernel, just in case this
&gt; has been fixed.</span >

I can confirm that blinking issue after cat /sys/class/drm/card0-VGA-0/status
every ~30 seconds. I'm using nvidia 7300 gt. do you need more data?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393368697.2BdA6AD5.4697--

--===============0421807904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0421807904==--
