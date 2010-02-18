From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau: [drm] failed to open device
Date: Thu, 18 Feb 2010 13:01:25 +0100
Message-ID: <b67489df1002180401o4629435bj71c764a85e06a54@mail.gmail.com>
References: <20100218093834.GE29559@buzzloop.caiaq.de>
	<b67489df1002180337m274aa72dueb33b7038d541c31@mail.gmail.com>
	<20100218115524.GO9007@buzzloop.caiaq.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100218115524.GO9007-ahpEBR4enfnCULTFXS99ULNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Mack <daniel-rDUAYElUppE@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Feb 18, 2010 at 12:55 PM, Daniel Mack <daniel-rDUAYElUppE@public.gmane.org> wrote:
> On Thu, Feb 18, 2010 at 12:37:19PM +0100, Xavier Chantry wrote:
>> On Thu, Feb 18, 2010 at 10:38 AM, Daniel Mack <daniel-rDUAYElUppE@public.gmane.org> wrote:
>> > Hi,
>> >
>> > I'm trying to get the new nouveau kernel driver (2.6.33-rc8) to work
>> > with X.Org 1.7.4 (Debian/unstable, all relevant packages updated). The
>> > modules load just fine, and the kernel spits out the following upon
>> > probe:
>> >
>> > [ =A0 =A08.304602] nouveau 0000:06:00.0: PCI INT A -> Link[LNEB] -> GS=
I 18 (level, low) -> IRQ 18
>> > [ =A0 =A08.304779] nouveau 0000:06:00.0: setting latency timer to 64
>> > [ =A0 =A08.313364] [drm] nouveau 0000:06:00.0: Detected an NV40 genera=
tion card (0x044300a2)
>> > [ =A0 =A08.313812] [drm] nouveau 0000:06:00.0: Attempting to load BIOS=
 image from PROM
>> > [ =A0 =A08.521142] [drm] nouveau 0000:06:00.0: ... appears to be valid
>> > [ =A0 =A08.521148] [drm] nouveau 0000:06:00.0: BIT BIOS found
>> > [ =A0 =A08.521151] [drm] nouveau 0000:06:00.0: Bios version 05.44.02.62
>> > [ =A0 =A08.521156] [drm] nouveau 0000:06:00.0: BIT table 'd' not found
>> > [ =A0 =A08.521159] [drm] nouveau 0000:06:00.0: Found Display Configura=
tion Block version 3.0
>> > ...
>> >
>> >
>> > However, when starting X.Org (installed from the Debian package), I get
>> > this:
>> >
>> >
>> > X.Org X Server 1.7.4
>> > Release Date: 2010-01-08
>> > X Protocol Version 11, Revision 0
>> > Build Operating System: Linux 2.6.32-trunk-686 i686 Debian
>> > Current Operating System: Linux jup 2.6.33-rc8 #20 SMP PREEMPT Wed Feb=
 17 11:26:28 CET 2010 i686
>> > Kernel command line: BOOT_IMAGE=3D/vmlinuz-2.6.git root=3D/dev/sda3 ro=
 quiet
>> > Build Date: 20 January 2010 =A010:52:55PM
>> > xorg-server 2:1.7.4-2 (bgoglin-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org)
>> > Current version of pixman: 0.16.4
>> > =A0 =A0 =A0 =A0Before reporting problems, check http://wiki.x.org
>> > =A0 =A0 =A0 =A0to make sure that you have the latest version.
>> > Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
>> > =A0 =A0 =A0 =A0(++) from command line, (!!) notice, (II) informational,
>> > =A0 =A0 =A0 =A0(WW) warning, (EE) error, (NI) not implemented, (??) un=
known.
>> > (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Wed Feb 17 17:00:25 20=
10
>> > (=3D=3D) Using config file: "/etc/X11/xorg.conf"
>> > (EE) [drm] failed to open device
>> > (EE) No devices detected.
>> >
>> >
>> > From the strace output (http://pastebin.com/m12d5b19a) I cannot see wh=
at
>> > the problem could possibly be, and searching the FAQs and archives
>> > didn't help me either. I can't see any errors or warning anywhere
>> > except for the one above.
>> >
>> > The full X log is here: http://pastebin.com/m731c3561
>> > And my xorg.conf is here: http://pastebin.com/m5f143408
>> >
>> > Any pointers appreciated - I got the evil feeling to overlook the
>> > obvious ;)
>> >
>>
>> Did you have a look at the wiki ?
>> Latest news on http://nouveau.freedesktop.org/wiki/
>
> I in fact did, yes. But I couldn't find any explanation to what I'm
> seeing. Sorry if this is covered by the FAQ - just point me there then.
>

Which libdrm version are you using ?
