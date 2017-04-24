From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100769] New: Segfault in libgtk-3.so when starting
 gnome-session after upgrade
Date: Mon, 24 Apr 2017 08:27:40 +0000
Message-ID: <bug-100769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2088035304=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2088035304==
Content-Type: multipart/alternative; boundary="14930224590.BaFF.31069";
 charset="UTF-8"


--14930224590.BaFF.31069
Date: Mon, 24 Apr 2017 08:27:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100769

            Bug ID: 100769
           Summary: Segfault in libgtk-3.so when starting gnome-session
                    after upgrade
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: loopsysdev-osHb8hq8U8NBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I manage eight Fedora 25 desktop machines of different makes which all are
updated in tandem. This morning I ran `sudo sh -c 'dnf update -y && reboot'=
` on
all of them, and two of them did not come back up. Based on the logs it app=
ears
the problem is with libgtk-3.so.0.2200.11. From dmesg on machine 1:

gnome-session-f[5292]: segfault at 0 ip 00007f46a0aa94e9 sp 00007ffc4b398840
error 4 in libgtk-3.so.0.2200.11[7f46a07ca000+6f9000]
gnome-session-f[5713]: segfault at 0 ip 00007fdc1d4a54e9 sp 00007ffce01ed260
error 4 in libgtk-3.so.0.2200.11[7fdc1d1c6000+6f9000]

On machine 2:

gnome-session-f[3160]: segfault at 0 ip 00007f2ea97674e9 sp 00007ffc23562d80
error 4 in libgtk-3.so.0.2200.11[7f2ea9488000+6f9000]

From /var/log/dnf.log, the list of updated packages:

gnutls.x86_64 3.5.11-1.fc25
ibus-typing-booster.noarch 1.5.31-1.fc25
js-jquery.noarch 2.2.4-3.fc25
libipa_hbac.x86_64 1.15.2-2.fc25
libsemanage.x86_64 2.5-9.fc25
libsemanage-python.x86_64 2.5-9.fc25
libsemanage-python3.x86_64 2.5-9.fc25
libsss_autofs.x86_64 1.15.2-2.fc25
libsss_idmap.x86_64 1.15.2-2.fc25
libsss_nss_idmap.x86_64 1.15.2-2.fc25
libsss_sudo.x86_64 1.15.2-2.fc25
nfs-utils.x86_64 1:2.1.1-4.rc2.fc25
nss-softokn.x86_64 3.29.5-1.0.fc25
nss-softokn-freebl.x86_64 3.29.5-1.0.fc25
nss-util.x86_64 3.29.5-1.0.fc25
python3-sssdconfig.noarch 1.15.2-2.fc25
sssd.x86_64 1.15.2-2.fc25
sssd-ad.x86_64 1.15.2-2.fc25
sssd-client.x86_64 1.15.2-2.fc25
sssd-common.x86_64 1.15.2-2.fc25
sssd-common-pac.x86_64 1.15.2-2.fc25
sssd-ipa.x86_64 1.15.2-2.fc25
sssd-krb5.x86_64 1.15.2-2.fc25
sssd-krb5-common.x86_64 1.15.2-2.fc25
sssd-ldap.x86_64 1.15.2-2.fc25
sssd-nfs-idmap.x86_64 1.15.2-2.fc25
sssd-proxy.x86_64 1.15.2-2.fc25
xorg-x11-drv-nouveau.x86_64 1:1.0.14-1.fc25

Workaround: Downgrade the Nouveau driver:

sudo dnf install xorg-x11-drv-nouveau-1\:1.0.13-1.fc25.x86_64

Worked for both machines.

$ uname -srvmo
Linux 4.10.10-200.fc25.x86_64 #1 SMP Thu Apr 13 01:11:51 UTC 2017 x86_64
GNU/Linux

[As reported at https://bugzilla.gnome.org/show_bug.cgi?id=3D781576]

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14930224590.BaFF.31069
Date: Mon, 24 Apr 2017 08:27:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Segfault in libgtk-3.so when starting gnome-session after=
 upgrade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100769">100769</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segfault in libgtk-3.so when starting gnome-session after upg=
rade
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>loopsysdev&#64;navetas.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I manage eight Fedora 25 desktop machines of different makes w=
hich all are
updated in tandem. This morning I ran `sudo sh -c 'dnf update -y &amp;&amp;=
 reboot'` on
all of them, and two of them did not come back up. Based on the logs it app=
ears
the problem is with libgtk-3.so.0.2200.11. From dmesg on machine 1:

gnome-session-f[5292]: segfault at 0 ip 00007f46a0aa94e9 sp 00007ffc4b398840
error 4 in libgtk-3.so.0.2200.11[7f46a07ca000+6f9000]
gnome-session-f[5713]: segfault at 0 ip 00007fdc1d4a54e9 sp 00007ffce01ed260
error 4 in libgtk-3.so.0.2200.11[7fdc1d1c6000+6f9000]

On machine 2:

gnome-session-f[3160]: segfault at 0 ip 00007f2ea97674e9 sp 00007ffc23562d80
error 4 in libgtk-3.so.0.2200.11[7f2ea9488000+6f9000]

From /var/log/dnf.log, the list of updated packages:

gnutls.x86_64 3.5.11-1.fc25
ibus-typing-booster.noarch 1.5.31-1.fc25
js-jquery.noarch 2.2.4-3.fc25
libipa_hbac.x86_64 1.15.2-2.fc25
libsemanage.x86_64 2.5-9.fc25
libsemanage-python.x86_64 2.5-9.fc25
libsemanage-python3.x86_64 2.5-9.fc25
libsss_autofs.x86_64 1.15.2-2.fc25
libsss_idmap.x86_64 1.15.2-2.fc25
libsss_nss_idmap.x86_64 1.15.2-2.fc25
libsss_sudo.x86_64 1.15.2-2.fc25
nfs-utils.x86_64 1:2.1.1-4.rc2.fc25
nss-softokn.x86_64 3.29.5-1.0.fc25
nss-softokn-freebl.x86_64 3.29.5-1.0.fc25
nss-util.x86_64 3.29.5-1.0.fc25
python3-sssdconfig.noarch 1.15.2-2.fc25
sssd.x86_64 1.15.2-2.fc25
sssd-ad.x86_64 1.15.2-2.fc25
sssd-client.x86_64 1.15.2-2.fc25
sssd-common.x86_64 1.15.2-2.fc25
sssd-common-pac.x86_64 1.15.2-2.fc25
sssd-ipa.x86_64 1.15.2-2.fc25
sssd-krb5.x86_64 1.15.2-2.fc25
sssd-krb5-common.x86_64 1.15.2-2.fc25
sssd-ldap.x86_64 1.15.2-2.fc25
sssd-nfs-idmap.x86_64 1.15.2-2.fc25
sssd-proxy.x86_64 1.15.2-2.fc25
xorg-x11-drv-nouveau.x86_64 1:1.0.14-1.fc25

Workaround: Downgrade the Nouveau driver:

sudo dnf install xorg-x11-drv-nouveau-1\:1.0.13-1.fc25.x86_64

Worked for both machines.

$ uname -srvmo
Linux 4.10.10-200.fc25.x86_64 #1 SMP Thu Apr 13 01:11:51 UTC 2017 x86_64
GNU/Linux

[As reported at <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D781=
576">https://bugzilla.gnome.org/show_bug.cgi?id=3D781576</a>]</pre>
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

--14930224590.BaFF.31069--

--===============2088035304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2088035304==--
