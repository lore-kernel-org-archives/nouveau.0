From: Olof Johansson <olof@lixom.net>
Subject: Fwd: [Bug 99900] nouveau: freeze / crash after kernel update to 4.10
Date: Tue, 20 Jun 2017 09:54:40 -0700
Message-ID: <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>
References: <bug-99900-502@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2067424298=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <bug-99900-502@http.bugs.freedesktop.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, bskeggs@redhat.com, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============2067424298==
Content-Type: multipart/alternative; boundary="001a114b927e8fd0f00552671b55"

--001a114b927e8fd0f00552671b55
Content-Type: text/plain; charset="UTF-8"

Hey,

This was reported back in February and it seems nobody's given a shit?

I've got a machine here with a Quadro 4000 that the screen locks up on
every single time the monitor goes to sleep. Userspace is Ubuntu 16.04,
kernel is recent mainline (4.12-rc4+). It's been happening since 4.10
though.

Can we please see this fixed by 4.12? It's an enormous regression and a
major hassle to deal with as a user.


-Olof

---------- Forwarded message ----------
From: <bugzilla-daemon@freedesktop.org>
Date: Wed, Feb 22, 2017 at 4:03 AM
Subject: [Bug 99900] nouveau: freeze / crash after kernel update to 4.10
To: dri-devel@lists.freedesktop.org


Bug ID 99900 <https://bugs.freedesktop.org/show_bug.cgi?id=99900>
Summary nouveau: freeze / crash after kernel update to 4.10
Product DRI
Version XOrg git
Hardware x86-64 (AMD64)
OS Linux (All)
Status NEW
Severity normal
Priority medium
Component DRM/other
Assignee dri-devel@lists.freedesktop.org
Reporter krah.tm@gmail.com

Created attachment 129823
<https://bugs.freedesktop.org/attachment.cgi?id=129823> [details]
<https://bugs.freedesktop.org/attachment.cgi?id=129823&action=edit>
dmesg 4.10 - fifo write fault

After release of 4.10 kernel i've used that one from here:
http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/

with my ubuntu trusty LTS.
Xorg is now crashing whenever my monitors are going to sleep (happens always in
my lunch time) - after returning its crashed and i need todo a hard reset to
get the gpu running again.
This is what is printed to dmesg when this happens (machine is still working
via ssh):

[11010.813785] nouveau 0000:01:00.0: fifo: PBDMA0: 04000100 [] ch 2 [001fcc0000
Xorg[2593]] subc 5 mthd 001c data 00000001
[11010.813815] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 0010 data 00000000
[11010.813838] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 0014 data 0001b020
[11010.813864] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 0018 data 003c9310
[11010.813886] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 001c data 00000002
[11010.813905] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 0020 data 00000000
[11010.813919] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 3 mthd 0200 data 000000cf
[11010.813937] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 3 mthd 0204 data 00000000
[11010.813954] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 3 mthd 0208 data 00000010
[11010.813973] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 3 mthd 020c data 00000001
[11010.813990] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 3 mthd 0210 data 00000000
[11010.814014] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc0000
Xorg[2593]] subc 0 mthd 0010 data 00000000
[11010.814060] nouveau 0000:01:00.0: fifo: write fault at 000169b000 engine 00
[PGRAPH] client 0f [GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on channel 2
[001fcc0000 Xorg[2593]]
[11010.814070] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...


Xorg.log does have that:

[    42.993] (WW) NOUVEAU(0): flip queue failed: Device or resource busy

Trying to restart Xorg is unsuccessful.

[  8810.799] (WW) NOUVEAU(0): flip queue failed: Invalid argument


This does not happen with 4.9.6 i've running now.
Anything i should/can provide or try to get this fixed?

------------------------------
You are receiving this mail because:

   - You are the assignee for the bug.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--001a114b927e8fd0f00552671b55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey,<div><br></div><div>This was reported back in February=
 and it seems nobody&#39;s given a shit?</div><div><br></div><div>I&#39;ve =
got a machine here with a Quadro 4000 that the screen locks up on every sin=
gle time the monitor goes to sleep. Userspace is Ubuntu 16.04, kernel is re=
cent mainline (4.12-rc4+). It&#39;s been happening since 4.10 though.</div>=
<div><br></div><div>Can we please see this fixed by 4.12? It&#39;s an enorm=
ous regression and a major hassle to deal with as a user.</div><div><br></d=
iv><div><br></div><div>-Olof</div><div><br><div class=3D"gmail_quote">-----=
----- Forwarded message ----------<br>From: <b class=3D"gmail_sendername"><=
/b> <span dir=3D"ltr">&lt;<a href=3D"mailto:bugzilla-daemon@freedesktop.org=
">bugzilla-daemon@freedesktop.org</a>&gt;</span><br>Date: Wed, Feb 22, 2017=
 at 4:03 AM<br>Subject: [Bug 99900] nouveau: freeze / crash after kernel up=
date to 4.10<br>To: <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-=
devel@lists.freedesktop.org</a><br><br><br>
   =20
     =20
   =20
    <div><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tbody><tr>
          <th>Bug ID</th>
          <td><a class=3D"m_3843646793439780866bz_bug_link m_38436467934397=
80866bz_status_NEW" title=3D"NEW - nouveau: freeze / crash after kernel upd=
ate to 4.10" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900" =
target=3D"_blank">99900</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau: freeze / crash after kernel update to 4.10
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/other
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td><a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"=
_blank">dri-devel@lists.freedesktop.<wbr>org</a>
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td><a href=3D"mailto:krah.tm@gmail.com" target=3D"_blank">krah.t=
m@gmail.com</a>
          </td>
        </tr></tbody></table>
      <p>
        </p><div>
        <pre>Created <span><a href=3D"https://bugs.freedesktop.org/attachme=
nt.cgi?id=3D129823" name=3D"m_3843646793439780866_attach_129823" title=3D"d=
mesg 4.10 - fifo write fault" target=3D"_blank">attachment 129823</a> <a hr=
ef=3D"https://bugs.freedesktop.org/attachment.cgi?id=3D129823&amp;action=3D=
edit" title=3D"dmesg 4.10 - fifo write fault" target=3D"_blank">[details]</=
a></span>
dmesg 4.10 - fifo write fault

After release of 4.10 kernel i&#39;ve used that one from here:

<a href=3D"http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/" target=3D"=
_blank">http://kernel.ubuntu.com/~<wbr>kernel-ppa/mainline/v4.10/</a>

with my ubuntu trusty LTS.
Xorg is now crashing whenever my monitors are going to sleep (happens alway=
s in
my lunch time) - after returning its crashed and i need todo a hard reset t=
o
get the gpu running again.
This is what is printed to dmesg when this happens (machine is still workin=
g
via ssh):

[11010.813785] nouveau 0000:01:00.0: fifo: PBDMA0: 04000100 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 5 mthd 001c data 00000001
[11010.813815] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 0010 data 00000000
[11010.813838] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 0014 data 0001b020
[11010.813864] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 0018 data 003c9310
[11010.813886] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 001c data 00000002
[11010.813905] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 0020 data 00000000
[11010.813919] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 3 mthd 0200 data 000000cf
[11010.813937] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 3 mthd 0204 data 00000000
[11010.813954] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 3 mthd 0208 data 00000010
[11010.813973] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 3 mthd 020c data 00000001
[11010.813990] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 3 mthd 0210 data 00000000
[11010.814014] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [001fcc=
0000
Xorg[2593]] subc 0 mthd 0010 data 00000000
[11010.814060] nouveau 0000:01:00.0: fifo: write fault at 000169b000 engine=
 00
[PGRAPH] client 0f [GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on channel 2
[001fcc0000 Xorg[2593]]
[11010.814070] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...


Xorg.log does have that:

[    42.993] (WW) NOUVEAU(0): flip queue failed: Device or resource busy

Trying to restart Xorg is unsuccessful.

[  8810.799] (WW) NOUVEAU(0): flip queue failed: Invalid argument


This does not happen with 4.9.6 i&#39;ve running now.
Anything i should/can provide or try to get this fixed?</pre>
        </div>
      <p></p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </div>
<br>______________________________<wbr>_________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.<wbr>org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/l=
istinfo/dri-devel</a><br>
<br></div><br></div></div>

--001a114b927e8fd0f00552671b55--

--===============2067424298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2067424298==--
