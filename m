From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Wed, 21 Aug 2013 05:36:56 +0000
Message-ID: <bug-56340-8800-C07i2h1oI8@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1090593646=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1090593646==
Content-Type: multipart/alternative; boundary="1377063416.76adDD1.13790"; charset="us-ascii"


--1377063416.76adDD1.13790
Date: Wed, 21 Aug 2013 05:36:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #15 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
(In reply to comment #14)

Again, since this mainboard is a Socket 7 mainboard, I am not able to run this
system on Linux 3.x kernel.
That being said, what I said in comment #13 still holds.
Occasionally, I can get through the Ubuntu boot process, but most of the, I
will encounter a freeze.
If I set the system to AGP 1X mode in the BIOS setup, the system will never
freeze.
The problem is when I use AGP 2X mode.
Note that these 2 cards are the ONLY AGP card that have issues with Ubuntu when
AGP 2X mode is turned on.
I have tested this mainboard with literally all kinds of AGP 3.3V signaling
mode supporting cards (including NVIDIA GeForce 7300 GT, GeForce 6200, GeForce
5950 Ultra, GeForce 4 MX, GeForce 2 MX, GeForce 256, RIVA TNT2, RIVA TNT, ATI
Technologies Radeon 9700, Radeon 9250, Rage 128 Pro, Rage 128, Matrox G400,
3DLabs Wildcat VP, S3 Graphics Savage4, SiS 305, 315, and many more), and only
these 2 NVIDIA RIVA TNT2 M64 have issues when I turn on AGP 2X mode.
This bug does not affect FIC KA-6110 mainboard despite the AGP similarities of
VIA Technologies Apollo MVP3 chipset and Apollo Pro133 chipset.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377063416.76adDD1.13790
Date: Wed, 21 Aug 2013 05:36:56 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56340#c14">comment #14</a>)

Again, since this mainboard is a Socket 7 mainboard, I am not able to run this
system on Linux 3.x kernel.
That being said, what I said in <a href="show_bug.cgi?id=56340#c13">comment #13</a> still holds.
Occasionally, I can get through the Ubuntu boot process, but most of the, I
will encounter a freeze.
If I set the system to AGP 1X mode in the BIOS setup, the system will never
freeze.
The problem is when I use AGP 2X mode.
Note that these 2 cards are the ONLY AGP card that have issues with Ubuntu when
AGP 2X mode is turned on.
I have tested this mainboard with literally all kinds of AGP 3.3V signaling
mode supporting cards (including NVIDIA GeForce 7300 GT, GeForce 6200, GeForce
5950 Ultra, GeForce 4 MX, GeForce 2 MX, GeForce 256, RIVA TNT2, RIVA TNT, ATI
Technologies Radeon 9700, Radeon 9250, Rage 128 Pro, Rage 128, Matrox G400,
3DLabs Wildcat VP, S3 Graphics Savage4, SiS 305, 315, and many more), and only
these 2 NVIDIA RIVA TNT2 M64 have issues when I turn on AGP 2X mode.
This bug does not affect FIC KA-6110 mainboard despite the AGP similarities of
VIA Technologies Apollo MVP3 chipset and Apollo Pro133 chipset.

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377063416.76adDD1.13790--

--===============1090593646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1090593646==--
