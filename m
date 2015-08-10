From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91598] New: Broken Rendering of Plasma 5 Desktop
Date: Mon, 10 Aug 2015 14:11:05 +0000
Message-ID: <bug-91598-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1185029874=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1185029874==
Content-Type: multipart/alternative; boundary="1439215865.B4FEff1.905"; charset="UTF-8"


--1439215865.B4FEff1.905
Date: Mon, 10 Aug 2015 14:11:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91598

            Bug ID: 91598
           Summary: Broken Rendering of Plasma 5 Desktop
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: cordlandwehr-RoXCvvDuEio@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

After starting my KDE Plasma 5 session everything is rendered find. Yet
(always) after some minutes the rendering of window decorations, task bar, and
popup menus starts to break, resulting after more and more increasing rendering
problems in an unusable desktop. When this happens, I get the following output
from dmesg:

[174123.172309] nouveau E[plasmashell[14050]] fail set_domain
[174123.172314] nouveau E[plasmashell[14050]] validating bo list
[174123.172323] nouveau E[plasmashell[14050]] validate: -22
[174123.223066] nouveau E[plasmashell[14050]] fail set_domain
[174123.223070] nouveau E[plasmashell[14050]] validating bo list
[174123.223073] nouveau E[plasmashell[14050]] validate: -22
[174123.470096] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174123.494669] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174123.533285] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174698.707920] nouveau E[plasmashell[14050]] fail set_domain
[174698.707925] nouveau E[plasmashell[14050]] validating bo list
[174698.707930] nouveau E[plasmashell[14050]] validate: -22
[174698.741993] nouveau E[plasmashell[14050]] fail set_domain
[174698.741997] nouveau E[plasmashell[14050]] validating bo list
[174698.742000] nouveau E[plasmashell[14050]] validate: -22
[174886.478007] nouveau E[plasmashell[14050]] fail set_domain
[174886.478013] nouveau E[plasmashell[14050]] validating bo list
[174886.478017] nouveau E[plasmashell[14050]] validate: -22
[174886.539196] nouveau E[plasmashell[14050]] fail set_domain
[174886.539201] nouveau E[plasmashell[14050]] validating bo list
[174886.539204] nouveau E[plasmashell[14050]] validate: -22
[175871.854466] nouveau E[plasmashell[14050]] fail set_domain
[175871.854471] nouveau E[plasmashell[14050]] validating bo list
[175871.854474] nouveau E[plasmashell[14050]] validate: -22
[175871.861983] nouveau E[plasmashell[14050]] fail set_domain
[175871.861986] nouveau E[plasmashell[14050]] validating bo list
[175871.861989] nouveau E[plasmashell[14050]] validate: -22
[176051.392480] nouveau E[plasmashell[14050]] fail set_domain
[176051.392485] nouveau E[plasmashell[14050]] validating bo list
[176051.392489] nouveau E[plasmashell[14050]] validate: -22
[176051.401093] nouveau E[plasmashell[14050]] fail set_domain
[176051.401097] nouveau E[plasmashell[14050]] validating bo list
[176051.401101] nouveau E[plasmashell[14050]] validate: -22
[176501.393171] Bluetooth: hci0 SCO packet for unknown connection handle 65
[178171.569952] nouveau E[plasmashell[14050]] fail set_domain
[178171.569957] nouveau E[plasmashell[14050]] validating bo list
[178171.569966] nouveau E[plasmashell[14050]] validate: -22
[178171.609919] nouveau E[plasmashell[14050]] fail set_domain
[178171.609923] nouveau E[plasmashell[14050]] validating bo list
[178171.609927] nouveau E[plasmashell[14050]] validate: -22
[178175.258415] nouveau E[plasmashell[14050]] fail set_domain
[178175.258420] nouveau E[plasmashell[14050]] validating bo list
[178175.258426] nouveau E[plasmashell[14050]] validate: -22
[178175.291774] nouveau E[plasmashell[14050]] fail set_domain
[178175.291779] nouveau E[plasmashell[14050]] validating bo list
[178175.291783] nouveau E[plasmashell[14050]] validate: -22
[178175.334549] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.364627] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.381225] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.398852] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.417469] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.435567] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.446271] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.464304] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.479161] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.497165] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.510454] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.525236] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.542153] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.560279] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.578040] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.595687] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.614809] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.623654] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.649339] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.667052] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.684679] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.702680] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.721299] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.727035] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.757182] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.773778] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.791302] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.808715] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.826256] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.843415] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.861655] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.879201] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.890960] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.915536] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.933341] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.950958] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.968921] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.986589] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.004259] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.021866] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.039519] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.057690] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.074873] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.091910] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.109110] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.126573] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.144338] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.162028] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.179986] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.198234] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.215892] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.234212] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.251848] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.269469] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.287200] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.305140] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.322810] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.340830] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.342202] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.358525] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.376099] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.393390] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.411557] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.429376] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.510516] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.552477] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.570241] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.587937] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.605304] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.623239] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.640743] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.659310] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.676174] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.694362] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.711778] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.729810] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.748654] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.766682] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b200
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.776887] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.802184] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.115408] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.129659] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.145847] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.163532] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.182036] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.200775] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.220932] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.232131] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.345929] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.348630] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.948501] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178178.951166] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT

I am using an up-to-date Debian Testing system with:
libdrm-nouveau2: version 2.4.62-1
xserver-xorg-video-nouveau: version 1:1.0.11-1+b1

Please tell me which further information are required.

Cheers,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1439215865.B4FEff1.905
Date: Mon, 10 Aug 2015 14:11:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Broken Rendering of Plasma 5 Desktop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91598">91598</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Broken Rendering of Plasma 5 Desktop
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>cordlandwehr&#64;kde.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After starting my KDE Plasma 5 session everything is rendered find. Yet
(always) after some minutes the rendering of window decorations, task bar, and
popup menus starts to break, resulting after more and more increasing rendering
problems in an unusable desktop. When this happens, I get the following output
from dmesg:

[174123.172309] nouveau E[plasmashell[14050]] fail set_domain
[174123.172314] nouveau E[plasmashell[14050]] validating bo list
[174123.172323] nouveau E[plasmashell[14050]] validate: -22
[174123.223066] nouveau E[plasmashell[14050]] fail set_domain
[174123.223070] nouveau E[plasmashell[14050]] validating bo list
[174123.223073] nouveau E[plasmashell[14050]] validate: -22
[174123.470096] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174123.494669] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174123.533285] nouveau E[     PFB][0000:02:00.0] trapped read at 0x3d00718400
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PT_NOT_PRESENT
[174698.707920] nouveau E[plasmashell[14050]] fail set_domain
[174698.707925] nouveau E[plasmashell[14050]] validating bo list
[174698.707930] nouveau E[plasmashell[14050]] validate: -22
[174698.741993] nouveau E[plasmashell[14050]] fail set_domain
[174698.741997] nouveau E[plasmashell[14050]] validating bo list
[174698.742000] nouveau E[plasmashell[14050]] validate: -22
[174886.478007] nouveau E[plasmashell[14050]] fail set_domain
[174886.478013] nouveau E[plasmashell[14050]] validating bo list
[174886.478017] nouveau E[plasmashell[14050]] validate: -22
[174886.539196] nouveau E[plasmashell[14050]] fail set_domain
[174886.539201] nouveau E[plasmashell[14050]] validating bo list
[174886.539204] nouveau E[plasmashell[14050]] validate: -22
[175871.854466] nouveau E[plasmashell[14050]] fail set_domain
[175871.854471] nouveau E[plasmashell[14050]] validating bo list
[175871.854474] nouveau E[plasmashell[14050]] validate: -22
[175871.861983] nouveau E[plasmashell[14050]] fail set_domain
[175871.861986] nouveau E[plasmashell[14050]] validating bo list
[175871.861989] nouveau E[plasmashell[14050]] validate: -22
[176051.392480] nouveau E[plasmashell[14050]] fail set_domain
[176051.392485] nouveau E[plasmashell[14050]] validating bo list
[176051.392489] nouveau E[plasmashell[14050]] validate: -22
[176051.401093] nouveau E[plasmashell[14050]] fail set_domain
[176051.401097] nouveau E[plasmashell[14050]] validating bo list
[176051.401101] nouveau E[plasmashell[14050]] validate: -22
[176501.393171] Bluetooth: hci0 SCO packet for unknown connection handle 65
[178171.569952] nouveau E[plasmashell[14050]] fail set_domain
[178171.569957] nouveau E[plasmashell[14050]] validating bo list
[178171.569966] nouveau E[plasmashell[14050]] validate: -22
[178171.609919] nouveau E[plasmashell[14050]] fail set_domain
[178171.609923] nouveau E[plasmashell[14050]] validating bo list
[178171.609927] nouveau E[plasmashell[14050]] validate: -22
[178175.258415] nouveau E[plasmashell[14050]] fail set_domain
[178175.258420] nouveau E[plasmashell[14050]] validating bo list
[178175.258426] nouveau E[plasmashell[14050]] validate: -22
[178175.291774] nouveau E[plasmashell[14050]] fail set_domain
[178175.291779] nouveau E[plasmashell[14050]] validating bo list
[178175.291783] nouveau E[plasmashell[14050]] validate: -22
[178175.334549] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.364627] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.381225] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.398852] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.417469] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.435567] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.446271] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.464304] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.479161] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.497165] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.510454] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.525236] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.542153] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.560279] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.578040] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.595687] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.614809] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000f64f [kwin_x11[14044]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.623654] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.649339] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.667052] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.684679] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.702680] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.721299] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.727035] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.757182] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.773778] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.791302] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.808715] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.826256] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.843415] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.861655] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.879201] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.890960] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178175.915536] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.933341] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.950958] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.968921] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178175.986589] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.004259] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.021866] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.039519] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.057690] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.074873] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.091910] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.109110] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.126573] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.144338] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.162028] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.179986] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.198234] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.215892] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.234212] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.251848] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.269469] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.287200] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.305140] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.322810] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.340830] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.342202] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.358525] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.376099] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.393390] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.411557] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.429376] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.510516] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.552477] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.570241] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.587937] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.605304] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.623239] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.640743] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.659310] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b100
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.676174] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.694362] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.711778] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.729810] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178176.748654] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.766682] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b200
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.776887] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178176.802184] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.115408] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.129659] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.145847] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.163532] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.182036] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178177.200775] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.220932] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.232131] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.345929] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.348630] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000f4d2 [plasmashell[14050]] PGRAPH/TEXTURE/00 reason:
PAGE_NOT_PRESENT
[178177.948501] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT
[178178.951166] nouveau E[     PFB][0000:02:00.0] trapped read at 0x002037b000
on channel 0x0000fb33 [Xorg[13899]] PGRAPH/TEXTURE/00 reason: PAGE_NOT_PRESENT

I am using an up-to-date Debian Testing system with:
libdrm-nouveau2: version 2.4.62-1
xserver-xorg-video-nouveau: version 1:1.0.11-1+b1

Please tell me which further information are required.

Cheers,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439215865.B4FEff1.905--

--===============1185029874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1185029874==--
