From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] [NVE7] Unknown opcode in VBIOS on one of 2
 cards, fails boot on 3.13+
Date: Tue, 25 Feb 2014 23:33:14 +0000
Message-ID: <bug-75511-8800-1VIb1O21aB@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0500311973=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0500311973==
Content-Type: multipart/alternative; boundary="1393371194.3C762.13245"; charset="us-ascii"


--1393371194.3C762.13245
Date: Tue, 25 Feb 2014 23:33:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, analyzing the vbios from the second (working) card, what I see is:

Init script 0 at 0x83e0:
0x83e0: 8c                                             UNK8C
0x83e1: 7a 00 02 00 00 20 20 00 00                     ZM_REG   R[0x000200] =
0x00002020
0x83ea: 33 14                                          REPEAT   0x14
0x83ec: 6e 00 00 00 00 ff ff ff ff 00 00 00 00         NV_REG   R[0x000000] &=
0xffffffff |= 0x00000000
0x83f9: 36                                             END_REPEAT
0x83fa: 7a 00 02 00 00 25 21 01 40                     ZM_REG   R[0x000200] =
0x40012125
0x8403: 7a c0 24 12 00 00 00 00 00                     ZM_REG   R[0x1224c0] =
0x00000000
0x840c: 7a 40 26 12 00 00 00 00 00                     ZM_REG   R[0x122640] =
0x00000000
0x8415: 6e 00 24 02 00 ff f7 ff ff 00 08 00 00         NV_REG   R[0x022400] &=
0xfffff7ff |= 0x00000800
and so on

Looking at the pci rom of the first (non-working) card, I see:

Init script 0 at 0x83e0:
0x83e0: 42                                             ???
0x83e1: 66                                             CONFIGURE_MEM
0x83e2: ad                                             ???
0x83e3: 66                                             CONFIGURE_MEM
0x83e4: c1                                             ???
0x83e5: c8                                             ???

As you can see the bytes are all different, I'm pretty sure this is 16-bit real
mode x86 code:

$ udcli -16 -x
42 66 ad 66 c1 c8 10 ee 66 c1 c0 08 ee 66 c1 c0 08 ee e2 ed 1f 66 61
0000000000000000 42               inc dx                  
0000000000000001 66ad             lodsd                   
0000000000000003 66c1c810         ror eax, 0x10           
0000000000000007 ee               out dx, al              
0000000000000008 66c1c008         rol eax, 0x8            
000000000000000c ee               out dx, al              
000000000000000d 66c1c008         rol eax, 0x8            
0000000000000011 ee               out dx, al              
0000000000000012 e2ed             loop 0x1                
0000000000000014 1f               pop ds                  
0000000000000015 6661             popad                   

Otherwise the bioses appear identical... at least the DCB and GPIO tables match
up. So I'd recommend simply grabbing that good vbios-1.rom, sticking it in
/lib/firmware (in the initrd if that's where nouveau is loaded from), and
adding nouveau.config=NvBios=vbios-1.rom which will use that as the vbios
instead of trying to read it from the card.

I'm not extremely happy with this solution, of course, but it's the fastest way
to get something that works.

Can you provide any relevant details about your system? These appear to both be
mobile chips, it's pretty uncommon to have that in a single system. Would you
also mind providing an acpidump? Perhaps the vbios for the first card is hiding
in ACPI somewhere unexpected.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393371194.3C762.13245
Date: Tue, 25 Feb 2014 23:33:14 +0000
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
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] Unknown opcode in VBIOS on one of 2 cards, fails boot on 3.13+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, analyzing the vbios from the second (working) card, what I see is:

Init script 0 at 0x83e0:
0x83e0: 8c                                             UNK8C
0x83e1: 7a 00 02 00 00 20 20 00 00                     ZM_REG   R[0x000200] =
0x00002020
0x83ea: 33 14                                          REPEAT   0x14
0x83ec: 6e 00 00 00 00 ff ff ff ff 00 00 00 00         NV_REG   R[0x000000] &amp;=
0xffffffff |= 0x00000000
0x83f9: 36                                             END_REPEAT
0x83fa: 7a 00 02 00 00 25 21 01 40                     ZM_REG   R[0x000200] =
0x40012125
0x8403: 7a c0 24 12 00 00 00 00 00                     ZM_REG   R[0x1224c0] =
0x00000000
0x840c: 7a 40 26 12 00 00 00 00 00                     ZM_REG   R[0x122640] =
0x00000000
0x8415: 6e 00 24 02 00 ff f7 ff ff 00 08 00 00         NV_REG   R[0x022400] &amp;=
0xfffff7ff |= 0x00000800
and so on

Looking at the pci rom of the first (non-working) card, I see:

Init script 0 at 0x83e0:
0x83e0: 42                                             ???
0x83e1: 66                                             CONFIGURE_MEM
0x83e2: ad                                             ???
0x83e3: 66                                             CONFIGURE_MEM
0x83e4: c1                                             ???
0x83e5: c8                                             ???

As you can see the bytes are all different, I'm pretty sure this is 16-bit real
mode x86 code:

$ udcli -16 -x
42 66 ad 66 c1 c8 10 ee 66 c1 c0 08 ee 66 c1 c0 08 ee e2 ed 1f 66 61
0000000000000000 42               inc dx                  
0000000000000001 66ad             lodsd                   
0000000000000003 66c1c810         ror eax, 0x10           
0000000000000007 ee               out dx, al              
0000000000000008 66c1c008         rol eax, 0x8            
000000000000000c ee               out dx, al              
000000000000000d 66c1c008         rol eax, 0x8            
0000000000000011 ee               out dx, al              
0000000000000012 e2ed             loop 0x1                
0000000000000014 1f               pop ds                  
0000000000000015 6661             popad                   

Otherwise the bioses appear identical... at least the DCB and GPIO tables match
up. So I'd recommend simply grabbing that good vbios-1.rom, sticking it in
/lib/firmware (in the initrd if that's where nouveau is loaded from), and
adding nouveau.config=NvBios=vbios-1.rom which will use that as the vbios
instead of trying to read it from the card.

I'm not extremely happy with this solution, of course, but it's the fastest way
to get something that works.

Can you provide any relevant details about your system? These appear to both be
mobile chips, it's pretty uncommon to have that in a single system. Would you
also mind providing an acpidump? Perhaps the vbios for the first card is hiding
in ACPI somewhere unexpected.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393371194.3C762.13245--

--===============0500311973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0500311973==--
