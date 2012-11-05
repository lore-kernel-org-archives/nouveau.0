From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Mon, 05 Nov 2012 04:17:09 +0000
Message-ID: <bug-56340-8800-iQ4ihP9nbx@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1393489646=="
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


--===============1393489646==
Content-Type: multipart/alternative; boundary="1352089028.cBed0d1.31673"; charset="us-ascii"


--1352089028.cBed0d1.31673
Date: Mon, 5 Nov 2012 04:17:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #5 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
Hi Emil,

I have done a little more testing with NVIDIA RIVA TNT2 64-based graphics cards
since I now have 4 of them available for testing.
Here are my test results.

Compaq desktop computer pulled PWA-G4000PRO:

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM
- VGA BIOS Version: Unknown at this point
- Manufacturer unknown
- Likely pulled out of Compaq desktop computer (Compaq spare number on the
back)
- Booted fine 3 consecutive times with FIC VA-503+ mainboard without any
freezes or crashes

ASUS AGP-3800 COMBAT/16M:

- NV6
- Revision 15 (from lspci -vvv)
- 16 MB
- VGA BIOS Version: V 2.05.13
- Booted fine 3 consecutive times with FIC VA-503+ mainboard without any
freezes or crashes

VisionTek RIVA TNT2 64-based graphics card (official graphics card name
unknown):

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM
- VGA BIOS Version: V 2.05.13.04
- Will almost always crash during boot screen (occasionally, will get past the
boot screen) with FIC VA-503+ mainboard

Dell desktop computer pulled RIVA TNT2 64-based graphics card (official
graphics card name unknown):

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM (I think)
- Manufacturer unknown
- VGA BIOS Version: Unknown at this point
- Will almost always crash during boot screen (occasionally, will get past the
boot screen) with FIC VA-503+ mainboard

Please note that all of these NVIDIA RIVA TNT2 64 and Vanta cards will work
fine with other systems.
Regarding the freeze pattern, the Ubuntu startup screen's red dots will stop
flashing when the freeze occurs.
However, interestingly, if I press buttons on the keyboard like Esc key often,
it sometimes doesn't freeze during boot.
Note that the mainboard is somewhat stable since these AGP graphics cards work
fine with FIC VA-503+ mainboard.

- NVIDIA
  * GeForce 2 MX
  * GeForce 4 MX
  * GeForce FX 5200
  * GeForce FX 5700
  * GeForce FX 5950 Ultra (probably one of the most powerful graphics card that
can be mated with this old mainboard)

- ATI Technologies
  * Rage Pro Turbo
  * Rage 128
  * Rage 128 Pro
  * Radeon
  * Radeon 9250
  * Radeon 9800 Pro

- SiS
  * 305
  * 315

- Matrox
  * G200
  * G400

Since all of these graphics cards will work fine, I don't think you can
honestly say that it is on its last leg.
Also note that one RIVA TNT2 64 and one Vanta card work fine whereas two others
RIVA TNT2 64 cards will often freeze during boot.
The one that I managed to file a bug report (the system used to collect all the
log files) had the VisionTek version of the RIVA TNT2 64 graphics card in it.
Again, all of these cards will work fine in other mainboards, including the 2
that tend to cause the freeze with FIC VA-503+ mainboard.
Regarding the reason for the freeze, I can think of the following.

- Is Nouveau is accessing the VGA BIOS of the card during boot, and the VGA
BIOS is a little buggy?
- Does the VGA BIOS's initialization code configuring RIVA TNT2 64 in a certain
way that contributes to the freeze with Apollo MVP3 chipset?


Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352089028.cBed0d1.31673
Date: Mon, 5 Nov 2012 04:17:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>Hi Emil,

I have done a little more testing with NVIDIA RIVA TNT2 64-based graphics cards
since I now have 4 of them available for testing.
Here are my test results.

Compaq desktop computer pulled PWA-G4000PRO:

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM
- VGA BIOS Version: Unknown at this point
- Manufacturer unknown
- Likely pulled out of Compaq desktop computer (Compaq spare number on the
back)
- Booted fine 3 consecutive times with FIC VA-503+ mainboard without any
freezes or crashes

ASUS AGP-3800 COMBAT/16M:

- NV6
- Revision 15 (from lspci -vvv)
- 16 MB
- VGA BIOS Version: V 2.05.13
- Booted fine 3 consecutive times with FIC VA-503+ mainboard without any
freezes or crashes

VisionTek RIVA TNT2 64-based graphics card (official graphics card name
unknown):

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM
- VGA BIOS Version: V 2.05.13.04
- Will almost always crash during boot screen (occasionally, will get past the
boot screen) with FIC VA-503+ mainboard

Dell desktop computer pulled RIVA TNT2 64-based graphics card (official
graphics card name unknown):

- NV5M64
- Revision 15 (from lspci -vvv)
- 16 MB SDRAM (I think)
- Manufacturer unknown
- VGA BIOS Version: Unknown at this point
- Will almost always crash during boot screen (occasionally, will get past the
boot screen) with FIC VA-503+ mainboard

Please note that all of these NVIDIA RIVA TNT2 64 and Vanta cards will work
fine with other systems.
Regarding the freeze pattern, the Ubuntu startup screen's red dots will stop
flashing when the freeze occurs.
However, interestingly, if I press buttons on the keyboard like Esc key often,
it sometimes doesn't freeze during boot.
Note that the mainboard is somewhat stable since these AGP graphics cards work
fine with FIC VA-503+ mainboard.

- NVIDIA
  * GeForce 2 MX
  * GeForce 4 MX
  * GeForce FX 5200
  * GeForce FX 5700
  * GeForce FX 5950 Ultra (probably one of the most powerful graphics card that
can be mated with this old mainboard)

- ATI Technologies
  * Rage Pro Turbo
  * Rage 128
  * Rage 128 Pro
  * Radeon
  * Radeon 9250
  * Radeon 9800 Pro

- SiS
  * 305
  * 315

- Matrox
  * G200
  * G400

Since all of these graphics cards will work fine, I don't think you can
honestly say that it is on its last leg.
Also note that one RIVA TNT2 64 and one Vanta card work fine whereas two others
RIVA TNT2 64 cards will often freeze during boot.
The one that I managed to file a bug report (the system used to collect all the
log files) had the VisionTek version of the RIVA TNT2 64 graphics card in it.
Again, all of these cards will work fine in other mainboards, including the 2
that tend to cause the freeze with FIC VA-503+ mainboard.
Regarding the reason for the freeze, I can think of the following.

- Is Nouveau is accessing the VGA BIOS of the card during boot, and the VGA
BIOS is a little buggy?
- Does the VGA BIOS's initialization code configuring RIVA TNT2 64 in a certain
way that contributes to the freeze with Apollo MVP3 chipset?


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

--1352089028.cBed0d1.31673--

--===============1393489646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1393489646==--
