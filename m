From: "Gerd v. Egidy" <lists-6VzpN07DMvo@public.gmane.org>
Subject: Triplehead with TripleHead2Go: counterpart to
	TwinViewXineramaInfoOverride?
Date: Mon, 4 Oct 2010 14:15:58 +0200
Message-ID: <201010041415.58285.lists@egidy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

I have 3 monitors with 1600x1200 connected to a 8400 (NV50) card like this:


           HDMI ----------------------- Monitor1
           |
8400 card -|
           |                      DVI-- Monitor2
           DVI ---- TripleHead2Go-|
                                  DVI-- Monitor3

The Matrox TripleHead2Go splits one DVI signal for two (or three) monitors. So 
the output of the card is a 3200x1200 resolution which is then split into 
1600x1200 for each monitor.

I use the TripleHead2Go to connect all monitors to one card, allowing the use 
of TwinView and not needing to rely on Xinerama. I used two cards and Xinerama 
some years ago but it became too slow so I switched to the solution with the 
TripleHead2Go.

Currently I'm using the closed-source nvidia driver but it is lacking KMS, 
suspend often crashes and I would prefer not to use closed-source drivers. 

I just tried Nouveau on the Fedora 14 beta and it worked out of the box. 
Congratulations to all you developers achieving something like that via 
reverse engineering!

There is one minor thing though: with the closed nvidia driver I can use the 
TwinViewXineramaInfoOverride option to fake the xinerama data for three 
screens. KDE reads out this data to pop up windows in the right position, 
maximize window is separated for the 3 screens etc.

Is there something similar available for nouveau?

FYI, my current xorg.conf for the closed source driver looks like this:

ection "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "TwinView" "1"
    Option         "metamodes" "DFP-0: 3200x1200 +0+0, DFP-1: 1600x1200 
+3200+0"
    Option         "TwinViewXineramaInfoOverride" "1600x1200 +0+0, 1600x1200 
+1600+0, 1600x1200 +3200+0"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection

Kind regards,

Gerd

-- 
Address (better: trap) for people I really don't want to get mail from:
jonas-K4Lox0BdAqn6SQ/niu2adgC/G2K4zDHf@public.gmane.org
