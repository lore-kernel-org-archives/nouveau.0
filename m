From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54681] Connecting TV to second DVI port of 9600GT
 card causes GPU lockup and Xorg crash
Date: Wed, 14 Nov 2012 03:03:11 +0000
Message-ID: <bug-54681-8800-5VeihxKyPY@http.bugs.freedesktop.org/>
References: <bug-54681-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0766740939=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54681-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0766740939==
Content-Type: multipart/alternative; boundary="1352862191.75BD1.3300"; charset="us-ascii"


--1352862191.75BD1.3300
Date: Wed, 14 Nov 2012 03:03:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54681

--- Comment #1 from Robert Hancock <hancockrwd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This bug is still occurring with kernel-3.6.6-1.fc17.x86_64 and
xorg-x11-drv-nouveau-0.0.16-37.20120306gitf5d1cd2.fc17.x86_64. I also get
errors like this sometimes when the crash occurs:

[Nov 13 19:01:29 newcastle kernel: [   41.878583] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x000b 0x05)
Nov 13 19:01:30 newcastle kernel: [   42.458475] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)
Nov 13 19:01:36 newcastle kernel: [   48.447320] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)
Nov 13 19:01:47 newcastle kernel: [   59.468318] [drm] nouveau 0000:01:00.0:
Failed to idle channel 2.
Nov 13 19:01:50 newcastle kernel: [   62.533759] [drm] nouveau 0000:01:00.0:
Failed to idle channel 4.
Nov 13 19:01:59 newcastle kernel: [   68.933395] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)

I realized that I had my main monitor connected to what the driver calls
DVI-I-2 and the TV connected to DVI-I-1. If I reverse the connections to put
the TV on port 2 instead, it works a bit better in that I can
connect/disconnect the TV and extend the display onto it without things blowing
up. But doing things in the Display app like disabling the main monitor and
using just the TV, then disabling the TV and turning the monitor back on, will
trigger such crashes again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352862191.75BD1.3300
Date: Wed, 14 Nov 2012 03:03:11 +0000
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
   title="NEW --- - Connecting TV to second DVI port of 9600GT card causes GPU lockup and Xorg crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54681#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Connecting TV to second DVI port of 9600GT card causes GPU lockup and Xorg crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54681">bug 54681</a>
              from <span class="vcard"><a class="email" href="mailto:hancockrwd&#64;gmail.com" title="Robert Hancock &lt;hancockrwd&#64;gmail.com&gt;"> <span class="fn">Robert Hancock</span></a>
</span></b>
        <pre>This bug is still occurring with kernel-3.6.6-1.fc17.x86_64 and
xorg-x11-drv-nouveau-0.0.16-37.20120306gitf5d1cd2.fc17.x86_64. I also get
errors like this sometimes when the crash occurs:

[Nov 13 19:01:29 newcastle kernel: [   41.878583] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x000b 0x05)
Nov 13 19:01:30 newcastle kernel: [   42.458475] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)
Nov 13 19:01:36 newcastle kernel: [   48.447320] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)
Nov 13 19:01:47 newcastle kernel: [   59.468318] [drm] nouveau 0000:01:00.0:
Failed to idle channel 2.
Nov 13 19:01:50 newcastle kernel: [   62.533759] [drm] nouveau 0000:01:00.0:
Failed to idle channel 4.
Nov 13 19:01:59 newcastle kernel: [   68.933395] [drm] nouveau 0000:01:00.0:
EvoCh 2 Mthd 0x0080 Data 0x00000000 (0x100b 0x05)

I realized that I had my main monitor connected to what the driver calls
DVI-I-2 and the TV connected to DVI-I-1. If I reverse the connections to put
the TV on port 2 instead, it works a bit better in that I can
connect/disconnect the TV and extend the display onto it without things blowing
up. But doing things in the Display app like disabling the main monitor and
using just the TV, then disabling the TV and turning the monitor back on, will
trigger such crashes again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352862191.75BD1.3300--

--===============0766740939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0766740939==--
