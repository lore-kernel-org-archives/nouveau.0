From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75511] Screen freezes during boot with an 3.13
 kernel (Arch Linux)
Date: Tue, 25 Feb 2014 22:29:44 +0000
Message-ID: <bug-75511-8800-zKuSFHkn72@http.bugs.freedesktop.org/>
References: <bug-75511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084623943=="
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


--===============1084623943==
Content-Type: multipart/alternative; boundary="1393367384.051DE142.511"; charset="us-ascii"


--1393367384.051DE142.511
Date: Tue, 25 Feb 2014 22:29:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75511

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Am I correct that you have 2 ~identical GK107 cards in there? Unfortunately it
appears that the VBIOS for the first one is corrupt. It's being retrieved from
PCIROM, which more often than not actually doesn't have what we want (despite
it passing the checksum). Note that your 2nd card appears to init correctly,
and it gets its VBIOS from the PROM. Not sure where the VBIOS for your first
card lives...

I assume that the VBIOS error about the unknown opcode exists in 3.12 as well?
Except that 3.13 made that an error. Who knows, maybe it's a legitimately
unknown opcode... could you grab a copy of envytools and retrieve the VBIOSes
for both of your cards with nvagetbios? i.e.

nvagetbios -c 0 -s PROM > vbios-0.rom
nvagetbios -c 1 -s PROM > vbios-1.rom

If the first one fails, also try PRAMIN instead of PROM (I assume -c 1 will
work just fine since nouveau is able to find it without problem). If that still
fails, try to get it from the pci rom directly:

echo 1 > /sys/bus/pci/devices/0000:01:00.0/rom
cat /sys/bus/pci/devices/0000:01:00.0/rom > vbios-0.rom
echo 0 > /sys/bus/pci/devices/0000:01:00.0/rom

(all of this as root, obviously.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393367384.051DE142.511
Date: Tue, 25 Feb 2014 22:29:44 +0000
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
   title="NEW --- - Screen freezes during boot with an 3.13 kernel (Arch Linux)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen freezes during boot with an 3.13 kernel (Arch Linux)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75511">bug 75511</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Am I correct that you have 2 ~identical GK107 cards in there? Unfortunately it
appears that the VBIOS for the first one is corrupt. It's being retrieved from
PCIROM, which more often than not actually doesn't have what we want (despite
it passing the checksum). Note that your 2nd card appears to init correctly,
and it gets its VBIOS from the PROM. Not sure where the VBIOS for your first
card lives...

I assume that the VBIOS error about the unknown opcode exists in 3.12 as well?
Except that 3.13 made that an error. Who knows, maybe it's a legitimately
unknown opcode... could you grab a copy of envytools and retrieve the VBIOSes
for both of your cards with nvagetbios? i.e.

nvagetbios -c 0 -s PROM &gt; vbios-0.rom
nvagetbios -c 1 -s PROM &gt; vbios-1.rom

If the first one fails, also try PRAMIN instead of PROM (I assume -c 1 will
work just fine since nouveau is able to find it without problem). If that still
fails, try to get it from the pci rom directly:

echo 1 &gt; /sys/bus/pci/devices/0000:01:00.0/rom
cat /sys/bus/pci/devices/0000:01:00.0/rom &gt; vbios-0.rom
echo 0 &gt; /sys/bus/pci/devices/0000:01:00.0/rom

(all of this as root, obviously.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393367384.051DE142.511--

--===============1084623943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1084623943==--
