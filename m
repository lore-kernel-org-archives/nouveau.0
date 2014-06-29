From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Sun, 29 Jun 2014 21:58:58 +0000
Message-ID: <bug-71659-8800-BFt8CDfQ2T@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1019766347=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1019766347==
Content-Type: multipart/alternative; boundary="1404079137.fac31.8866"; charset="us-ascii"


--1404079137.fac31.8866
Date: Sun, 29 Jun 2014 21:58:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #23 from Rebecca Palmer <R.Palmer-mHdZ94l+r7K1Qrn1Bg8BZw@public.gmane.org> ---
Created attachment 101990
  --> https://bugs.freedesktop.org/attachment.cgi?id=101990&action=edit
kernel log 3.15rc-Jun-27

This bug still exists in drm-nouveau-next (commit
242a42eadfc17448a0d5b2ffc0cb191c8b51971a) with Ubuntu 14.04 userspace.  The
error message has changed to "E[   PFIFO][0000:01:00.0] INTR 0x00800000", and
some of the "INTR 0x01000000: 0x00000005" warnings now come _after_ it.

In Ubuntu 14.04 (not 13.10) with either this git kernel or its standard 3.13,
there is also a hang on resume from suspend
(https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1333417),
but it is not clear whether this is a driver or BIOS problem.

In the attached, the original bug is at 08:09:47 and 08:20:06, the resume
failure (which can log "GPU lockup", "failed to idle chanel 0xcccc0001
[Xorg[1185]]", or nothing) is at 08:14:53.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404079137.fac31.8866
Date: Sun, 29 Jun 2014 21:58:57 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:R.Palmer&#64;bham.ac.uk" title="Rebecca Palmer &lt;R.Palmer&#64;bham.ac.uk&gt;"> <span class="fn">Rebecca Palmer</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101990" name="attach_101990" title="kernel log 3.15rc-Jun-27">attachment 101990</a> <a href="attachment.cgi?id=101990&amp;action=edit" title="kernel log 3.15rc-Jun-27">[details]</a></span>
kernel log 3.15rc-Jun-27

This bug still exists in drm-nouveau-next (commit
242a42eadfc17448a0d5b2ffc0cb191c8b51971a) with Ubuntu 14.04 userspace.  The
error message has changed to &quot;E[   PFIFO][0000:01:00.0] INTR 0x00800000&quot;, and
some of the &quot;INTR 0x01000000: 0x00000005&quot; warnings now come _after_ it.

In Ubuntu 14.04 (not 13.10) with either this git kernel or its standard 3.13,
there is also a hang on resume from suspend
(<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1333417">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1333417</a>),
but it is not clear whether this is a driver or BIOS problem.

In the attached, the original bug is at 08:09:47 and 08:20:06, the resume
failure (which can log &quot;GPU lockup&quot;, &quot;failed to idle chanel 0xcccc0001
[Xorg[1185]]&quot;, or nothing) is at 08:14:53.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404079137.fac31.8866--

--===============1019766347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1019766347==--
