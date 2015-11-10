From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] Complete freeze even with NvGrUseFW=1
Date: Tue, 10 Nov 2015 17:10:55 +0000
Message-ID: <bug-92863-8800-IxvjP5VIpa@http.bugs.freedesktop.org/>
References: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160537322=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1160537322==
Content-Type: multipart/alternative; boundary="1447175455.654C61.26062"; charset="UTF-8"


--1447175455.654C61.26062
Date: Tue, 10 Nov 2015 17:10:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

--- Comment #9 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
[61117.028780] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002456000
[PTE] from GR/GPC2/T1_0 on channel 0x023f650000 [plasmashell[15103]]
[61117.028784] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
8, recovering...
[61117.028793] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x023f650000
plasmashell[15103]]
[61117.028799] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[61117.028804] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[61117.028808] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[61117.028814] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000049
[61117.028818] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000049
[61196.361410] nouveau E[Xorg[14738]] failed to idle channel 0xcccc0000
[Xorg[14738]]
[61211.347041] nouveau E[Xorg[14738]] failed to idle channel 0xcccc0000
[Xorg[14738]]
[61211.348250] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000023000
[PTE] from PBDMA0/HOST_CPU on channel 0x023fc20000 [unknown]
[61226.391616] nouveau E[kwin_x11[15043]] failed to idle channel 0xcccc0000
[kwin_x11[15043]]
[61241.377248] nouveau E[kwin_x11[15043]] failed to idle channel 0xcccc0000
[kwin_x11[15043]]
[61256.373870] nouveau E[abrt-applet[15208]] failed to idle channel 0xcccc0000
[abrt-applet[15208]]
[61271.359500] nouveau E[abrt-applet[15208]] failed to idle channel 0xcccc0000
[abrt-applet[15208]]
[61272.787225] nouveau E[     DRM] GPU lockup - switching to software fbcon
[61286.430049] nouveau E[krunner[15049]] failed to idle channel 0xcccc0000
[krunner[15049]]
[61301.415681] nouveau E[krunner[15049]] failed to idle channel 0xcccc0000
[krunner[15049]]
[61316.413300] nouveau E[owncloud[15369]] failed to idle channel 0xcccc0000
[owncloud[15369]]
[61331.398930] nouveau E[owncloud[15369]] failed to idle channel 0xcccc0000
[owncloud[15369]]
[61346.394552] nouveau E[konversation[15193]] failed to idle channel 0xcccc0000
[konversation[15193]]
[61361.380183] nouveau E[konversation[15193]] failed to idle channel 0xcccc0000
[konversation[15193]]
[61376.372810] nouveau E[Compositor[8716]] failed to idle channel 0xcccc0000
[Compositor[8716]]
[61391.358520] nouveau E[Compositor[8716]] failed to idle channel 0xcccc0000
[Compositor[8716]]
[61406.348148] nouveau E[plasmashell[15103]] failed to idle channel 0xcccc0000
[plasmashell[15103]]
[61421.333780] nouveau E[plasmashell[15103]] failed to idle channel 0xcccc0000
[plasmashell[15103]]
[61436.335397] nouveau E[Compositor[9501]] failed to idle channel 0xcccc0000
[Compositor[9501]]
[61451.321028] nouveau E[Compositor[9501]] failed to idle channel 0xcccc0000
[Compositor[9501]]
[61466.314650] nouveau E[Compositor[10121]] failed to idle channel 0xcccc0000
[Compositor[10121]]
[61481.300274] nouveau E[Compositor[10121]] failed to idle channel 0xcccc0000
[Compositor[10121]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447175455.654C61.26062
Date: Tue, 10 Nov 2015 17:10:55 +0000
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
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">bug 92863</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>[61117.028780] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002456000
[PTE] from GR/GPC2/T1_0 on channel 0x023f650000 [plasmashell[15103]]
[61117.028784] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
8, recovering...
[61117.028793] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x023f650000
plasmashell[15103]]
[61117.028799] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[61117.028804] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[61117.028808] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[61117.028814] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000049
[61117.028818] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000049
[61196.361410] nouveau E[Xorg[14738]] failed to idle channel 0xcccc0000
[Xorg[14738]]
[61211.347041] nouveau E[Xorg[14738]] failed to idle channel 0xcccc0000
[Xorg[14738]]
[61211.348250] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000023000
[PTE] from PBDMA0/HOST_CPU on channel 0x023fc20000 [unknown]
[61226.391616] nouveau E[kwin_x11[15043]] failed to idle channel 0xcccc0000
[kwin_x11[15043]]
[61241.377248] nouveau E[kwin_x11[15043]] failed to idle channel 0xcccc0000
[kwin_x11[15043]]
[61256.373870] nouveau E[abrt-applet[15208]] failed to idle channel 0xcccc0000
[abrt-applet[15208]]
[61271.359500] nouveau E[abrt-applet[15208]] failed to idle channel 0xcccc0000
[abrt-applet[15208]]
[61272.787225] nouveau E[     DRM] GPU lockup - switching to software fbcon
[61286.430049] nouveau E[krunner[15049]] failed to idle channel 0xcccc0000
[krunner[15049]]
[61301.415681] nouveau E[krunner[15049]] failed to idle channel 0xcccc0000
[krunner[15049]]
[61316.413300] nouveau E[owncloud[15369]] failed to idle channel 0xcccc0000
[owncloud[15369]]
[61331.398930] nouveau E[owncloud[15369]] failed to idle channel 0xcccc0000
[owncloud[15369]]
[61346.394552] nouveau E[konversation[15193]] failed to idle channel 0xcccc0000
[konversation[15193]]
[61361.380183] nouveau E[konversation[15193]] failed to idle channel 0xcccc0000
[konversation[15193]]
[61376.372810] nouveau E[Compositor[8716]] failed to idle channel 0xcccc0000
[Compositor[8716]]
[61391.358520] nouveau E[Compositor[8716]] failed to idle channel 0xcccc0000
[Compositor[8716]]
[61406.348148] nouveau E[plasmashell[15103]] failed to idle channel 0xcccc0000
[plasmashell[15103]]
[61421.333780] nouveau E[plasmashell[15103]] failed to idle channel 0xcccc0000
[plasmashell[15103]]
[61436.335397] nouveau E[Compositor[9501]] failed to idle channel 0xcccc0000
[Compositor[9501]]
[61451.321028] nouveau E[Compositor[9501]] failed to idle channel 0xcccc0000
[Compositor[9501]]
[61466.314650] nouveau E[Compositor[10121]] failed to idle channel 0xcccc0000
[Compositor[10121]]
[61481.300274] nouveau E[Compositor[10121]] failed to idle channel 0xcccc0000
[Compositor[10121]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447175455.654C61.26062--

--===============1160537322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1160537322==--
