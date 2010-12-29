From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: CRTC video scanout position for high precision vblank
	timestamping?
Date: Wed, 29 Dec 2010 10:01:40 +0100
Message-ID: <4D1AF8F4.6020707@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

Hello all,

i have recently implemented some patches to the drm core and to the 
intel and radeon kms drivers to provide high precision timestamping of 
vblank intervals and for timestamping of pageflip bufferswap completion. 
This is needed to properly implement the DRI2 sync & swap bits and their 
support for the oml_sync_control extension.

The patches are in drm-next and will hopefully land in the 2.6.38 merge 
window. Now i'd like to add support for the nouveau kms driver as well.

I had a look at the current nouveau code in drm-next. Implementing the 
patches shouldn't be a problem, it is mostly copy & paste from 
radeon/intel kms + a little bit of adjustments and then testing.

Problem: The code needs to query the current video scanout position of a 
given crtc. My missing bit of information is the location and format of 
the MMIO registers which presumably exist on nvidia gpu's to provide 
this information. I know the gpu's support this, because the NVidia 
proprietary drivers on both MS-Windows and MacOS/X provide a function to 
query this info from userspace (Windows DirectDraw-7 GetScanline() 
function, OS/X CGDisplayBeamposition() function). Unfortunately the 
nvidia blob on Linux (and Linux/X11 itself) to my knowledge doesn't 
support such an api, so i can't simply mmio-trace the blob to find the 
relevant register. Also afaik the rules-ng database and the current 
driver source code don't document the location of such a register.

I've already made friendship with renouveau and hacked it a bit for my 
purpose, but playing with it for an hour on a Geforce 8800 and staring 
at dumps didn't get me lucky that easily.

I thought i'd ask if any of you have by accident stumbled across such a 
register or would have any good hints how i could narrow down the 
search. Otherwise i'll hack up renouveau to do a bit of pattern 
matching, searching for characteristic patterns in the brute force way 
and praying to the gods of computing that this won't take forever. To my 
surprise I already had to learn that apparently just reading the wrong 
registers can cause display corruption and crash the whole machine.

Any helpful comments highly appreciated.

Thanks,
-mario
