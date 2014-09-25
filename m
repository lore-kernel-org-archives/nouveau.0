From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Thu, 25 Sep 2014 11:26:56 +0000
Message-ID: <bug-27501-8800-e0GENgotqd@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1073411821=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1073411821==
Content-Type: multipart/alternative; boundary="1411644416.C71Eb86.931"; charset="us-ascii"


--1411644416.C71Eb86.931
Date: Thu, 25 Sep 2014 11:26:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #37 from Joanand <MacGyver031-S0/GAf8tV78@public.gmane.org> ---
Hi Pierre,
Both patches seems to work (tested 1x on 3.17.rc6). 

Xorg-x11 starts with fluxbox, messages show that 9600 is unacclerated and 9400
is acclerated. There is are two errors in your patch "option for disabling
accleration for given chipset":
* The entries DRM_DEBUG_DRIVER are not available on 3.17.rc6, but it works
either way.
* In the kernel < 3.17 it should be "if (nouveau_noaccel ||
!nouveau_fifo(device) /*XXX*/)" not only "if (nouveau_noaccel)"

Terminating xorg-x11 crashed, probably because I switched off discrete
graphichs adapter after starting xorg. Someone else should check.

Further testing is in queue.

The previous patch you have sent: It solved a problem I had in the past: System
kernel panics if the lid is closed during startup!

Thanks.

Do you think that acceleration for 9600M will be possible sometime?

BR.

(In reply to comment #36)
> This is the minimalistic version of the previous patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411644416.C71Eb86.931
Date: Thu, 25 Sep 2014 11:26:56 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:MacGyver031&#64;web.de" title="Joanand &lt;MacGyver031&#64;web.de&gt;"> <span class="fn">Joanand</span></a>
</span></b>
        <pre>Hi Pierre,
Both patches seems to work (tested 1x on 3.17.rc6). 

Xorg-x11 starts with fluxbox, messages show that 9600 is unacclerated and 9400
is acclerated. There is are two errors in your patch &quot;option for disabling
accleration for given chipset&quot;:
* The entries DRM_DEBUG_DRIVER are not available on 3.17.rc6, but it works
either way.
* In the kernel &lt; 3.17 it should be &quot;if (nouveau_noaccel ||
!nouveau_fifo(device) /*XXX*/)&quot; not only &quot;if (nouveau_noaccel)&quot;

Terminating xorg-x11 crashed, probably because I switched off discrete
graphichs adapter after starting xorg. Someone else should check.

Further testing is in queue.

The previous patch you have sent: It solved a problem I had in the past: System
kernel panics if the lid is closed during startup!

Thanks.

Do you think that acceleration for 9600M will be possible sometime?

BR.

(In reply to <a href="show_bug.cgi?id=27501#c36">comment #36</a>)
<span class="quote">&gt; This is the minimalistic version of the previous patch.</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411644416.C71Eb86.931--

--===============1073411821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1073411821==--
