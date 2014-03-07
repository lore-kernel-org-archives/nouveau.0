From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Fri, 07 Mar 2014 08:53:04 +0000
Message-ID: <bug-58556-8800-NALiCwbNJU@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1252652632=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1252652632==
Content-Type: multipart/alternative; boundary="1394182383.3AcecBBD4.14628"; charset="us-ascii"


--1394182383.3AcecBBD4.14628
Date: Fri, 7 Mar 2014 08:53:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #23 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
(In reply to comment #22)
> Using commit e18833a518777e249b6badf54f65b37b741b6864
> (http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=e18833a518777e249b6badf54f65b37b741b6864) fixes the issue (tested on Git
> HEAD and on 3.13.5).
> Thanks for the pointer Ilia!

Hi Pierre,
I have tried the diff patch (3 changed lines) on  Kernel 3.13.5-gentoo, and did
a quick test on nVidia 9600m GT: The screen gets scrambled as soon as nouveau
is loaded. At the startup, EFIFB is used and works with full screen resolution,
but the colors are "incorrect". EFI is setup to use 9600m as default.

I am still using nouveau without acceleration. I will be testing the patched
Kernel on nVidia 9400m, by modifying EFI to use 9400m as default.

Could you do a diff on your patched kernel and unpatched, so that we could find
other differences?

Thanks.

BR

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394182383.3AcecBBD4.14628
Date: Fri, 7 Mar 2014 08:53:03 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c22">comment #22</a>)
<span class="quote">&gt; Using commit e18833a518777e249b6badf54f65b37b741b6864
&gt; (<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/">http://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=e18833a518777e249b6badf54f65b37b741b6864) fixes the issue (tested on Git
&gt; HEAD and on 3.13.5).
&gt; Thanks for the pointer Ilia!</span >

Hi Pierre,
I have tried the diff patch (3 changed lines) on  Kernel 3.13.5-gentoo, and did
a quick test on nVidia 9600m GT: The screen gets scrambled as soon as nouveau
is loaded. At the startup, EFIFB is used and works with full screen resolution,
but the colors are &quot;incorrect&quot;. EFI is setup to use 9600m as default.

I am still using nouveau without acceleration. I will be testing the patched
Kernel on nVidia 9400m, by modifying EFI to use 9400m as default.

Could you do a diff on your patched kernel and unpatched, so that we could find
other differences?

Thanks.

BR</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394182383.3AcecBBD4.14628--

--===============1252652632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1252652632==--
