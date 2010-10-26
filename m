From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] New: Cannot control backlight intensity on
	Powerbook
Date: Mon, 25 Oct 2010 20:07:38 -0700 (PDT)
Message-ID: <bug-31122-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31122

           Summary: Cannot control backlight intensity on Powerbook
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: enhancement
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: jk-KVH6KZ/iFWQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


The backlight intensity cannot be controlled using the special Powerbook
function keys and neither through Gnome's brightness applet.

I don't know how, but the function keys work fine when running the nv driver
with Debian stock Linux kernel 2.6.32-5-powerpc (which uses nvidiafb, in case
that is important).  The Gnome applet, though, doesn't work either; Gnome,
however, shows a nice overlay indicating that the brightness changed when the
fn-keys are pressed.

I ran radeontool as described in bug #29685 and took dumps of the registers
while regulating the brightness under nv, in case thats helpful:

  fn-key brightness level 0 (no backlight):
  0x0060081c: 0x86066050
  0x000010f0: 0x00000535

  fn-key brightness levels 1-8:
  0x0060081c: 0x86066051 or 0x86066055 (bit 0x4 flips randomly)
  0x000010f0: 0x82450535, 0x82900535, 0x82db0535, 0x83290535,
              0x83740535, 0x83bf0535, 0x840d0535, 0x84550535
              for levels 1-8, respectively

  dpms standby at max. brightness (xset dpms force standby):
  0x0060081c: 0x86066050
  0x000010f0: 0x04550535

I played a bit with radeontool, and bits 0x0fff0000 of 0x10f0 seem continous. 
The values can actually be set a bit higher (and lower) than level 8 (or level
1). The maximum brightness here is reached at ca. 0x84c00535.

The display will also be in maximum brightness when bit 31 of 0x10f0 is not set
(as long as bit 1 of 0x60081c is set, otherwise the backlight turns off).

The machine is a PowerBook6,2 12", with an

  nVidia Corporation NV34M [GeForce FX Go5200] [10de:0329] (rev a1).

It is running Debian xserver-xorg-video-nouveau 1:0.0.16+git20100825+390f1c8-1
and vanilla Linux 2.6.36.

I also filed the related bug #31120 about the backlight not working after
hibernation.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
