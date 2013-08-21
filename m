From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63101] [NV4B] NVIDIA GeForce 7300 GT AGP graphics
 card will not display any text characters on VIA Technologies Apollo
 MVP3-based mainboard
Date: Wed, 21 Aug 2013 04:50:37 +0000
Message-ID: <bug-63101-8800-OKhas8IfrU@http.bugs.freedesktop.org/>
References: <bug-63101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117991423=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0117991423==
Content-Type: multipart/alternative; boundary="1377060637.1feeD3E1.3400"; charset="us-ascii"


--1377060637.1feeD3E1.3400
Date: Wed, 21 Aug 2013 04:50:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63101

--- Comment #6 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
(In reply to Comment #5)

Hi,

Please note that FIC VA-503+ mainboard is for Socket 7 platform.
I believe Linux kernel since 3.0 no longer support processors without CMOV
instructions.
Hence, this is not really an option in this case.
An alternative for me will be to use FIC KA-6110 mainboard (VIA Technologies
Apollo Pro133 chipset) since it exhibits the identical bug.
This is for Intel Slot 1 platform so the processor supports CMOV instructions
and PAE.
I have ran Ubuntu 12.04/Xubuntu 12.04 LTS 32-bit with KA-6110 mainboard, and it
still has the exact same buggy behavior and same workaround (i.e., set AGP
aperture size to 32 MB or less).
It appears that MVP3 chipset's AGP and Apollo Pro 133 chispet's AGP are very
similar (i.e., both support AGP 1X/2X modes).
    I have not tried this with Apollo Pro133A chipset or other VIA Technologies
chipsets, but I will try to make some time to do some testing.
Also, please note that when I use AGP Aperture Size of 256 MB on Intel
SE440BX-2 mainboard with this same BFG Technologies GeForce 7300 GT AGP
graphics card, it will crash during boot, but I can boot normally with the AGP
Aperture Size of 64 MB.
SE440BX-2 mainboard has only 2 AGP Aperture Size selections in the BIOS setup:
64 MB or 256 MB.
If you have time, please take a look at Bug #56340 as well.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377060637.1feeD3E1.3400
Date: Wed, 21 Aug 2013 04:50:37 +0000
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
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV4B] NVIDIA GeForce 7300 GT AGP graphics card will not display any text characters on VIA Technologies Apollo MVP3-based mainboard"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63101">bug 63101</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=63101#c5">Comment #5</a>)

Hi,

Please note that FIC VA-503+ mainboard is for Socket 7 platform.
I believe Linux kernel since 3.0 no longer support processors without CMOV
instructions.
Hence, this is not really an option in this case.
An alternative for me will be to use FIC KA-6110 mainboard (VIA Technologies
Apollo Pro133 chipset) since it exhibits the identical bug.
This is for Intel Slot 1 platform so the processor supports CMOV instructions
and PAE.
I have ran Ubuntu 12.04/Xubuntu 12.04 LTS 32-bit with KA-6110 mainboard, and it
still has the exact same buggy behavior and same workaround (i.e., set AGP
aperture size to 32 MB or less).
It appears that MVP3 chipset's AGP and Apollo Pro 133 chispet's AGP are very
similar (i.e., both support AGP 1X/2X modes).
    I have not tried this with Apollo Pro133A chipset or other VIA Technologies
chipsets, but I will try to make some time to do some testing.
Also, please note that when I use AGP Aperture Size of 256 MB on Intel
SE440BX-2 mainboard with this same BFG Technologies GeForce 7300 GT AGP
graphics card, it will crash during boot, but I can boot normally with the AGP
Aperture Size of 64 MB.
SE440BX-2 mainboard has only 2 AGP Aperture Size selections in the BIOS setup:
64 MB or 256 MB.
If you have time, please take a look at <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="show_bug.cgi?id=56340">Bug #56340</a> as well.

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

--1377060637.1feeD3E1.3400--

--===============0117991423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0117991423==--
