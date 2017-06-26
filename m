From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Mon, 26 Jun 2017 00:03:30 +0000
Message-ID: <bug-93629-8800-5HIko8WJiD@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0899637525=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0899637525==
Content-Type: multipart/alternative; boundary="14984354101.E9bDd8ccf.23217";
 charset="UTF-8"


--14984354101.E9bDd8ccf.23217
Date: Mon, 26 Jun 2017 00:03:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #36 from jadziadax30-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Here is also part of dmesg:

[    7.332094] IPv6: ADDRCONF(NETDEV_UP): enp11s0: link is not ready
[    7.334879] IPv6: ADDRCONF(NETDEV_UP): wlp9s0: link is not ready
[   12.558301] ERROR @wl_cfg80211_scan :=20
[   12.558303] WLC_SCAN error (-22)
[   12.569340] ERROR @wl_notify_scan_status :=20
[   12.569342] wlp9s0 Scan_results error (-22)
[   12.984633] mount.nfs4 (3700) used greatest stack depth: 9856 bytes left
[ 4226.739222] NFS: v4 server 192.168.0.3 does not accept raw uid/gids.
Reenabling the idmapper.
[49795.891760] audit: type=3D1702 audit(1498309367.761:2): op=3Dlinkat ppid=
=3D20945
pid=3D21158 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D"git" exe=3D"/usr/bin/=
git" subj=3Dkernel
res=3D0
[49795.891765] audit: type=3D1302 audit(1498309367.761:3): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/89/tmp_obj_7ZX1y3"
inode=3D29891841 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[49836.264906] audit: type=3D1702 audit(1498309408.136:4): op=3Dlinkat ppid=
=3D20945
pid=3D21193 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D"git" exe=3D"/usr/bin/=
git" subj=3Dkernel
res=3D0
[49836.264912] audit: type=3D1302 audit(1498309408.136:5): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/95/tmp_obj_VxWTRh"
inode=3D29891847 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[49954.662919] audit: type=3D1702 audit(1498309526.537:6): op=3Dlinkat ppid=
=3D20945
pid=3D21258 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D"git" exe=3D"/usr/bin/=
git" subj=3Dkernel
res=3D0
[49954.662924] audit: type=3D1302 audit(1498309526.537:7): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/30/tmp_obj_gJFUTM"
inode=3D29891867 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[75480.055986] vmd_LINUX[14529]: segfault at 10b62 ip 0000000000010b62 sp
00007ffd53856208 error 14 in vmd_LINUX[400000+41d000]
[78854.971201] python[14803]: segfault at bad80e0 ip 000000000bad80e0 sp
00007ffebb5439a8 error 15
[128063.630122] python[20378]: segfault at 0 ip           (null) sp
00007ffebc4fd3e8 error 14 in python[400000+118000]
[139982.541762] traps: pluma[12851] general protection ip:7f90293d53c6
sp:7ffe222ea688 error:0
[139982.541768]  in libc-2.23.so[7f9029357000+190000]
[157524.753121] ERROR @wl_cfg80211_scan :=20
[157524.753123] WLC_SCAN error (-22)
[157524.770899] ERROR @wl_cfg80211_scan :=20
[157524.770901] WLC_SCAN error (-22)
[157525.771293] ERROR @wl_cfg80211_scan :=20
[157525.771295] WLC_SCAN error (-22)
[157526.772452] ERROR @wl_cfg80211_scan :=20
[157526.772453] WLC_SCAN error (-22)
[157527.773574] ERROR @wl_cfg80211_scan :=20
[157527.773576] WLC_SCAN error (-22)
[157528.774743] ERROR @wl_cfg80211_scan :=20
[157528.774746] WLC_SCAN error (-22)
[157563.204816] ERROR @wl_notify_scan_status :=20
[157563.204818] wlp9s0 Scan_results error (-22)
[157571.215884] ERROR @wl_cfg80211_scan :=20
[157571.215886] WLC_SCAN error (-22)
[157571.260789] ERROR @wl_cfg80211_scan :=20
[157571.260790] WLC_SCAN error (-22)
[165109.303572] audit: type=3D1702 audit(1498424684.260:8): op=3Dlinkat ppi=
d=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165109.303577] audit: type=3D1302 audit(1498424684.260:9): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/67/=
tmp_obj_T4Q5Gq"
inode=3D29891920 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.326565] audit: type=3D1702 audit(1498424684.283:10): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165109.326570] audit: type=3D1302 audit(1498424684.283:11): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/c2/=
tmp_obj_nYbKHu"
inode=3D29891922 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.358538] audit: type=3D1702 audit(1498424684.314:12): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165109.358543] audit: type=3D1302 audit(1498424684.314:13): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/a7/=
tmp_obj_Z19Cgx"
inode=3D29891924 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.387394] audit: type=3D1702 audit(1498424684.343:14): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165109.387398] audit: type=3D1302 audit(1498424684.343:15): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/9f/=
tmp_obj_f4qb3v"
inode=3D29891926 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.407037] audit: type=3D1702 audit(1498424684.363:16): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165109.407042] audit: type=3D1302 audit(1498424684.363:17): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/8f/=
tmp_obj_LWwMBy"
inode=3D29891928 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165120.998695] audit_printk_skb: 144 callbacks suppressed
[165120.998696] audit: type=3D1702 audit(1498424695.956:66): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165120.998701] audit: type=3D1302 audit(1498424695.956:67): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/a5/=
tmp_obj_8LoZDe"
inode=3D29891979 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.021572] audit: type=3D1702 audit(1498424695.979:68): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165121.021577] audit: type=3D1302 audit(1498424695.979:69): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/94/=
tmp_obj_yv5Wvg"
inode=3D29891981 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.082312] audit: type=3D1702 audit(1498424696.040:70): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165121.082318] audit: type=3D1302 audit(1498424696.040:71): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/5a/=
tmp_obj_VzQB8d"
inode=3D29891983 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.095029] audit: type=3D1702 audit(1498424696.052:72): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165121.095033] audit: type=3D1302 audit(1498424696.052:73): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/d8/=
tmp_obj_bgwase"
inode=3D29891985 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.173133] audit: type=3D1702 audit(1498424696.130:74): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165121.173138] audit: type=3D1302 audit(1498424696.130:75): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/c5/=
tmp_obj_hj2mkh"
inode=3D29891987 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165703.986491] audit: type=3D1702 audit(1498425278.960:76): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165703.986496] audit: type=3D1302 audit(1498425278.960:77): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/30/=
tmp_obj_r5E4qe"
inode=3D29892006 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165704.044972] audit: type=3D1702 audit(1498425279.018:78): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165704.044976] audit: type=3D1302 audit(1498425279.018:79): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/ac/=
tmp_obj_H1E7Ck"
inode=3D29892008 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165704.120809] audit: type=3D1702 audit(1498425279.094:80): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165704.120814] audit: type=3D1302 audit(1498425279.094:81): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/67/=
tmp_obj_Cnnsbf"
inode=3D29892009 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.174594] audit: type=3D1702 audit(1498425306.148:82): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165731.174599] audit: type=3D1302 audit(1498425306.148:83): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/b6/=
tmp_obj_r5CGRl"
inode=3D29892011 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.188550] audit: type=3D1702 audit(1498425306.162:84): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165731.188554] audit: type=3D1302 audit(1498425306.162:85): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/4e/=
tmp_obj_9zxrAj"
inode=3D29892013 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.269911] audit: type=3D1702 audit(1498425306.244:86): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[165731.269918] audit: type=3D1302 audit(1498425306.244:87): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/37/=
tmp_obj_HXKoQr"
inode=3D29892014 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168578.203317] audit: type=3D1702 audit(1498428153.254:88): op=3Dlinkat pp=
id=3D13665
pid=3D29645 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[168578.203323] audit: type=3D1302 audit(1498428153.254:89): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/f3/=
tmp_obj_airiOs"
inode=3D29891873 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168578.254536] audit: type=3D1702 audit(1498428153.305:90): op=3Dlinkat pp=
id=3D13665
pid=3D29645 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[168578.254541] audit: type=3D1302 audit(1498428153.305:91): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/d8/=
tmp_obj_M37WHw"
inode=3D29892015 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.032704] audit: type=3D1702 audit(1498428184.084:92): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[168609.032709] audit: type=3D1302 audit(1498428184.084:93): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/75/=
tmp_obj_MdqOdg"
inode=3D29892018 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.049501] audit: type=3D1702 audit(1498428184.101:94): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[168609.049505] audit: type=3D1302 audit(1498428184.101:95): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/cb/=
tmp_obj_uMaZ0f"
inode=3D29892020 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.099906] audit: type=3D1702 audit(1498428184.152:96): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[168609.099910] audit: type=3D1302 audit(1498428184.152:97): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/d9/=
tmp_obj_O6P9Cl"
inode=3D29892022 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170875.426550] audit: type=3D1702 audit(1498430450.538:98): op=3Dlinkat pp=
id=3D13665
pid=3D8241 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D"/usr/bin/gi=
t" subj=3Dkernel
res=3D0
[170875.426555] audit: type=3D1302 audit(1498430450.538:99): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/3d/=
tmp_obj_Vqrg2M"
inode=3D29892025 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.545473] audit: type=3D1702 audit(1498430451.657:100): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D=
"/usr/bin/git"
subj=3Dkernel res=3D0
[170876.545478] audit: type=3D1302 audit(1498430451.657:101): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/87/=
tmp_obj_EUGOPT"
inode=3D29892027 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.566269] audit: type=3D1702 audit(1498430451.678:102): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D=
"/usr/bin/git"
subj=3Dkernel res=3D0
[170876.566274] audit: type=3D1302 audit(1498430451.678:103): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/d2/=
tmp_obj_cwT1XW"
inode=3D29892029 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.639348] audit: type=3D1702 audit(1498430451.751:104): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D"git" exe=3D=
"/usr/bin/git"
subj=3Dkernel res=3D0
[170876.639353] audit: type=3D1302 audit(1498430451.751:105): item=3D0
name=3D"/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/objects/f7/=
tmp_obj_OhsuLZ"
inode=3D29892030 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[174110.131081] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131090] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131095] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131103] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131108] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
[174110.131119] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131127] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 678, y =3D 508, format =3D 18, storage type =3D 0
[174110.131134] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 602, y =3D 508, format =3D 18, storage type =3D 0
[174110.131140] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131147] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131152] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131157] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131161] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131165] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131168] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131177] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131185] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 684, y =3D 452, format =3D 18, storage type =3D 0
[174110.131192] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 598, y =3D 688, format =3D 18, storage type =3D 0
[174110.131198] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131204] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131210] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131216] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131221] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131224] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131228] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131231] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131241] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131248] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 680, y =3D 162, format =3D 18, storage type =3D 0
[174110.131255] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 688, y =3D 182, format =3D 18, storage type =3D 0
[174110.131261] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131268] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131274] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131278] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131282] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131286] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131289] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131299] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131306] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 630, format =3D 18, storage type =3D 0
[174110.131312] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131318] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131324] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131330] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131335] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131338] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131342] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131346] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131356] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131364] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 770, y =3D 92, format =3D 18, storage type =3D 0
[174110.131372] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 786, y =3D 92, format =3D 18, storage type =3D 0
[174110.131376] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131380] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131384] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131389] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131399] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131408] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 870, format =3D 18, storage type =3D 0
[174110.131415] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131421] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131426] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131430] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131434] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131438] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131449] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131456] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131462] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131470] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131476] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131481] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131486] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131490] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131494] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131504] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131513] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1164, y =3D 946, format =3D 18, storage type =3D 0
[174110.131521] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1084, y =3D 930, format =3D 18, storage type =3D 0
[174110.131528] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131536] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131542] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131547] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131551] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131556] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131560] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131572] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131579] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1070, y =3D 1072, format =3D 18, storage type =3D=
 0
[174110.131586] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 892, y =3D 24, format =3D 18, storage type =3D 0
[174110.131592] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131598] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131603] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131606] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131610] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131614] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131623] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131630] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1152, y =3D 862, format =3D 18, storage type =3D 0
[174110.131637] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1078, y =3D 1004, format =3D 18, storage type =3D=
 0
[174110.131643] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131649] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131656] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131661] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131666] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131670] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131673] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131677] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131686] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131693] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 866, y =3D 164, format =3D 18, storage type =3D 0
[174110.131700] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1374, y =3D 1092, format =3D 18, storage type =3D=
 0
[174110.131706] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131713] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131719] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131724] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131727] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131731] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131734] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131744] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131751] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 580, y =3D 838, format =3D 18, storage type =3D 0
[174110.131758] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 890, y =3D 148, format =3D 18, storage type =3D 0
[174110.131764] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131770] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131777] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131782] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131787] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131790] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131794] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131798] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131807] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131814] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 572, format =3D 18, storage type =3D 0
[174110.131820] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131826] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131832] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131838] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131843] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131846] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131850] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131854] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131863] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131871] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 582, y =3D 814, format =3D 18, storage type =3D 0
[174110.131878] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 404, y =3D 886, format =3D 18, storage type =3D 0
[174110.131884] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131889] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131896] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131901] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131906] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131910] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131913] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131917] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131930] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131939] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 398, y =3D 148, format =3D 18, storage type =3D 0
[174110.131947] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 500, y =3D 682, format =3D 18, storage type =3D 0
[174110.131953] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131958] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131965] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131971] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131975] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131979] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131983] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131986] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131996] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132003] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 582, y =3D 262, format =3D 18, storage type =3D 0
[174110.132010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 218, y =3D 166, format =3D 18, storage type =3D 0
[174110.132016] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132021] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.132028] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.132033] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132038] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.132042] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.132045] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.132049] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.132058] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132065] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 686, y =3D 294, format =3D 18, storage type =3D 0
[174110.132072] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 700, y =3D 304, format =3D 18, storage type =3D 0
[174110.132076] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.132080] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.132083] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.132087] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.132096] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132104] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 692, y =3D 250, format =3D 18, storage type =3D 0
[174110.132110] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132115] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174114.447331] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[174114.447335] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...
[174114.447786] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f406000 X[3563]] subc 0 class a097 mthd 1614 da=
ta
00000000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14984354101.E9bDd8ccf.23217
Date: Mon, 26 Jun 2017 00:03:30 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c36">Commen=
t # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jadziadax30&#64;gmail.com" title=3D"jadziadax30&#64;gmail.com">jadziadax30&=
#64;gmail.com</a>
</span></b>
        <pre>Here is also part of dmesg:

[    7.332094] IPv6: ADDRCONF(NETDEV_UP): enp11s0: link is not ready
[    7.334879] IPv6: ADDRCONF(NETDEV_UP): wlp9s0: link is not ready
[   12.558301] ERROR &#64;wl_cfg80211_scan :=20
[   12.558303] WLC_SCAN error (-22)
[   12.569340] ERROR &#64;wl_notify_scan_status :=20
[   12.569342] wlp9s0 Scan_results error (-22)
[   12.984633] mount.nfs4 (3700) used greatest stack depth: 9856 bytes left
[ 4226.739222] NFS: v4 server 192.168.0.3 does not accept raw uid/gids.
Reenabling the idmapper.
[49795.891760] audit: type=3D1702 audit(1498309367.761:2): op=3Dlinkat ppid=
=3D20945
pid=3D21158 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D&quot;git&quot; exe=3D=
&quot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[49795.891765] audit: type=3D1302 audit(1498309367.761:3): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/89/tmp_obj_7=
ZX1y3&quot;
inode=3D29891841 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[49836.264906] audit: type=3D1702 audit(1498309408.136:4): op=3Dlinkat ppid=
=3D20945
pid=3D21193 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D&quot;git&quot; exe=3D=
&quot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[49836.264912] audit: type=3D1302 audit(1498309408.136:5): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/95/tmp_obj_V=
xWTRh&quot;
inode=3D29891847 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[49954.662919] audit: type=3D1702 audit(1498309526.537:6): op=3Dlinkat ppid=
=3D20945
pid=3D21258 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3D(none) ses=3D3 comm=3D&quot;git&quot; exe=3D=
&quot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[49954.662924] audit: type=3D1302 audit(1498309526.537:7): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Coding/hyperq/.git/objects/30/tmp_obj_g=
JFUTM&quot;
inode=3D29891867 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[75480.055986] vmd_LINUX[14529]: segfault at 10b62 ip 0000000000010b62 sp
00007ffd53856208 error 14 in vmd_LINUX[400000+41d000]
[78854.971201] python[14803]: segfault at bad80e0 ip 000000000bad80e0 sp
00007ffebb5439a8 error 15
[128063.630122] python[20378]: segfault at 0 ip           (null) sp
00007ffebc4fd3e8 error 14 in python[400000+118000]
[139982.541762] traps: pluma[12851] general protection ip:7f90293d53c6
sp:7ffe222ea688 error:0
[139982.541768]  in libc-2.23.so[7f9029357000+190000]
[157524.753121] ERROR &#64;wl_cfg80211_scan :=20
[157524.753123] WLC_SCAN error (-22)
[157524.770899] ERROR &#64;wl_cfg80211_scan :=20
[157524.770901] WLC_SCAN error (-22)
[157525.771293] ERROR &#64;wl_cfg80211_scan :=20
[157525.771295] WLC_SCAN error (-22)
[157526.772452] ERROR &#64;wl_cfg80211_scan :=20
[157526.772453] WLC_SCAN error (-22)
[157527.773574] ERROR &#64;wl_cfg80211_scan :=20
[157527.773576] WLC_SCAN error (-22)
[157528.774743] ERROR &#64;wl_cfg80211_scan :=20
[157528.774746] WLC_SCAN error (-22)
[157563.204816] ERROR &#64;wl_notify_scan_status :=20
[157563.204818] wlp9s0 Scan_results error (-22)
[157571.215884] ERROR &#64;wl_cfg80211_scan :=20
[157571.215886] WLC_SCAN error (-22)
[157571.260789] ERROR &#64;wl_cfg80211_scan :=20
[157571.260790] WLC_SCAN error (-22)
[165109.303572] audit: type=3D1702 audit(1498424684.260:8): op=3Dlinkat ppi=
d=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165109.303577] audit: type=3D1302 audit(1498424684.260:9): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/67/tmp_obj_T4Q5Gq&quot;
inode=3D29891920 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.326565] audit: type=3D1702 audit(1498424684.283:10): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165109.326570] audit: type=3D1302 audit(1498424684.283:11): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/c2/tmp_obj_nYbKHu&quot;
inode=3D29891922 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.358538] audit: type=3D1702 audit(1498424684.314:12): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165109.358543] audit: type=3D1302 audit(1498424684.314:13): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/a7/tmp_obj_Z19Cgx&quot;
inode=3D29891924 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.387394] audit: type=3D1702 audit(1498424684.343:14): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165109.387398] audit: type=3D1302 audit(1498424684.343:15): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/9f/tmp_obj_f4qb3v&quot;
inode=3D29891926 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165109.407037] audit: type=3D1702 audit(1498424684.363:16): op=3Dlinkat pp=
id=3D13665
pid=3D10481 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165109.407042] audit: type=3D1302 audit(1498424684.363:17): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/8f/tmp_obj_LWwMBy&quot;
inode=3D29891928 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165120.998695] audit_printk_skb: 144 callbacks suppressed
[165120.998696] audit: type=3D1702 audit(1498424695.956:66): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165120.998701] audit: type=3D1302 audit(1498424695.956:67): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/a5/tmp_obj_8LoZDe&quot;
inode=3D29891979 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.021572] audit: type=3D1702 audit(1498424695.979:68): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165121.021577] audit: type=3D1302 audit(1498424695.979:69): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/94/tmp_obj_yv5Wvg&quot;
inode=3D29891981 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.082312] audit: type=3D1702 audit(1498424696.040:70): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165121.082318] audit: type=3D1302 audit(1498424696.040:71): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/5a/tmp_obj_VzQB8d&quot;
inode=3D29891983 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.095029] audit: type=3D1702 audit(1498424696.052:72): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165121.095033] audit: type=3D1302 audit(1498424696.052:73): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/d8/tmp_obj_bgwase&quot;
inode=3D29891985 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165121.173133] audit: type=3D1702 audit(1498424696.130:74): op=3Dlinkat pp=
id=3D13665
pid=3D10517 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165121.173138] audit: type=3D1302 audit(1498424696.130:75): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/c5/tmp_obj_hj2mkh&quot;
inode=3D29891987 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165703.986491] audit: type=3D1702 audit(1498425278.960:76): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165703.986496] audit: type=3D1302 audit(1498425278.960:77): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/30/tmp_obj_r5E4qe&quot;
inode=3D29892006 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165704.044972] audit: type=3D1702 audit(1498425279.018:78): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165704.044976] audit: type=3D1302 audit(1498425279.018:79): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/ac/tmp_obj_H1E7Ck&quot;
inode=3D29892008 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165704.120809] audit: type=3D1702 audit(1498425279.094:80): op=3Dlinkat pp=
id=3D13665
pid=3D12521 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165704.120814] audit: type=3D1302 audit(1498425279.094:81): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/67/tmp_obj_Cnnsbf&quot;
inode=3D29892009 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.174594] audit: type=3D1702 audit(1498425306.148:82): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165731.174599] audit: type=3D1302 audit(1498425306.148:83): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/b6/tmp_obj_r5CGRl&quot;
inode=3D29892011 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.188550] audit: type=3D1702 audit(1498425306.162:84): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165731.188554] audit: type=3D1302 audit(1498425306.162:85): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/4e/tmp_obj_9zxrAj&quot;
inode=3D29892013 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[165731.269911] audit: type=3D1702 audit(1498425306.244:86): op=3Dlinkat pp=
id=3D13665
pid=3D12613 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[165731.269918] audit: type=3D1302 audit(1498425306.244:87): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/37/tmp_obj_HXKoQr&quot;
inode=3D29892014 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168578.203317] audit: type=3D1702 audit(1498428153.254:88): op=3Dlinkat pp=
id=3D13665
pid=3D29645 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[168578.203323] audit: type=3D1302 audit(1498428153.254:89): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/f3/tmp_obj_airiOs&quot;
inode=3D29891873 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168578.254536] audit: type=3D1702 audit(1498428153.305:90): op=3Dlinkat pp=
id=3D13665
pid=3D29645 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[168578.254541] audit: type=3D1302 audit(1498428153.305:91): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/d8/tmp_obj_M37WHw&quot;
inode=3D29892015 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.032704] audit: type=3D1702 audit(1498428184.084:92): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[168609.032709] audit: type=3D1302 audit(1498428184.084:93): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/75/tmp_obj_MdqOdg&quot;
inode=3D29892018 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.049501] audit: type=3D1702 audit(1498428184.101:94): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[168609.049505] audit: type=3D1302 audit(1498428184.101:95): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/cb/tmp_obj_uMaZ0f&quot;
inode=3D29892020 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[168609.099906] audit: type=3D1702 audit(1498428184.152:96): op=3Dlinkat pp=
id=3D13665
pid=3D29768 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[168609.099910] audit: type=3D1302 audit(1498428184.152:97): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/d9/tmp_obj_O6P9Cl&quot;
inode=3D29892022 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170875.426550] audit: type=3D1702 audit(1498430450.538:98): op=3Dlinkat pp=
id=3D13665
pid=3D8241 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=3D1000 fsuid=
=3D1000 egid=3D1000
sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&quot; exe=3D&q=
uot;/usr/bin/git&quot; subj=3Dkernel
res=3D0
[170875.426555] audit: type=3D1302 audit(1498430450.538:99): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/3d/tmp_obj_Vqrg2M&quot;
inode=3D29892025 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.545473] audit: type=3D1702 audit(1498430451.657:100): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&qu=
ot; exe=3D&quot;/usr/bin/git&quot;
subj=3Dkernel res=3D0
[170876.545478] audit: type=3D1302 audit(1498430451.657:101): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/87/tmp_obj_EUGOPT&quot;
inode=3D29892027 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.566269] audit: type=3D1702 audit(1498430451.678:102): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&qu=
ot; exe=3D&quot;/usr/bin/git&quot;
subj=3Dkernel res=3D0
[170876.566274] audit: type=3D1302 audit(1498430451.678:103): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/d2/tmp_obj_cwT1XW&quot;
inode=3D29892029 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[170876.639348] audit: type=3D1702 audit(1498430451.751:104): op=3Dlinkat
ppid=3D13665 pid=3D8321 auid=3D1000 uid=3D1000 gid=3D1000 euid=3D1000 suid=
=3D1000 fsuid=3D1000
egid=3D1000 sgid=3D1000 fsgid=3D1000 tty=3Dpts3 ses=3D3 comm=3D&quot;git&qu=
ot; exe=3D&quot;/usr/bin/git&quot;
subj=3Dkernel res=3D0
[170876.639353] audit: type=3D1302 audit(1498430451.751:105): item=3D0
name=3D&quot;/mnt/DS/shared/Dropbox/Software/installed/vf_tools/.git/object=
s/f7/tmp_obj_OhsuLZ&quot;
inode=3D29892030 dev=3D00:20 mode=3D0100444 ouid=3D65534 ogid=3D100 rdev=3D=
00:00
obj=3Dunlabeled nametype=3DNORMAL
[174110.131081] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131090] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131095] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131103] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
[174110.131108] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
[174110.131119] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131127] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 678, y =3D 508, format =3D 18, storage type =3D 0
[174110.131134] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 602, y =3D 508, format =3D 18, storage type =3D 0
[174110.131140] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131147] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131152] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131157] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131161] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131165] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131168] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131177] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131185] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 684, y =3D 452, format =3D 18, storage type =3D 0
[174110.131192] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 598, y =3D 688, format =3D 18, storage type =3D 0
[174110.131198] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131204] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131210] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131216] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131221] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131224] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131228] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131231] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131241] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131248] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 680, y =3D 162, format =3D 18, storage type =3D 0
[174110.131255] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 688, y =3D 182, format =3D 18, storage type =3D 0
[174110.131261] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131268] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131274] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131278] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131282] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131286] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131289] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131299] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131306] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 630, format =3D 18, storage type =3D 0
[174110.131312] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131318] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131324] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131330] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131335] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131338] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131342] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131346] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131356] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131364] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 770, y =3D 92, format =3D 18, storage type =3D 0
[174110.131372] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 786, y =3D 92, format =3D 18, storage type =3D 0
[174110.131376] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131380] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131384] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131389] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131399] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131408] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 870, format =3D 18, storage type =3D 0
[174110.131415] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131421] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131426] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131430] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131434] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131438] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131449] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131456] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131462] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131470] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131476] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131481] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131486] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131490] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131494] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131504] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131513] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1164, y =3D 946, format =3D 18, storage type =3D 0
[174110.131521] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1084, y =3D 930, format =3D 18, storage type =3D 0
[174110.131528] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131536] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131542] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131547] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131551] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131556] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131560] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131572] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131579] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1070, y =3D 1072, format =3D 18, storage type =3D=
 0
[174110.131586] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 892, y =3D 24, format =3D 18, storage type =3D 0
[174110.131592] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131598] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131603] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131606] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131610] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131614] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131623] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131630] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1152, y =3D 862, format =3D 18, storage type =3D 0
[174110.131637] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1078, y =3D 1004, format =3D 18, storage type =3D=
 0
[174110.131643] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131649] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131656] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131661] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131666] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131670] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131673] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131677] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131686] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131693] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 866, y =3D 164, format =3D 18, storage type =3D 0
[174110.131700] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 1374, y =3D 1092, format =3D 18, storage type =3D=
 0
[174110.131706] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131713] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131719] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131724] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131727] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131731] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131734] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131744] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131751] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 580, y =3D 838, format =3D 18, storage type =3D 0
[174110.131758] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 890, y =3D 148, format =3D 18, storage type =3D 0
[174110.131764] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.131770] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131777] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131782] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131787] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131790] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131794] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131798] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131807] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131814] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 874, y =3D 572, format =3D 18, storage type =3D 0
[174110.131820] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131826] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 0000000=
0 []
warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131832] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 30009 [ILLEGAL_INSTR_ENCODING]
[174110.131838] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131843] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131846] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131850] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131854] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131863] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131871] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 582, y =3D 814, format =3D 18, storage type =3D 0
[174110.131878] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 404, y =3D 886, format =3D 18, storage type =3D 0
[174110.131884] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131889] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131896] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131901] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131906] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131910] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131913] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131917] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131930] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.131939] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 398, y =3D 148, format =3D 18, storage type =3D 0
[174110.131947] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000020
[RT_HEIGHT_OVERRUN] x =3D 500, y =3D 682, format =3D 18, storage type =3D 0
[174110.131953] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131958] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.131965] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131971] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 20009 [ILLEGAL_INSTR_ENCODING]
[174110.131975] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.131979] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.131983] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.131986] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.131996] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132003] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 582, y =3D 262, format =3D 18, storage type =3D 0
[174110.132010] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 218, y =3D 166, format =3D 18, storage type =3D 0
[174110.132016] nouveau 0000:01:00.0: gr: GPC2/TPC0/MP trap: global 0000000=
0 []
warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132021] nouveau 0000:01:00.0: gr: GPC2/TPC1/MP trap: global 0000000=
0 []
warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.132028] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174110.132033] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132038] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.132042] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.132045] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.132049] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.132058] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132065] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 686, y =3D 294, format =3D 18, storage type =3D 0
[174110.132072] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 700, y =3D 304, format =3D 18, storage type =3D 0
[174110.132076] nouveau 0000:01:00.0: gr: ROP0 80000002 80000000
[174110.132080] nouveau 0000:01:00.0: gr: ROP1 80000002 80000000
[174110.132083] nouveau 0000:01:00.0: gr: ROP2 80000002 80000000
[174110.132087] nouveau 0000:01:00.0: gr: ROP3 80000002 80000000
[174110.132096] nouveau 0000:01:00.0: gr: TRAP ch 7 [007f406000 X[3563]]
[174110.132104] nouveau 0000:01:00.0: gr: GPC1/PROP trap: 00000400
[RT_LINEAR_MISMATCH] x =3D 692, y =3D 250, format =3D 18, storage type =3D 0
[174110.132110] nouveau 0000:01:00.0: gr: GPC3/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 10009 [ILLEGAL_INSTR_ENCODING]
[174110.132115] nouveau 0000:01:00.0: gr: GPC3/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 0009 [ILLEGAL_INSTR_ENCODING]
[174114.447331] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[174114.447335] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2,
recovering...
[174114.447786] nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f406000 X[3563]] subc 0 class a097 mthd 1614 da=
ta
00000000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14984354101.E9bDd8ccf.23217--

--===============0899637525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0899637525==--
