From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Fri, 12 Aug 2016 19:23:49 +0000
Message-ID: <bug-94990-8800-RBnDIW9klf@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1581769331=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1581769331==
Content-Type: multipart/alternative; boundary="14710298282.Ecea07C24.23508";
 charset="UTF-8"


--14710298282.Ecea07C24.23508
Date: Fri, 12 Aug 2016 19:23:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #56 from Ivan <antaiji-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
So, I just install fresh Fedora 24 with kernel-4.5.5, then remove nouveau f=
rom
system completely:

1. # echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

2. Paste =E2=80=98rd.driver.blacklist=3Dnouveau=E2=80=99 to end of =E2=80=
=98GRUB_CMDLINE_LINUX=3D=E2=80=9D=E2=80=A6=E2=80=9D  in
/etc/sysconfig/grub

3. # grub2-mkconfig -o /boot/grub2/grub.cfg

4. # dnf remove xorg-x11-drv-nouveau

5. # dracut /boot/initramfs-$(uname -r).img $(uname -r)

After this steps reboot, upgrade system to kernel-4.6.5, and install nVidia
proprietary driver. Everything works just fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14710298282.Ecea07C24.23508
Date: Fri, 12 Aug 2016 19:23:48 +0000
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
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c56">Commen=
t # 56</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
antaiji&#64;yandex.ru" title=3D"Ivan &lt;antaiji&#64;yandex.ru&gt;"> <span =
class=3D"fn">Ivan</span></a>
</span></b>
        <pre>So, I just install fresh Fedora 24 with kernel-4.5.5, then rem=
ove nouveau from
system completely:

1. # echo &quot;blacklist nouveau&quot; &gt;&gt; /etc/modprobe.d/blacklist.=
conf

2. Paste =E2=80=98rd.driver.blacklist=3Dnouveau=E2=80=99 to end of =E2=80=
=98GRUB_CMDLINE_LINUX=3D=E2=80=9D=E2=80=A6=E2=80=9D  in
/etc/sysconfig/grub

3. # grub2-mkconfig -o /boot/grub2/grub.cfg

4. # dnf remove xorg-x11-drv-nouveau

5. # dracut /boot/initramfs-$(uname -r).img $(uname -r)

After this steps reboot, upgrade system to kernel-4.6.5, and install nVidia
proprietary driver. Everything works just fine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14710298282.Ecea07C24.23508--

--===============1581769331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1581769331==--
