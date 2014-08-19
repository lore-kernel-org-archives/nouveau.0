From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56615] [NVD9] Unable to start X on ThinkPad T420s
	laptop
Date: Tue, 19 Aug 2014 09:12:12 +0000
Message-ID: <bug-56615-8800-xwuSXZWBj2@http.bugs.freedesktop.org/>
References: <bug-56615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1763032574=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56615-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1763032574==
Content-Type: multipart/alternative; boundary="1408439532.C1EfdD1.9489"; charset="us-ascii"


--1408439532.C1EfdD1.9489
Date: Tue, 19 Aug 2014 09:12:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56615

--- Comment #25 from Mark Cave-Ayland <mark.cave-ayland-r2/yp8inhXLQXOPxS62xeg@public.gmane.org> ---
Hi all,

Sorry to prod an old bug once again, however as I'd seem some possibly relevant
fixes go through the mailing list I thought I'd try the latest drm-nouveau-next
checkout and see if my problem was fixed. Unfortunately it still doesn't work
for me :(

On the plus side, I noticed that if I use a DisplayPort to HDMI cable to
connect to a borrowed HD monitor (1920x1080) then nouveau now works as expected
which is a great milestone! However if I try and use my standard Dell HD
monitor (2560x1440) with a direct DisplayPort cable then nouveau still doesn't
work for me with the same symptoms as described earlier in this bug report.

I noticed that there is quite a lot of verbose debugging in dmesg in the latest
checkout, so I'll attach that below in the hope someone can work out why I
can't use my Dell monitor with direct DisplayPort connection.


Many thanks,

Mark.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408439532.C1EfdD1.9489
Date: Tue, 19 Aug 2014 09:12:12 +0000
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
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56615">bug 56615</a>
              from <span class="vcard"><a class="email" href="mailto:mark.cave-ayland&#64;ilande.co.uk" title="Mark Cave-Ayland &lt;mark.cave-ayland&#64;ilande.co.uk&gt;"> <span class="fn">Mark Cave-Ayland</span></a>
</span></b>
        <pre>Hi all,

Sorry to prod an old bug once again, however as I'd seem some possibly relevant
fixes go through the mailing list I thought I'd try the latest drm-nouveau-next
checkout and see if my problem was fixed. Unfortunately it still doesn't work
for me :(

On the plus side, I noticed that if I use a DisplayPort to HDMI cable to
connect to a borrowed HD monitor (1920x1080) then nouveau now works as expected
which is a great milestone! However if I try and use my standard Dell HD
monitor (2560x1440) with a direct DisplayPort cable then nouveau still doesn't
work for me with the same symptoms as described earlier in this bug report.

I noticed that there is quite a lot of verbose debugging in dmesg in the latest
checkout, so I'll attach that below in the hope someone can work out why I
can't use my Dell monitor with direct DisplayPort connection.


Many thanks,

Mark.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408439532.C1EfdD1.9489--

--===============1763032574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1763032574==--
