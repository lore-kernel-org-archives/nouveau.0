From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] System freeze on wayland with nouveau on
 NV137 (GP107) and NVE4 (GK104)
Date: Thu, 01 Feb 2018 06:30:55 +0000
Message-ID: <bug-104421-8800-2rmkBENniW@http.bugs.freedesktop.org/>
References: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1912789511=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104421-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1912789511==
Content-Type: multipart/alternative; boundary="15174666583.41a24BBCD.1612"
Content-Transfer-Encoding: 7bit


--15174666583.41a24BBCD.1612
Date: Thu, 1 Feb 2018 06:30:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

Edwin Foss <mathg9-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|System freeze on wayland    |System freeze on wayland
                   |with nouveau on NV137       |with nouveau on NV137
                   |(GP107)                     |(GP107) and NVE4 (GK104)
                 CC|                            |mathg9-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org

--- Comment #11 from Edwin Foss <mathg9-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> ---
Another crash

kernel: nouveau 0000:01:00.0: fifo: read fault at 0002c22000 engine 00 [GR]
client 01 [GPC2/T1_0] reason 02 [PTE] on channel 3 [007f82e000 Xwayland[964=
]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 3 [007f82e000 Xwayland[964]]
kernel: nouveau 0000:01:00.0: Xwayland[964]: channel 13 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 13: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 0007280000 engine 00 [GR]
client 01 [GPC0/T1_0] reason 02 [PTE] on channel 13 [007ed4e000 Xwayland[96=
4]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 13 [007ed4e000 Xwayland[964]]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15174666583.41a24BBCD.1612
Date: Thu, 1 Feb 2018 06:30:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mathg9&#6=
4;outlook.com" title=3D"Edwin Foss &lt;mathg9&#64;outlook.com&gt;"> <span c=
lass=3D"fn">Edwin Foss</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107) an=
d NVE4 (GK104)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>System freeze on wayland with nouveau on NV137 (GP107)
           </td>
           <td>System freeze on wayland with nouveau on NV137 (GP107) and N=
VE4 (GK104)
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>mathg9&#64;outlook.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107) an=
d NVE4 (GK104)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107) an=
d NVE4 (GK104)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">bug 10442=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mathg9&#64;outlook.com" title=3D"Edwin Foss &lt;mathg9&#64;outlook.com&gt;"=
> <span class=3D"fn">Edwin Foss</span></a>
</span></b>
        <pre>Another crash

kernel: nouveau 0000:01:00.0: fifo: read fault at 0002c22000 engine 00 [GR]
client 01 [GPC2/T1_0] reason 02 [PTE] on channel 3 [007f82e000 Xwayland[964=
]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 3 [007f82e000 Xwayland[964]]
kernel: nouveau 0000:01:00.0: Xwayland[964]: channel 13 killed!
kernel: nouveau 0000:01:00.0: fifo: engine 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: runlist 0: scheduled for recovery
kernel: nouveau 0000:01:00.0: fifo: channel 13: killed
kernel: nouveau 0000:01:00.0: fifo: read fault at 0007280000 engine 00 [GR]
client 01 [GPC0/T1_0] reason 02 [PTE] on channel 13 [007ed4e000 Xwayland[96=
4]]
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC2/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC1/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC1/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: GPC0/TPC0/TEX: 80000049
kernel: nouveau 0000:01:00.0: gr: TRAP ch 13 [007ed4e000 Xwayland[964]]</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15174666583.41a24BBCD.1612--

--===============1912789511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1912789511==--
