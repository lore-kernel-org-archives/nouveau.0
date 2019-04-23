From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Tue, 23 Apr 2019 18:56:06 +0000
Message-ID: <bug-110500-8800-PcZc6apxvU@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1015557924=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1015557924==
Content-Type: multipart/alternative; boundary="15560457660.656f29.16820"
Content-Transfer-Encoding: 7bit


--15560457660.656f29.16820
Date: Tue, 23 Apr 2019 18:56:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #5 from wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org <wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org>=
 ---
Karol Herbst gave me this here to put into
/etc/X11/xorg.conf.d/20-nouveau.conf:

Section "Device"
        Identifier "NvidiaCard"
        Driver "nouveau"
        BusID "PCI:01:00:0" # PCI bus address of the Nvidia GPU here
EndSection

I had to create xorg.conf.d first. Afterwards i put the config file there
inside.

Now i also see in the xorg.log NOUVEAU(0). Lets hope the machine works fine
now.

I think this should be fixed so that normal user dont have to struggle arou=
nd
with this. I think i am a more advanced user. The person i help here that w=
ould
like to switch to Linux told me now about 10 times that he would not have b=
een
able to do that what i did (understand that its nouveau, report a bug, know
about IRC, join IRC, dmesg things, lsmod things, ...).

This is a machine with 8 CPU cores, support up to 32GB of RAM, ... It have =
been
updated few times. Its just for office usage. The GPU have 512MB of VRAM. I
have played good looking games on 128MB of VRAM.
The system should not crash in office mode (browsing the emails in a email
software, not browser).

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15560457660.656f29.16820
Date: Tue, 23 Apr 2019 18:56:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wixbisce&#64;guerrillamail.com" title=3D"wixbisce&#64;guerrillamail.com &lt=
;wixbisce&#64;guerrillamail.com&gt;"> <span class=3D"fn">wixbisce&#64;guerr=
illamail.com</span></a>
</span></b>
        <pre>Karol Herbst gave me this here to put into
/etc/X11/xorg.conf.d/20-nouveau.conf:

Section &quot;Device&quot;
        Identifier &quot;NvidiaCard&quot;
        Driver &quot;nouveau&quot;
        BusID &quot;PCI:01:00:0&quot; # PCI bus address of the Nvidia GPU h=
ere
EndSection

I had to create xorg.conf.d first. Afterwards i put the config file there
inside.

Now i also see in the xorg.log NOUVEAU(0). Lets hope the machine works fine
now.

I think this should be fixed so that normal user dont have to struggle arou=
nd
with this. I think i am a more advanced user. The person i help here that w=
ould
like to switch to Linux told me now about 10 times that he would not have b=
een
able to do that what i did (understand that its nouveau, report a bug, know
about IRC, join IRC, dmesg things, lsmod things, ...).

This is a machine with 8 CPU cores, support up to 32GB of RAM, ... It have =
been
updated few times. Its just for office usage. The GPU have 512MB of VRAM. I
have played good looking games on 128MB of VRAM.
The system should not crash in office mode (browsing the emails in a email
software, not browser).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15560457660.656f29.16820--

--===============1015557924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1015557924==--
