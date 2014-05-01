From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Thu, 01 May 2014 18:53:48 +0000
Message-ID: <bug-54700-8800-HFHbX0KLDC@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2116358895=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2116358895==
Content-Type: multipart/alternative; boundary="1398970428.E1dc1A4.7542"; charset="us-ascii"


--1398970428.E1dc1A4.7542
Date: Thu, 1 May 2014 18:53:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #61 from nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> ---
I had the feeling that there's not much chance that the dump alone will help.
So I did some debugging on my own, after all it can't be that hard if I have
the hardware at hand to play with ;)

First I've collected all writes locations out from the dump, and ignored the
part which looked like a frame buffer. I got around 260 locations, I guess most
of these must be mapped registers.

Then I did the nvidia boot and kexec to nouveau, when everything works except
that the GPU locks after a while.

Anyway, it's stable enough to dump of those 260 registers. Then I made a
suspend to RAM, and back. Screen trashing is back of course, but let's dump
those registers again.

Comparing the dumps reveals that 30 locations are different now.

I wrote all those registers back as they were before the suspend. Of course
console went immediately blank. But I can still start X blindly, which hangs of
course, but at least I can move a flawless cursor around. (normally it's
trashed as well)

So it must be one of these. I resorted to normal bisecting from here to find
transhing/non-trashing set of registers. There were plenty of hangs and reboots
;)

At the end I got what I wanted. The winner is:
nvapoke 00100080 e1000000

This register is e0000000 after suspend or after clean boot. So all this
trouble only because of a single bit was not set ;(

The earlier GPU lockup (with kexec nouveau after nvidia driver init) does not
happen anymore when I only set this bit, but nothing else. It probably must be
due to some other uninitialized state, but I'm not sure if it's worth to find
out what it is, after all the default state on boot is ok.

From here I pass the ball back. Please, with this knowledge could someone fix
up the driver? Most likely it would be better done on the kernel side as the
KMS frame buffer is affected too. Of course testing patches should be no
problem ;)

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398970428.E1dc1A4.7542
Date: Thu, 1 May 2014 18:53:48 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c61">Comment # 61</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span></b>
        <pre>I had the feeling that there's not much chance that the dump alone will help.
So I did some debugging on my own, after all it can't be that hard if I have
the hardware at hand to play with ;)

First I've collected all writes locations out from the dump, and ignored the
part which looked like a frame buffer. I got around 260 locations, I guess most
of these must be mapped registers.

Then I did the nvidia boot and kexec to nouveau, when everything works except
that the GPU locks after a while.

Anyway, it's stable enough to dump of those 260 registers. Then I made a
suspend to RAM, and back. Screen trashing is back of course, but let's dump
those registers again.

Comparing the dumps reveals that 30 locations are different now.

I wrote all those registers back as they were before the suspend. Of course
console went immediately blank. But I can still start X blindly, which hangs of
course, but at least I can move a flawless cursor around. (normally it's
trashed as well)

So it must be one of these. I resorted to normal bisecting from here to find
transhing/non-trashing set of registers. There were plenty of hangs and reboots
;)

At the end I got what I wanted. The winner is:
nvapoke 00100080 e1000000

This register is e0000000 after suspend or after clean boot. So all this
trouble only because of a single bit was not set ;(

The earlier GPU lockup (with kexec nouveau after nvidia driver init) does not
happen anymore when I only set this bit, but nothing else. It probably must be
due to some other uninitialized state, but I'm not sure if it's worth to find
out what it is, after all the default state on boot is ok.

From here I pass the ball back. Please, with this knowledge could someone fix
up the driver? Most likely it would be better done on the kernel side as the
KMS frame buffer is affected too. Of course testing patches should be no
problem ;)

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398970428.E1dc1A4.7542--

--===============2116358895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2116358895==--
