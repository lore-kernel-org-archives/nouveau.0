From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Fri, 23 Aug 2013 21:33:36 +0000
Message-ID: <bug-58556-8800-bPCpymurAa@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1217143869=="
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


--===============1217143869==
Content-Type: multipart/alternative; boundary="1377293616.4ecf07f2.14866"; charset="us-ascii"


--1377293616.4ecf07f2.14866
Date: Fri, 23 Aug 2013 21:33:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #17 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
(In reply to comment #16)

> But, in the case of screening the 9400m, and using nouveau.noaccel=1, I
> cannot start X - it gives a "No screens found" error. Using that patched
> kernel, and trying to use the Nvidia proprietary driver fails as well with a
> "No screens found" error - but the Nvidia driver works when I use the
> unpatched kernel.
> 
> And now I'm stuck .. any help?

Yes this is "normal". X tries to bind to the PCI with the lowest ID, in our
case 9600M has ID=2 and 9400M has ID=3. So you will have to use BusID:

Section "Device"
    Identifier  "NOUVEAU"
    Driver      "nouveau"
    BusID       "PCI:03:00:0"
    Screen      0
EndSection

Now if you are screening the 9400m, X should start without problem.

BR.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377293616.4ecf07f2.14866
Date: Fri, 23 Aug 2013 21:33:36 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=58556#c16">comment #16</a>)

<span class="quote">&gt; But, in the case of screening the 9400m, and using nouveau.noaccel=1, I
&gt; cannot start X - it gives a &quot;No screens found&quot; error. Using that patched
&gt; kernel, and trying to use the Nvidia proprietary driver fails as well with a
&gt; &quot;No screens found&quot; error - but the Nvidia driver works when I use the
&gt; unpatched kernel.
&gt; 
&gt; And now I'm stuck .. any help?</span >

Yes this is &quot;normal&quot;. X tries to bind to the PCI with the lowest ID, in our
case 9600M has ID=2 and 9400M has ID=3. So you will have to use BusID:

Section &quot;Device&quot;
    Identifier  &quot;NOUVEAU&quot;
    Driver      &quot;nouveau&quot;
    BusID       &quot;PCI:03:00:0&quot;
    Screen      0
EndSection

Now if you are screening the 9400m, X should start without problem.

BR.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377293616.4ecf07f2.14866--

--===============1217143869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1217143869==--
