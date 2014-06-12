From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Thu, 12 Jun 2014 14:27:40 +0000
Message-ID: <bug-76732-8800-mg4lU7khHk@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1780545147=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1780545147==
Content-Type: multipart/alternative; boundary="1402583260.ae10bb843.29529"; charset="us-ascii"


--1402583260.ae10bb843.29529
Date: Thu, 12 Jun 2014 14:27:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #44 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So, the new kernel linked above definitely fixes the problem.

Hotplug now works flawlessly!

Unfortunately it introduces a fairly minor bug with X11 that seems to cause my
modelines to be invalid. I'm running on a retina macbook pro, and I normally
downscale the resolution by 50% so that i can actually read text on it, but my
xrandr lines in xinitrc now cause it to hang:

xrandr --newmode  "1440x900_60.00"  106.50  1440 1528 1672 1904  900 903 909
934 -hsync +vsync
xrandr --addmode $monitor 1440x900_60.00
xrandr --output $monitor --mode 1440x900_60.00

I'll check to see if these modelines are just invalid, or if this is just some
bug related to xrandr. It's clearly got something to do with the kernel though,
since it's no longer working.

Great work to all the devs who refactored this! One step closer to converting
my office to use linux on their MBPs :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402583260.ae10bb843.29529
Date: Thu, 12 Jun 2014 14:27:40 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>So, the new kernel linked above definitely fixes the problem.

Hotplug now works flawlessly!

Unfortunately it introduces a fairly minor bug with X11 that seems to cause my
modelines to be invalid. I'm running on a retina macbook pro, and I normally
downscale the resolution by 50% so that i can actually read text on it, but my
xrandr lines in xinitrc now cause it to hang:

xrandr --newmode  &quot;1440x900_60.00&quot;  106.50  1440 1528 1672 1904  900 903 909
934 -hsync +vsync
xrandr --addmode $monitor 1440x900_60.00
xrandr --output $monitor --mode 1440x900_60.00

I'll check to see if these modelines are just invalid, or if this is just some
bug related to xrandr. It's clearly got something to do with the kernel though,
since it's no longer working.

Great work to all the devs who refactored this! One step closer to converting
my office to use linux on their MBPs :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402583260.ae10bb843.29529--

--===============1780545147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1780545147==--
