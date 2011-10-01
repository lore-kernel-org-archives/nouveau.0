From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32406] nouveau fails to send hotplug event to ALSA
 hda hdmi audio
Date: Sat,  1 Oct 2011 04:53:57 -0700 (PDT)
Message-ID: <20111001115357.D4B0613016F@annarchy.freedesktop.org>
References: <bug-32406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32406

--- Comment #7 from torquil-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-10-01 04:53:57 PDT ---
(In reply to comment #6)
> I have found the problem.
> nouveau tries to send the eld info in
> nv50_audio_mode_set()
> 
> Unfortunately, this is sent before the audio driver is loaded.
> It is then resent later.
> If the ALSA audio driver is forced to try and read the eld data 3 times instead
> of just once, the eld data finally reaches the ALSA audio driver, and sound
> then works.
> So, I now have a valid work around.
> Some further investigation is needed to discover why the sending of eld data is
> so unreliable, requiring it to be sent multiple times.
> Maybe some co-ordination between the nouveau driver and ALSA is required to
> ensure good delivery of the eld data, so that it is valid before setting the
> eld_valid GPIO.

I've just been trying to get HDMI audio to work, using the Nouveau driver, and
I'm running into this ELD issue. Is there any progress on this issue so as to
make it work "out of the box"?

Btw, I'm using Debian Sid with:

Linux 3.0.4
Nouveau x-driver: 1:0.0.16+git20110411+8378443-1+b2
libasound 1.0.24.1-4

on an Asis X5DID computer with:

lspci -vs 02:00.0
02:00.0 VGA compatible controller: nVidia Corporation GT216 [GeForce GT 320M]
(rev a2) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 1312
    Flags: bus master, fast devsel, latency 0, IRQ 17
    Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
    Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Memory at f6000000 (64-bit, prefetchable) [size=32M]
    I/O ports at dc00 [size=128]
    Expansion ROM at faf80000 [disabled] [size=512K]
    Capabilities: <access denied>
    Kernel driver in use: nouveau

and

lspci -vs 02:00.1
02:00.1 Audio device: nVidia Corporation High Definition Audio Controller (rev
a1)
    Subsystem: ASUSTeK Computer Inc. Device 1312
    Flags: bus master, fast devsel, latency 0, IRQ 17
    Memory at faf7c000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: <access denied>
    Kernel driver in use: HDA Intel

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
