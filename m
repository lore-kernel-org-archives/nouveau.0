From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] Random image corruptions (in Debian Wheezy
 with Linux 3.2)
Date: Mon, 16 Sep 2013 20:25:53 +0000
Message-ID: <bug-69349-8800-hdapXTVptH@http.bugs.freedesktop.org/>
References: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855665171=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0855665171==
Content-Type: multipart/alternative; boundary="1379363153.00c15862.5618"; charset="us-ascii"


--1379363153.00c15862.5618
Date: Mon, 16 Sep 2013 20:25:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69349

Paul Menzel <paulepanter-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulepanter-Rn4VEauK+AJRYHbF4JBHZw@public.gmane.org
                   |                            |ge.net

--- Comment #2 from Paul Menzel <paulepanter-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> ---
Today it happened again=C2=B9.

1. Some more information about the system:

        $ lspci -s 4:00
        04:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce =
8400
GS] (rev a1)

I have another system with an integrated Nvidia device, where I have not be=
en
able to reproduce this.

        $ lspci -s 2:00
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (r=
ev
a2)

2. The same corruptions started some time after startup (no suspend in
between). After some time, I closed Iceweasel/Firefox and the system froze.=
 I
just pressed the reset button and the corruption was right there the next
start. So it might have to do something with the card setup. Then it froze
pretty quickly (after five minutes) without even starting Iceweasel/Firefox=
 and
just awesome WM and uxrvt terminals running. Switching the power supply and
then starting again the corruption was gone and I could not reproduce it ag=
ain
today.

3. This is a hard freeze, meaning I am not able to ping the machine when it=
 is
frozen.

4. I checked again and the log files do not contain anything before the cra=
sh
related to Nouveau or the graphics stack.

5. I am going to try Linux 3.10 from Debian Backports [1], though was not t=
he
Linux Nouveau module rewritten in Linux 3.7 [2], so that this is not going =
to
point to the problem in Linux 3.2 (with DRM from 3.4.47 [3])?

[1] http://backports.debian.org/
[2] http://www.phoronix.com/scan.php?page=3Dnews_item&px=3DMTE1NDg
[3]
http://ftp-master.metadata.debian.org/changelogs//main/l/linux/linux_3.2.46=
-1+deb7u1_changelog
    =C2=BBdrm, agp: Update to 3.4.47:=C2=AB

=C2=B9 Here are the Nouveau messages from the Linux kernel ring buffer.

        $ dmesg | grep -i nouveau
        [    6.006338] nouveau 0000:04:00.0: setting latency timer to 64
        [    6.006359] [drm] nouveau 0000:04:00.0: Detected an NV50 generat=
ion
card (0x298200a2)
        [    6.012273] [drm] nouveau 0000:04:00.0: Checking PRAMIN for VBIOS
        [    6.588173] [drm] nouveau 0000:04:00.0: ... appears to be valid
        [    6.588176] [drm] nouveau 0000:04:00.0: Using VBIOS from PRAMIN
        [    6.588180] [drm] nouveau 0000:04:00.0: BIT BIOS found
        [    6.588183] [drm] nouveau 0000:04:00.0: Bios version 62.98.71.00
        [    6.588186] [drm] nouveau 0000:04:00.0: TMDS table version 2.0
        [    6.589065] [drm] nouveau 0000:04:00.0: MXM: no VBIOS data, noth=
ing
to do
        [    6.589068] [drm] nouveau 0000:04:00.0: DCB version 4.0
        [    6.589071] [drm] nouveau 0000:04:00.0: DCB outp 00: 02000300
00000028
        [    6.589074] [drm] nouveau 0000:04:00.0: DCB outp 01: 01000302
00020030
        [    6.589076] [drm] nouveau 0000:04:00.0: DCB outp 02: 04011310
00000028
        [    6.589078] [drm] nouveau 0000:04:00.0: DCB conn 00: 00001030
        [    6.589080] [drm] nouveau 0000:04:00.0: DCB conn 01: 00000200
        [    6.589085] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 0
at offset 0xD691
        [    6.614808] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 1
at offset 0xDA96
        [    6.621444] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 2
at offset 0xE392
        [    6.621477] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 3
at offset 0xE460
        [    6.622693] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 4
at offset 0xE716
        [    6.622695] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 at
offset 0xE77B
        [    6.642560] [drm] nouveau 0000:04:00.0: 0xE77B: Condition still =
not
met after 20ms, skipping following opcodes
        [    6.644880] [drm] nouveau 0000:04:00.0: Detected 512MiB VRAM (DD=
R2)
        [    6.645915] [drm] nouveau 0000:04:00.0: 512 MiB GART (aperture)
        [    6.988385] [drm] nouveau 0000:04:00.0: 1 available performance
level(s)
        [    6.988389] [drm] nouveau 0000:04:00.0: 3: core 567MHz shader
1400MHz memory 400MHz fanspeed 100%
        [    6.988392] [drm] nouveau 0000:04:00.0: c: core 500MHz shader
1300MHz memory 399MHz
        [    7.119405] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb:
0x320000, bo f745aa00
        [    7.119474] fbcon: nouveaufb (fb0) is primary device
        [    7.165821] fb0: nouveaufb frame buffer device
        [    7.166156] [drm] Initialized nouveau 1.0.0 20120316 for
0000:04:00.0 on minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1379363153.00c15862.5618
Date: Mon, 16 Sep 2013 20:25:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:paulepant=
er&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter&#64;user=
s.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Random image corruptions (in Debian Wheezy with Linux=
 3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349">bug 69349<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>paulepanter&#64;users.sourceforge.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Random image corruptions (in Debian Wheezy with Linux=
 3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Random image corruptions (in Debian Wheezy with Linux=
 3.2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349">bug 69349<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
paulepanter&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter=
&#64;users.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span></b>
        <pre>Today it happened again=C2=B9.

1. Some more information about the system:

        $ lspci -s 4:00
        04:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce =
8400
GS] (rev a1)

I have another system with an integrated Nvidia device, where I have not be=
en
able to reproduce this.

        $ lspci -s 2:00
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (r=
ev
a2)

2. The same corruptions started some time after startup (no suspend in
between). After some time, I closed Iceweasel/Firefox and the system froze.=
 I
just pressed the reset button and the corruption was right there the next
start. So it might have to do something with the card setup. Then it froze
pretty quickly (after five minutes) without even starting Iceweasel/Firefox=
 and
just awesome WM and uxrvt terminals running. Switching the power supply and
then starting again the corruption was gone and I could not reproduce it ag=
ain
today.

3. This is a hard freeze, meaning I am not able to ping the machine when it=
 is
frozen.

4. I checked again and the log files do not contain anything before the cra=
sh
related to Nouveau or the graphics stack.

5. I am going to try Linux 3.10 from Debian Backports [1], though was not t=
he
Linux Nouveau module rewritten in Linux 3.7 [2], so that this is not going =
to
point to the problem in Linux 3.2 (with DRM from 3.4.47 [3])?

[1] <a href=3D"http://backports.debian.org/">http://backports.debian.org/</=
a>
[2] <a href=3D"http://www.phoronix.com/scan.php?page=3Dnews_item&amp;px=3DM=
TE1NDg">http://www.phoronix.com/scan.php?page=3Dnews_item&amp;px=3DMTE1NDg<=
/a>
[3]
<a href=3D"http://ftp-master.metadata.debian.org/changelogs//main/l/linux/l=
inux_3.2.46-1+deb7u1_changelog">http://ftp-master.metadata.debian.org/chang=
elogs//main/l/linux/linux_3.2.46-1+deb7u1_changelog</a>
    =C2=BBdrm, agp: Update to 3.4.47:=C2=AB

=C2=B9 Here are the Nouveau messages from the Linux kernel ring buffer.

        $ dmesg | grep -i nouveau
        [    6.006338] nouveau 0000:04:00.0: setting latency timer to 64
        [    6.006359] [drm] nouveau 0000:04:00.0: Detected an NV50 generat=
ion
card (0x298200a2)
        [    6.012273] [drm] nouveau 0000:04:00.0: Checking PRAMIN for VBIOS
        [    6.588173] [drm] nouveau 0000:04:00.0: ... appears to be valid
        [    6.588176] [drm] nouveau 0000:04:00.0: Using VBIOS from PRAMIN
        [    6.588180] [drm] nouveau 0000:04:00.0: BIT BIOS found
        [    6.588183] [drm] nouveau 0000:04:00.0: Bios version 62.98.71.00
        [    6.588186] [drm] nouveau 0000:04:00.0: TMDS table version 2.0
        [    6.589065] [drm] nouveau 0000:04:00.0: MXM: no VBIOS data, noth=
ing
to do
        [    6.589068] [drm] nouveau 0000:04:00.0: DCB version 4.0
        [    6.589071] [drm] nouveau 0000:04:00.0: DCB outp 00: 02000300
00000028
        [    6.589074] [drm] nouveau 0000:04:00.0: DCB outp 01: 01000302
00020030
        [    6.589076] [drm] nouveau 0000:04:00.0: DCB outp 02: 04011310
00000028
        [    6.589078] [drm] nouveau 0000:04:00.0: DCB conn 00: 00001030
        [    6.589080] [drm] nouveau 0000:04:00.0: DCB conn 01: 00000200
        [    6.589085] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 0
at offset 0xD691
        [    6.614808] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 1
at offset 0xDA96
        [    6.621444] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 2
at offset 0xE392
        [    6.621477] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 3
at offset 0xE460
        [    6.622693] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 4
at offset 0xE716
        [    6.622695] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table=
 at
offset 0xE77B
        [    6.642560] [drm] nouveau 0000:04:00.0: 0xE77B: Condition still =
not
met after 20ms, skipping following opcodes
        [    6.644880] [drm] nouveau 0000:04:00.0: Detected 512MiB VRAM (DD=
R2)
        [    6.645915] [drm] nouveau 0000:04:00.0: 512 MiB GART (aperture)
        [    6.988385] [drm] nouveau 0000:04:00.0: 1 available performance
level(s)
        [    6.988389] [drm] nouveau 0000:04:00.0: 3: core 567MHz shader
1400MHz memory 400MHz fanspeed 100%
        [    6.988392] [drm] nouveau 0000:04:00.0: c: core 500MHz shader
1300MHz memory 399MHz
        [    7.119405] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb:
0x320000, bo f745aa00
        [    7.119474] fbcon: nouveaufb (fb0) is primary device
        [    7.165821] fb0: nouveaufb frame buffer device
        [    7.166156] [drm] Initialized nouveau 1.0.0 20120316 for
0000:04:00.0 on minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379363153.00c15862.5618--

--===============0855665171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0855665171==--
