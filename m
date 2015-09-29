From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92171] [NVE7] Reboot causes nouveau
	corruption/ghosting
Date: Tue, 29 Sep 2015 06:43:22 +0000
Message-ID: <bug-92171-8800-0rPIaJAain@http.bugs.freedesktop.org/>
References: <bug-92171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2010972005=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92171-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2010972005==
Content-Type: multipart/alternative; boundary="1443509002.c5Fc11.18456"; charset="UTF-8"


--1443509002.c5Fc11.18456
Date: Tue, 29 Sep 2015 06:43:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92171

--- Comment #4 from Bryan O'Donoghue <pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org> ---
Yes, that's a non-optimus setup.

I'll get you that capture. Right now I have this weird artifact on my primary
laptop screen that won't go away after booting the system a number of times @
the 4.3.0-rcX kernel - I'm assuming the system isn't actually resetting the
nvidia when I power down (some sort of warm boot) - so I've disconnected the
power and I'm letting the battery run flat.

I'm attaching a picture of the artifact that persisting through resets (note
it's still there even after leaving the system powered off overnight)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443509002.c5Fc11.18456
Date: Tue, 29 Sep 2015 06:43:22 +0000
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
   title="NEW - [NVE7] Reboot causes nouveau corruption/ghosting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92171#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Reboot causes nouveau corruption/ghosting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92171">bug 92171</a>
              from <span class="vcard"><a class="email" href="mailto:pure.logic&#64;nexus-software.ie" title="Bryan O'Donoghue &lt;pure.logic&#64;nexus-software.ie&gt;"> <span class="fn">Bryan O'Donoghue</span></a>
</span></b>
        <pre>Yes, that's a non-optimus setup.

I'll get you that capture. Right now I have this weird artifact on my primary
laptop screen that won't go away after booting the system a number of times &#64;
the 4.3.0-rcX kernel - I'm assuming the system isn't actually resetting the
nvidia when I power down (some sort of warm boot) - so I've disconnected the
power and I'm letting the battery run flat.

I'm attaching a picture of the artifact that persisting through resets (note
it's still there even after leaving the system powered off overnight)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443509002.c5Fc11.18456--

--===============2010972005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2010972005==--
