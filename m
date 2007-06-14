From: Jan Buecken <jb.faq-Mmb7MZpHnFY@public.gmane.org>
Subject: Two problems
Date: Thu, 14 Jun 2007 16:52:58 +0200
Message-ID: <4671564A.8010702@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello, I have two problems:

1) Identify my card
2) Error message at dumping

1) It seems to me that I have a special version of the GeForce4 420 Go
32M because my card is a GeForce4 440 Go 64M but both have the same PCI
device id. Is this important for the development of the renouveau driver
or is this already noted?

Outputs:

lspci
[...]
01:00.0 VGA compatible controller: nVidia Corporation NV17 [GeForce4 440
Go 64M] (rev a3)

lspci -n
[...]
01:00.0 0300: 10de:0179 (rev a3)


System:

Operating System: Gentoo

uname -a
Linux workstation 2.6.20-gentoo-r8 #1 PREEMPT Fri May 11 19:52:29 CEST
2007 i686 Intel(R) Pentium(R) 4 CPU 2.53GHz GenuineIntel GNU/Linux

Nvidia Driver: 1.0.8776-r1

2) I want to report following error message. I want to dump my card with
KoalaBR's script. The complete output (after answering yes):






         ????????????????????????????????????????????????????????????
         ? Compilation successful. Now starting renouveau. Please   ?
         ? make sure that                                           ?
         ?    - You have compiz or beryl disabled                   ?
         ?    - That you don't move the renouveau window            ?
         ?    - That you don't hide the renouveau window behind     ?
         ? other windows or menus                                   ?
         ?  In case of questions look here:                         ?
         ? http://nouveau.freedesktop.org/wiki/FAQ.                 ?
         ?  Choosing 'NO' will abort this script in case you need   ?
         ? to deactivate beryl / compiz                             ?
         ????????????????????????????????????????????????????????????
         ?                 < Yes >         < No  >                  ?
         ????????????????????????????????????????????????????????????





mkdir: kann Verzeichnis "cards" nicht anlegen: Die Datei existiert bereits
detect_devices: Creating probe window failed.
Device detection failed.
Please report the above error. Press return to continue

Is there already a solution?

regards
Jan B=FCcken
