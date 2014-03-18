From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Tue, 18 Mar 2014 13:43:52 +0000
Message-ID: <bug-70354-8800-IDX9OUcWNd@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0235455807=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0235455807==
Content-Type: multipart/alternative; boundary="1395150232.a6fdAa1a3.6573"; charset="us-ascii"


--1395150232.a6fdAa1a3.6573
Date: Tue, 18 Mar 2014 13:43:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |d-bugzilla-vUpi/VKO0VA@public.gmane.org

--- Comment #25 from D. Moens <d-bugzilla-vUpi/VKO0VA@public.gmane.org> ---
Experiencing the same issue on a Dell M4800 QHD+ (NVE6).

- Fedora rawhide :
kernel-3.14.0-0.rc7.git0.1.fc21.x86_64
xorg-x11-server-Xorg-1.15.0-5.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-1.fc21.x86_64

- lscpi :
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)

- Kernel command line:
BOOT_IMAGE=/vmlinuz-rawhide-nouveau root=/dev/mapper/vg01-rootfs4 ro
rd.lvm.lv=vg01/rootfs4 vconsole.font=latarcyrheb-sun16 LANG=en_US.UTF-8
nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe


- Recompiled latest http://cgit.freedesktop.org/~darktama/nouveau/ as of
2014-03-18 :

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395150232.a6fdAa1a3.6573
Date: Tue, 18 Mar 2014 13:43:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:d-bugzilla&#64;moens.cc" title="D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"> <span class="fn">D. Moens</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>d-bugzilla&#64;moens.cc
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:d-bugzilla&#64;moens.cc" title="D. Moens &lt;d-bugzilla&#64;moens.cc&gt;"> <span class="fn">D. Moens</span></a>
</span></b>
        <pre>Experiencing the same issue on a Dell M4800 QHD+ (NVE6).

- Fedora rawhide :
kernel-3.14.0-0.rc7.git0.1.fc21.x86_64
xorg-x11-server-Xorg-1.15.0-5.fc21.x86_64
xorg-x11-drv-nouveau-1.0.10-1.fc21.x86_64

- lscpi :
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)

- Kernel command line:
BOOT_IMAGE=/vmlinuz-rawhide-nouveau root=/dev/mapper/vg01-rootfs4 ro
rd.lvm.lv=vg01/rootfs4 vconsole.font=latarcyrheb-sun16 LANG=en_US.UTF-8
nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe


- Recompiled latest <a href="http://cgit.freedesktop.org/~darktama/nouveau/">http://cgit.freedesktop.org/~darktama/nouveau/</a> as of
2014-03-18 :</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395150232.a6fdAa1a3.6573--

--===============0235455807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0235455807==--
